// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mix/annotations.dart';
import 'package:mix_builder/src/builders/dto/class_utility_dto.dart';
import 'package:mix_builder/src/builders/dto/extension_value.dart';
import 'package:mix_builder/src/builders/dto/mixin_dto.dart';
import 'package:mix_builder/src/helpers/declaration_provider.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/settings.dart';
import 'package:mix_builder/src/helpers/visitors.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

class DtoDefinitionBuilder extends GeneratorForAnnotation<MixableDto> {
  DtoDefinitionBuilder();

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

    final skipUtility = context.annotation.skipUtility;
    final skipValueExtension = context.annotation.skipValueExtension;

    final output = StringBuffer();

    output.writeln(dtoMixin(context));

    if (!skipUtility) {
      output.writeln(dtoUtilityClass(context));
    }

    if (!skipValueExtension) {
      output.writeln(dtoValueExtension(context));
    }

    final result = context.generate(output.toString());

    return result;
  }
}

Future<DtoAnnotationContext> _loadContext(
  ClassElement classElement,
  List<ParameterInfo> params,
  BuildStep buildStep,
) async {
  final annotation = _typeChecker.firstAnnotationOfExact(classElement)!;

  final context = DtoAnnotationContext(
    element: classElement,
    declarationProvider: DeclarationProvider(
      registry: GenerationRegistry.get(buildStep.inputId),
    ),
    annotation: _readDtoAnnotation(Settings(), ConstantReader(annotation)),
    fields: params,
  );

  return context;
}

const _typeChecker = TypeChecker.fromRuntime(MixableDto);

MixableDto _readDtoAnnotation(
  Settings settings,
  ConstantReader reader,
) {
  final shouldMergeLists = reader.read('mergeLists').boolValue;

  final skipValueExtension = reader.read('skipValueExtension').boolValue;
  final skipUtility = reader.read('skipUtility').boolValue;

  return MixableDto(
    mergeLists: shouldMergeLists,
    skipValueExtension: skipValueExtension,
    skipUtility: skipUtility,
  );
}
