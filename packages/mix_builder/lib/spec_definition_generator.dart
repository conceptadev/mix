// ignore_for_file: non_constant_identifier_names

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

import 'src/helpers/builder_utils.dart';
import 'src/helpers/method_builders.dart';
import 'src/helpers/mix_property.dart';
import 'src/types.dart';

Builder specDefinitionBuilder(BuilderOptions _) =>
    const SpecDefinitionBuilder();

final _emitter = DartEmitter(
  allocator: Allocator(),
  orderDirectives: true,
  useNullSafetySyntax: true,
);
final _dartFormatter = DartFormatter();

class SpecDefinitionBuilder implements Builder {
  const SpecDefinitionBuilder();
  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.dart': [
        '.g.dart',
      ],
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final specDefinitions =
        await loadSpecDefinitions(buildStep, _emitter, _dartFormatter);

    for (final specDefinition in specDefinitions) {
      final specLibrary = Library(
        (b) => b
          ..body.addAll([
            UtilityClassBuilder(specDefinition),
            MixinSpecBuilder(specDefinition),
            ClassSpecAttributeBuilder(specDefinition),
            ClassSpecTweenBuilder(specDefinition),
          ]),
      );

      final outputSpecId = buildStep.inputId.changeExtension('.g.dart');

      await buildStep.writeAsString(
        outputSpecId,
        _dartFormatter.format('${specLibrary.accept(_emitter)}'),
      );
    }
  }
}

Class ClassSpecBuilder(SpecDefinitionContext context) {
  final specRef = MixTypes.spec.symbol!;

  final specClassName = context.options.specClassName;
  final fields = context.fields;

  return Class((b) {
    b.name = specClassName;
    b.extend = refer('$specRef<$specClassName>');
    b.docs.addAll([
      '/// A specification that defines the visual properties of $specClassName.',
      '///',
      '/// To retrieve an instance of [$specClassName], use the [$specClassName.of] method with a',
      '/// [BuildContext], or the [$specClassName.from] method with [MixData]',
    ]);

    b.fields.addAll(fields.classFields);

    b.constructors.add(
      Constructor((builder) {
        builder.constant = true;
        builder.optionalParameters.addAll(fields.constructorParams);
        builder.docs.addAll([
          '/// Creates a [$specClassName] with the given fields',
          '///',
          '// All parameters are optional',
        ]);
      }),
    );

    b.methods.addAll([
      StaticMethodOfBuilder(className: specClassName),
      StaticMethodFromBuilder(className: specClassName),
      MethodCopyWithBuilder(className: specClassName, fields: fields),
      MethodLerpBuilder(
        className: specClassName,
        fields: fields,
        emitter: context.emitter,
      ),
      GetterPropsBuilder(className: specClassName, fields: fields),
    ]);
  });
}

Mixin MixinSpecBuilder(SpecDefinitionContext context) {
  final specClassName = context.options.specClassName;
  final specClassMixinName = context.options.specClassMixinName;
  final fields = context.fields;

  return Mixin((b) {
    b.name = specClassMixinName;
    b.on = refer('Spec<$specClassName>');

    b.methods.addAll([
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

Class ClassSpecAttributeBuilder(SpecDefinitionContext context) {
  final specClassName = context.options.specClassName;
  final specAttributeClassName = context.options.specAttributeClassName;
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
      MethodResolveBuilder(resolveToType: specClassName, fields: fields),
      MethodMergeBuilder(className: specAttributeClassName, fields: fields),
      GetterPropsBuilder(className: specAttributeClassName, fields: fields),
    ]);
  });
}

Class ClassSpecTweenBuilder(SpecDefinitionContext context) {
  final specClassName = context.options.specClassName;

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

Class UtilityClassBuilder(SpecDefinitionContext context) {
  final specClassName = context.options.specClassName;
  final specAttributeClassName = context.options.specAttributeClassName;
  final fields = context.fields;
  final utilityClassName = '${specClassName}Utility';
  final extendsType = 'SpecUtility<T, $specAttributeClassName>';

  return Class((b) {
    b.name = utilityClassName;
    b.extend = refer(extendsType);
    b.docs.addAll([
      '/// Utility class for configuring [$specAttributeClassName] properties.',
      '///',
      '/// This class provides methods to set individual properties of a [$specAttributeClassName].',
      '///',
      '/// Use the methods of this class to configure specific properties of a [$specAttributeClassName].',
    ]);

    b.types.add(refer('T extends Attribute'));

    b.fields.addAll(fields.utilityFields);

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

extension UtilityFieldsExtension on List<ParameterInfo> {
  Iterable<Field> get utilityFields {
    final fields = <Field>[];
    for (final field in this) {
      final utilityFieldName = field.name;
      final utilityFieldType = field.utilityType;
      fields.add(
        Field(
          (b) => b
            ..modifier = FieldModifier.final$
            ..late = true
            ..name = utilityFieldName
            ..assignment =
                Code('$utilityFieldType((v) => only(${field.name}: v))'),
        ),
      );
    }

    return fields;
  }
}

Method MethodOnlyBuilder({
  required String className,
  required List<ParameterInfo> fields,
}) {
  final fieldStatements = fields.map((e) {
    final fieldName = e.name;

    return Code('${fieldName}: $fieldName,');
  });
  return Method((b) {
    b.annotations.add(refer('override'));
    b.name = 'only';
    b.returns = refer('T');
    b.optionalParameters.addAll(fields.methodDtoParams);
    b.body = Block.of([
      Code('return builder($className('),
      Block.of(fieldStatements),
      Code('),);'),
    ]);
  });
}
