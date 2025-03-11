// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'builders/dto/extension_value.dart';
import 'builders/dto/mixin_dto.dart';
import 'builders/dto/utility_class_builder.dart';
import 'helpers/base_generator.dart';
import 'helpers/field_info.dart';
import 'helpers/helpers.dart';

class MixableDtoGenerator extends BaseMixGenerator<MixableDto> {
  const MixableDtoGenerator();

  @override
  AnnotatedClassBuilderContext<MixableDto> createClassContext(
    ClassElement element,
    ConstantReader annotation,
  ) {
    return AnnotatedClassBuilderContext(
      element: element,
      annotation: MixableDto(
        mergeLists: annotation.read('mergeLists').boolValue,
        generateValueExtension:
            annotation.read('generateValueExtension').boolValue,
        generateUtility: annotation.read('generateUtility').boolValue,
      ),
    );
  }

  @override
  String generateCode(AnnotatedClassBuilderContext<MixableDto> context) {
    final generateUtility = context.annotation.generateUtility;
    final generateValueExtension = context.annotation.generateValueExtension;

    final mixinBuilder = DtoMixinBuilder(
      context: context,
      type: MixinType.dto,
    );

    final output = StringBuffer();

    output.writeln(mixinBuilder.build());

    if (generateUtility) {
      final utilityClass =
          utilityClassBuilder(context: context, isDto: true, isSpec: false);
      output.writeln(utilityClass.build());
    }

    if (generateValueExtension) {
      output.writeln(toRefTypeExtension(context));
    }

    return dartFormat(output.toString());
  }
}
