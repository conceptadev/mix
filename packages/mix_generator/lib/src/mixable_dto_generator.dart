// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'builders/dto/class_mixin.dart';
import 'builders/dto/class_utility.dart';
import 'builders/dto/extension_value.dart';
import 'helpers/builder_utils.dart';
import 'helpers/field_info.dart';
import 'helpers/helpers.dart';

class MixableDtoGenerator extends GeneratorForAnnotation<MixableDto> {
  const MixableDtoGenerator();

  MixableDto _readDtoAnnotation(ClassElement classElement) {
    final annotation = typeChecker.firstAnnotationOfExact(classElement);

    if (annotation == null) {
      throw InvalidGenerationSourceError(
        'No MixableSpec annotation found on the class',
        element: classElement,
      );
    }

    final reader = ConstantReader(annotation);

    return MixableDto(
      mergeLists: reader.read('mergeLists').boolValue,
      generateValueExtension: reader.read('generateValueExtension').boolValue,
      generateUtility: reader.read('generateUtility').boolValue,
    );
  }

  ClassBuilderContext<MixableDto> _loadContext(Element element) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    if (!element.isDto && !element.isSpecAttribute) {
      throw InvalidGenerationSource(
        'The class ${element.name} must extend a class that extends Dto.',
        element: element,
      );
    }

    return ClassBuilderContext(
      classElement: element,
      annotation: _readDtoAnnotation(element),
    );
  }

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    final context = _loadContext(element);

    final generateUtility = context.annotation.generateUtility;
    final generateValueExtension = context.annotation.generateValueExtension;

    final output = StringBuffer();

    output.writeln(classMixin(context));

    if (generateUtility) {
      output.writeln(utilityClass(context));
    }

    if (generateValueExtension) {
      output.writeln(toRefTypeExtension(context));
    }

    return dartFormat(output.toString());
  }
}
