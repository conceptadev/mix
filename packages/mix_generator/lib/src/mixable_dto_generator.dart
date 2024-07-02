// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/builders/dto/class_utility_dto.dart';
import 'package:mix_generator/src/builders/dto/extension_value.dart';
import 'package:mix_generator/src/builders/dto/mixin_dto.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/settings.dart';
import 'package:mix_generator/src/helpers/visitors.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

class MixableDtoGenerator extends GeneratorForAnnotation<MixableDto> {
  MixableDtoGenerator();

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

    final context = await _readContext(
      element,
      classVisitor.parameters.values.toList(),
      buildStep,
    );

    final generateUtility = context.annotation.generateUtility;
    final generateValueExtension = context.annotation.generateValueExtension;

    final output = StringBuffer();

    output.writeln(dtoMixin(context));

    if (generateUtility) {
      output.writeln(dtoUtilityClass(context));
    }

    if (generateValueExtension) {
      output.writeln(dtoValueExtension(context));
      output.writeln(dtoListValueExtension(context));
    }

    final result = context.generate(output.toString());

    return result;
  }

  Future<DtoAnnotationContext> _readContext(
    ClassElement classElement,
    List<ParameterInfo> params,
    BuildStep buildStep,
  ) async {
    final annotation = typeChecker.firstAnnotationOfExact(classElement)!;

    final context = DtoAnnotationContext(
      element: classElement,
      annotation: _readDtoAnnotation(Settings(), ConstantReader(annotation)),
      fields: params,
    );

    return context;
  }
}

MixableDto _readDtoAnnotation(
  Settings settings,
  ConstantReader reader,
) {
  final shouldMergeLists = reader.read('mergeLists').boolValue;

  final generateValueExtension =
      reader.read('generateValueExtension').boolValue;
  final generateUtility = reader.read('generateUtility').boolValue;

  return MixableDto(
    mergeLists: shouldMergeLists,
    generateValueExtension: generateValueExtension,
    generateUtility: generateUtility,
  );
}
