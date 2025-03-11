import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'field_info.dart';
import 'helpers.dart';

abstract class BaseMixGenerator<T> extends GeneratorForAnnotation<T> {
  const BaseMixGenerator();

  // Common validation methods
  ClassElement validateClassElement(Element element) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }
    if (element.isAbstract) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a concrete class.',
        element: element,
      );
    }

    return element;
  }

  // Create context from element
  AnnotatedClassBuilderContext<T> createClassContext(
    ClassElement element,
    ConstantReader annotation,
  );

  // Generate code based on context
  String generateCode(AnnotatedClassBuilderContext<T> context);

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final classElement = validateClassElement(element);
    final context = createClassContext(classElement, annotation);

    return dartFormat(generateCode(context));
  }
}
