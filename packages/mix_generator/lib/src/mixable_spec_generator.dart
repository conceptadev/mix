// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/builders/spec/class_attribute_spec.dart';
import 'package:mix_generator/src/builders/spec/class_spec_utility.dart';
import 'package:mix_generator/src/builders/spec/class_tween_spec.dart';
import 'package:mix_generator/src/builders/spec/mixin_spec.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_generator/src/helpers/settings.dart';
import 'package:mix_generator/src/helpers/visitors.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

class MixableSpecGenerator extends GeneratorForAnnotation<MixableSpec> {
  const MixableSpecGenerator();

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

    final classVisitor = CustomVisitor();
    element.visitChildren(classVisitor);

    final context = await _loadContext(
      element,
      classVisitor.parameters.values.toList(),
      buildStep,
    );

    final output = '''

    // ignore_for_file: deprecated_member_use_from_same_package

    ${specMixin(context)}

    ${specAttributeClass(context)}

    ${specUtilityClass(context)}

    ${specTweenClass(context)}
    ''';

    return context.generate(output);
  }
}

Future<SpecAnnotationContext> _loadContext(
  ClassElement classElement,
  List<ParameterInfo> params,
  BuildStep buildStep,
) async {
  final annotation =
      _specDefinitionTypeChecker.firstAnnotationOfExact(classElement)!;

  final specDefinition = SpecAnnotationContext(
    element: classElement,
    annotation: _readSpecAnnotation(Settings(), ConstantReader(annotation)),
    fields: params,
  );

  return specDefinition;
}

const _specDefinitionTypeChecker = TypeChecker.fromRuntime(MixableSpec);

MixableSpec _readSpecAnnotation(
  Settings settings,
  ConstantReader reader,
) {
  return MixableSpec();
}
