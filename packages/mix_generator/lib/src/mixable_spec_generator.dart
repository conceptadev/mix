// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'builders/spec/class_attribute_spec.dart';
import 'builders/spec/class_spec_utility.dart';
import 'builders/spec/class_tween_spec.dart';
import 'builders/spec/mixin_spec.dart';
import 'helpers/annotation_helpers.dart';
import 'helpers/field_info.dart';
import 'helpers/helpers.dart';
import 'package:source_gen/source_gen.dart';

class MixableSpecGenerator extends GeneratorForAnnotation<MixableSpec> {
  const MixableSpecGenerator();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    final context = _loadContext(element);

    final deprecatedRule = context.fields.any((e) => e.hasDeprecated)
        ? '// ignore_for_file: deprecated_member_use_from_same_package'
        : '';

    final output = '''
    $deprecatedRule
    
    ${specMixin(context)}

    ${specAttributeClass(context)}

    ${specUtilityClass(context)}

    ${specTweenClass(context)}
    ''';

    return dartFormat(output);
  }

  ClassBuilderContext<MixableSpec> _loadContext(Element element) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    return ClassBuilderContext(
      annotation: readMixableSpec(element),
      classElement: element,
    );
  }
}
