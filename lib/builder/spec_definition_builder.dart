// ignore_for_file: non_constant_identifier_names

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'helpers/builder_utils.dart';
import 'helpers/field_info.dart';
import 'helpers/method_builders.dart';
import 'types.dart';

Builder specDefinitionBuilder(BuilderOptions _) =>
    const SpecDefinitionBuilder();

final _emitter = DartEmitter(allocator: Allocator(), orderDirectives: true);
final _dartFormatter = DartFormatter(fixes: StyleFix.all);

class SpecDefinitionBuilder implements Builder {
  const SpecDefinitionBuilder();
  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.dart': ['_spec.g.dart', '_util.g.dart', '_attribute.g.dart'],
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final specDefinitions = await loadSpecDefinitions(buildStep);

    for (final specDefinition in specDefinitions) {
      final outputSpecId = specDefinition.outputSpecFileId;
      final outputAttributeId = specDefinition.outputAttributeFileId;

      final specLibrary = Library(
        (b) => b
          ..body.addAll([
            ClassSpecBuilder(specDefinition),
            ClassSpecTweenBuilder(specDefinition),
          ])
          ..directives
              .add(Directive.import(outputAttributeId.pathSegments.last)),
      );

      final attributeLibrary = Library(
        (b) => b
          ..body.addAll([ClassSpecAttributeBuilder(specDefinition)])
          ..directives.add(Directive.import(outputSpecId.pathSegments.last)),
      );

      await buildStep.writeAsString(
        outputSpecId,
        _dartFormatter.format('${specLibrary.accept(_emitter)}'),
      );
      await buildStep.writeAsString(specDefinition.outputUtilFileId, '');
      await buildStep.writeAsString(
        outputAttributeId,
        _dartFormatter.format('${attributeLibrary.accept(_emitter)}'),
      );
    }
  }
}

Class ClassSpecBuilder(SpecDefinitionContext context) {
  final specRef = MixTypes.spec.symbol!;

  final specClassName = context.options.specClassName;
  final fields = context.options.fields;

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
        emitter: _emitter,
      ),
      GetterPropsBuilder(className: specClassName, fields: fields),
    ]);
  });
}

Class ClassSpecAttributeBuilder(SpecDefinitionContext context) {
  final specClassName = context.options.specClassName;
  final specAttributeClassName = context.options.specAttributeClassName;
  final fields = context.options.fields;
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
