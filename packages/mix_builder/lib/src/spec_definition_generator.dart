// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix/annotations.dart';
import 'package:mix_builder/src/builders/spec/class_attribute_spec.dart';
import 'package:mix_builder/src/builders/spec/class_spec_utility.dart';
import 'package:mix_builder/src/builders/spec/class_tween_spec.dart';
import 'package:mix_builder/src/builders/spec/mixin_spec.dart';
import 'package:mix_builder/src/helpers/declaration_provider.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_builder/src/helpers/settings.dart';
import 'package:mix_builder/src/helpers/visitors.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

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

    final classVisitor = ClassVisitor();
    element.visitChildren(classVisitor);

    final context = await _loadContext(
      element,
      classVisitor.parameters.values.toList(),
      buildStep,
    );

    final output = '''
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
    declarationProvider: DeclarationProvider(
      registry: GenerationRegistry.get(buildStep.inputId),
    ),
    fields: params,
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
