import 'package:build/build.dart';
import 'package:mix_builder/src/dto_definition_generator.dart';
import 'package:mix_builder/src/spec_definition_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinition(BuilderOptions options) => PartBuilder(
      [SpecDefinitionBuilder()],
      '.g.dart',
      allowSyntaxErrors: true,
      options: options,
    );

Builder dtoDefinition(BuilderOptions options) => PartBuilder(
      [DtoDefinitionBuilder()],
      '.g.dart',
      allowSyntaxErrors: true,
      options: options,
    );
