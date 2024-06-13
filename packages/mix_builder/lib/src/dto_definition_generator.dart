// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:mix_builder/src/helpers/mix_property.dart';
import 'package:mix_builder/src/helpers/settings.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';
import 'helpers/method_builders.dart';
import 'helpers/types.dart';

class DtoDefinitionBuilder extends GeneratorForAnnotation<MixableDto> {
  DtoDefinitionBuilder();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    final context = await _loadContext(
      element,
      DartEmitter(
        allocator: ReferenceTrackingAllocator(),
        orderDirectives: true,
        useNullSafetySyntax: true,
      ),
      DartFormatter(),
    );

    final skipUtility = context.annotation.skipUtility;
    final skipValueExtension = context.annotation.skipValueExtension;

    final dtoLibrary = Library((b) {
      b..body.add(_MixinDtoBuilder(context));

      if (!skipUtility) {
        b..body.add(_UtilityDtoClassBuilder(context));
      }

      if (!skipValueExtension) {
        b..body.add(_ValueExtensionBuilder(context));
      }
    });

    return context.generate(dtoLibrary);
  }
}

Extension _ValueExtensionBuilder(DtoAnnotationContext context) {
  final resolvedType = context.resolvedType;

  final dtoClassName = context.dtoClassName;

  final fieldStatements = context.fields.map((field) {
    final fieldName = field.name;
    final fieldNameRef = field.nullable ? '$fieldName?' : fieldName;

    if (field.hasDto) {
      if (field.isListType) {
        return Code('''
          $fieldName: $fieldNameRef.map((e) => e.toDto()).toList()
        ''');
      }
      return Code('$fieldName: $fieldNameRef.toDto()');
    }

    return Code('$fieldName: $fieldName');
  });

  return Extension((b) {
    b.name = '${resolvedType}Ext';
    b.on = refer(resolvedType!);

    b.methods.add(Method((b) {
      b.name = 'toDto';
      b.returns = refer(dtoClassName);
      b.body = Code('''
        return $dtoClassName(
          ${fieldStatements.join(',')},
        );
      ''');
    }));
  });
}

Class _UtilityDtoClassBuilder(DtoAnnotationContext context) {
  final className = context.dtoClassName;
  final resolvedType = context.resolvedType;

  final fields = context.fields;
  final utilityClassName = '${resolvedType}Utility';

  final specUtilityRef = MixTypes.foundation.dtoUtility;
  final extendsType = TypeReference((b) => b
    ..symbol = specUtilityRef.symbol
    ..types.add(refer('T'))
    ..types.add(refer(className))
    ..types.add(refer(resolvedType!)));

  return Class((b) {
    b.name = utilityClassName;
    b.extend = extendsType;
    b.modifier = ClassModifier.final$;
    b.docs.addAll([
      '/// Utility class for configuring [$className] properties.',
      '///',
      '/// This class provides methods to set individual properties of a [$className].',
      '///',
      '/// Use the methods of this class to configure specific properties of a [$className].',
    ]);

    b.types.add(refer('T extends Attribute'));

    b.fields.addAll(fields.getUtilityFields(className));

    b.constructors.add(
      Constructor((b) {
        b.requiredParameters.add(
          Parameter((b) {
            b.name = 'super.builder';
          }),
        );
        b.initializers.add(Code('super(valueToDto: (value) => value.toDto())'));
      }),
    );

    b.methods.addAll([
      MethodOnlyBuilder(
        className: className,
        fields: fields,
      ),
      _MethodCallBuilder(fields),
    ]);
  });
}

Method _MethodCallBuilder(List<ParameterInfo> fields) {
  return Method((b) {
    b.name = 'call';
    b.returns = refer('T');
    b.optionalParameters.addAll(fields.map((field) {
      return Parameter((b) {
        b.name = field.name;
        b.named = true;
        b.type = refer(field.asResolvedType).nullable;
      });
    }));

    final fieldStatements = fields.map((field) {
      final fieldName = field.name;

      if (field.hasDto) {
        if (field.isListType) {
          return Code('''
            $fieldName: $fieldName?.map((e) => e.toDto()).toList()
          ''');
        }
        return Code('$fieldName: $fieldName?.toDto()');
      }
      return Code('$fieldName: $fieldName');
    });

    b.body = Code('''
      return only(
        ${fieldStatements.join(',')},
      );
    ''');
  });
}

Mixin _MixinDtoBuilder(DtoAnnotationContext context) {
  final className = context.dtoClassName;
  final mixinName = context.dtoClassMixinName;

  final fields = context.fields;

  final dtoRef = MixTypes.foundation.dto.symbol!;

  final element = context.element;

  // Find the supertype that matches Dto
  final dtoSupertype = element.allSupertypes.firstWhere(
    (supertype) =>
        (supertype.getDisplayString(withNullability: false)).startsWith('Dto<'),
    orElse: () => throw InvalidGenerationSourceError(
      'The class $className must extend Dto.',
      element: element,
    ),
  );

  // check if ClassElement has a method getter called props
  final hasEquality = element.methods.any((method) => method.name == 'props');
  final hasResolve = element.methods.any((method) => method.name == 'resolve');
  final hasMerge = element.methods.any((method) => method.name == 'merge');

  // Get the generic type argument of Dto
  final valueType = dtoSupertype.typeArguments.first;

  final valueTypeName = valueType.getDisplayString(withNullability: false);

  final requiredParamOfResolver =
      _getRequiredParamsFromConstructor(valueType.element);

  return Mixin((b) {
    b.name = mixinName;
    b.on = refer('$dtoRef<$valueType>');

    if (!hasResolve) {
      b.methods.add(
        MethodResolveBuilder(
          resolveToType: valueTypeName,
          fields: fields,
          isInternalRef: true,
          requiredParamsOfResolver: requiredParamOfResolver,
        ),
      );
    }

    if (!hasMerge) {
      b.methods.add(
        MethodMergeBuilder(
          className: className,
          context: context,
          isInternalRef: true,
          shouldMergeLists: context.annotation.mergeLists,
        ),
      );
    }

    if (!hasEquality) {
      b.methods.add(
        GetterPropsBuilder(
          className: className,
          fields: fields,
          isInternalRef: true,
        ),
      );
    }

    b.methods.addAll([
      GetterSelfBuilder(className: className),
      ...MethodPrivateHelpers(context)
    ]);
  });
}

Future<DtoAnnotationContext> _loadContext(
  ClassElement classElement,
  DartEmitter emitter,
  DartFormatter formatter,
) async {
  final annotation = _typeChecker.firstAnnotationOfExact(classElement)!;

  final fields = sortedConstructorFields(classElement);
  final context = DtoAnnotationContext(
    element: classElement,
    emitter: emitter,
    formatter: formatter,
    annotation: _readDtoAnnotation(Settings(), ConstantReader(annotation)),
    fields: fields,
  );

  return context;
}

const _typeChecker = TypeChecker.fromRuntime(MixableDto);

MixableDto _readDtoAnnotation(
  Settings settings,
  ConstantReader reader,
) {
  final shouldMergeLists = reader.read('mergeLists').boolValue;

  final skipValueExtension = reader.read('skipValueExtension').boolValue;
  final skipUtility = reader.read('skipUtility').boolValue;

  return MixableDto(
    mergeLists: shouldMergeLists,
    skipValueExtension: skipValueExtension,
    skipUtility: skipUtility,
  );
}

List<ParameterElement> _getRequiredParamsFromConstructor(Element? element) {
  if (element is! ClassElement) return [];
  // Get the unnamed constructor of the generic type
  final constructor = element.unnamedConstructor;

  if (constructor != null) {
    // Get the required fields from the constructor parameters
    final requiredFields = constructor.parameters
        .where((param) => param.isRequiredNamed)
        .map((param) => param)
        .toList();

    // Print the required fields (for demonstration purposes)
    return requiredFields;
  }
  return [];
}
