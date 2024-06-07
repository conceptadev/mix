import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/spec_definition_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinitionBuilder(BuilderOptions _) =>
    PartBuilder([SpecDefinitionGenerator()], '.g.dart',
        allowSyntaxErrors: true);

class SpecDefinitionGenerator extends GeneratorForAnnotation<MixSpec> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The @MixSpec can only be applied to classes.',
        element: element,
      );
    }

    final fields = sortedConstructorFields(element, null);
    final specDefinition = SpecDefinitionContext(
      emitter: DartEmitter(allocator: Allocator()),
      formatter: DartFormatter(),
      fields: fields,
      options: SpecDefinitionOptions(
        name: annotation.peek('name')?.stringValue ?? element.name,
      ),
    );

    final specCode = [
      // ClassSpecBuilder(specDefinition),
      ClassSpecTweenBuilder(specDefinition).accept(specDefinition.emitter),
      MixinSpecBuilder(specDefinition).accept(specDefinition.emitter),
      ClassSpecAttributeBuilder(specDefinition).accept(specDefinition.emitter)
    ];

    final outputCode = specDefinition.formatter.format(specCode.join('\n'));

    // Get the file name from the input file
    final inputId = buildStep.inputId;

    print('$outputCode');
    return '''
// GENERATED CODE - DO NOT MODIFY BY HAND

$outputCode

''';
  }
}
