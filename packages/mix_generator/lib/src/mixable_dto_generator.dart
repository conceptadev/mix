// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/builders/dto/class_utility_dto.dart';
import 'package:mix_generator/src/builders/dto/extension_value.dart';
import 'package:mix_generator/src/builders/dto/mixin_dto.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/helpers.dart';
import 'package:source_gen/source_gen.dart';

class MixableDtoGenerator extends GeneratorForAnnotation<MixableDto> {
  MixableDtoGenerator();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    final context = await _loadContext(element);

    final generateUtility = context.annotation.generateUtility;
    final generateValueExtension = context.annotation.generateValueExtension;

    final output = StringBuffer();

    output.writeln(dtoMixin(context));

    if (generateUtility) {
      output.writeln(dtoUtilityClass(context));
    }

    if (generateValueExtension) {
      output.writeln(toDtoExtension(context));
    }

    return dartFormat(output.toString());
  }

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

    if (!element.isDto) {
      throw InvalidGenerationSource(
        'The class ${element.name} must extend a class that extends Dto.',
        element: element,
      );
    }

    return ClassBuilderContext(
      annotation: _readDtoAnnotation(element),
      classElement: element,
    );
  }
}
