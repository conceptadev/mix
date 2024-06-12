// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:mix_builder/src/helpers/settings.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';
import 'helpers/method_builders.dart';
import 'helpers/mix_property.dart';
import 'helpers/types.dart';

class SpecDefinitionBuilder extends GeneratorForAnnotation<MixableSpec> {
  const SpecDefinitionBuilder();

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
        DartFormatter());

    final specLibrary = Library((b) => b
      ..body.addAll([
        MixinSpecBuilder(context),
        ClassSpecAttributeBuilder(context),
        UtilityClassBuilder(context),
        ClassSpecTweenBuilder(context),
        ...MethodPrivateHelpers(context),
      ]));

    return context.generate(specLibrary);
  }
}

Mixin MixinSpecBuilder(SpecAnnotationContext context) {
  final specClassName = context.specClassName;
  final specClassMixinName = context.specClassMixinName;
  final attributeName = context.specAttributeClassName;
  final fields = context.fields;

  final specRef = MixTypes.foundation.spec.symbol!;

  return Mixin((b) {
    b.name = specClassMixinName;
    b.on = refer('$specRef<$specClassName>');

    b.methods.addAll([
      StaticMethodFromBuilder(
        specName: specClassName,
        attributeName: attributeName,
      ),
      StaticMethodOfBuilder(
        specName: specClassName,
        mixinName: specClassMixinName,
      ),
      MethodCopyWithBuilder(
          className: specClassName, fields: fields, isInternalRef: true),
      MethodLerpBuilder(
          className: specClassName,
          fields: fields,
          emitter: context.emitter,
          isInternalRef: true),
      GetterPropsBuilder(
          className: specClassName, fields: fields, isInternalRef: true),
      GetterSelfBuilder(className: specClassName),
    ]);
  });
}

Class ClassSpecAttributeBuilder(SpecAnnotationContext context) {
  final specClassName = context.specClassName;
  final specAttributeClassName = context.specAttributeClassName;
  final fields = context.fields;
  final extendsType = 'SpecAttribute<$specClassName>';

  return Class((b) {
    b.name = specAttributeClassName;
    b.extend = refer(extendsType);
    b.docs.addAll([
      '/// Represents the attributes of a [$specClassName].',
      '///',
      '/// This class encapsulates properties defining the layout and',
      '/// appearance of a [$specClassName].',
      '///',
      '/// Use this class to configure the attributes of a [$specClassName] and pass it to',
      '/// the [$specClassName] constructor.',
    ]);

    b.fields.addAll(fields.classDtoFields);
    // Constructor
    b.constructors.add(
      Constructor((builder) {
        builder.constant = true;
        builder.optionalParameters.addAll(fields.constructorParams);
      }),
    );

    b.methods.addAll([
      MethodResolveBuilder(
        resolveToType: specClassName,
        fields: fields,
      ),
      MethodMergeBuilder(className: specAttributeClassName, context: context),
      GetterPropsBuilder(className: specAttributeClassName, fields: fields),
    ]);
  });
}

Class ClassSpecTweenBuilder(SpecAnnotationContext context) {
  final specClassName = context.specClassName;

  return Class((builder) {
    builder.docs.addAll([
      '/// A tween that interpolates between two [$specClassName] instances.',
      '///',
      '/// This class can be used in animations to smoothly transition between',
      '/// different [$specClassName] specifications.',
    ]);
    builder.name = '${specClassName}Tween';
    builder.extend = refer('Tween<$specClassName?>');

    final constructorParams = [
      Parameter((b) {
        b.name = 'super.begin';
        b.named = true;
      }),
      Parameter((b) {
        b.name = 'super.end';
        b.named = true;
      }),
    ];

    // Constructor
    builder.constructors.add(
      Constructor((builder) {
        builder.optionalParameters.addAll(constructorParams);
      }),
    );

    // lerp method
    builder.methods.add(Method((b) {
      b.name = 'lerp';
      b.annotations.add(refer('override'));
      b.returns = refer(specClassName);
      b.requiredParameters.add(Parameter((b) {
        b.name = 't';
        b.type = refer('double');
      }));
      b.body = Code('''
              if (begin == null && end == null) return const $specClassName();
              if (begin == null) return end!;
              
              return begin!.lerp(end!, t);
            ''');
    }));
  });
}

Class UtilityClassBuilder(SpecAnnotationContext context) {
  final specClassName = context.specClassName;
  final specAttributeClassName = context.specAttributeClassName;
  final fields = context.fields;
  final utilityClassName = '${specClassName}Utility';

  final specUtilityRef = MixTypes.foundation.specUtility;
  final extendsType = TypeReference((b) => b
    ..symbol = specUtilityRef.symbol
    ..types.add(refer('T'))
    ..types.add(refer(specAttributeClassName)));

  return Class((b) {
    b.name = utilityClassName;
    b.extend = extendsType;
    b.docs.addAll([
      '/// Utility class for configuring [$specAttributeClassName] properties.',
      '///',
      '/// This class provides methods to set individual properties of a [$specAttributeClassName].',
      '///',
      '/// Use the methods of this class to configure specific properties of a [$specAttributeClassName].',
    ]);

    b.types.add(refer('T extends Attribute'));

    b.fields.addAll(fields.getUtilityFields(specAttributeClassName));

    b.constructors.add(
      Constructor((builder) {
        builder.requiredParameters.add(
          Parameter((b) {
            b.name = 'super.builder';
          }),
        );
        ;
      }),
    );

    b.methods.add(
      MethodOnlyBuilder(
        className: specAttributeClassName,
        fields: fields,
      ),
    );
  });
}

Future<SpecAnnotationContext> _loadContext(
  ClassElement classElement,
  DartEmitter emitter,
  DartFormatter formatter,
) async {
  final annotation =
      _specDefinitionTypeChecker.firstAnnotationOfExact(classElement)!;

  final fields = sortedConstructorFields(classElement, null);
  final specDefinition = SpecAnnotationContext(
    element: classElement,
    emitter: emitter,
    formatter: formatter,
    annotation: _readSpecAnnotation(Settings(), ConstantReader(annotation)),
    fields: fields,
  );

  return specDefinition;
}

const _specDefinitionTypeChecker = TypeChecker.fromRuntime(MixableSpec);

MixableSpec _readSpecAnnotation(
  Settings settings,
  ConstantReader reader,
) {
  final utilityName = reader.peek('utilityName')?.stringValue;
  final attributeName = reader.peek('attributeName')?.stringValue;

  return MixableSpec(
    utilityName: utilityName,
    attributeName: attributeName,
  );
}
