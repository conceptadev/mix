// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'builders/dto/mixin_spec.dart';
import 'builders/dto/utility_class_builder.dart';
import 'builders/spec/class_tween_spec.dart';
import 'builders/spec/spec_attribute_builder.dart';
import 'helpers/annotation_helpers.dart';
import 'helpers/base_generator.dart';
import 'helpers/field_info.dart';
import 'helpers/helpers.dart';

class MixableSpecGenerator extends BaseMixGenerator<MixableSpec> {
  const MixableSpecGenerator();

  @override
  AnnotatedClassBuilderContext<MixableSpec> createClassContext(
    ClassElement element,
    ConstantReader annotation,
  ) {
    return AnnotatedClassBuilderContext(
      element: element,
      annotation: readMixableSpec(element),
    );
  }

  @override
  String generateCode(AnnotatedClassBuilderContext<MixableSpec> context) {
    final deprecatedRule = context.fields.any((e) => e.hasDeprecated)
        ? '// ignore_for_file: deprecated_member_use_from_same_package'
        : '';

    final skipUtility = context.annotation.skipUtility;

    final specAttribute = specAttributeBuilder(
      context: context,
      shouldMergeLists: true,
    );

    final utilityBuilder =
        utilityClassBuilder(context: context, isDto: false, isSpec: true);

    final utilityDefinition = skipUtility ? '' : utilityBuilder.build();

    final specMixin = specMixinBuilder(
      context: context,
      specAttributeName: specAttribute.definition.name,
    );

    final output = '''
    $deprecatedRule
    
    $specMixin

    ${specAttribute.build()}

    $utilityDefinition

    ${specTweenClass(context.definition)}
    ''';

    return dartFormat(output);
  }
}
