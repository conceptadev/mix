import 'package:build/build.dart';
import 'package:mix_generator/src/mixable_dto_generator.dart';
import 'package:mix_generator/src/mixable_spec_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinition(BuilderOptions options) => PartBuilder(
      [MixableSpecGenerator()],
      '.g.dart',
      allowSyntaxErrors: true,
      options: options,
    );

Builder dtoDefinition(BuilderOptions options) => PartBuilder(
      [MixableDtoGenerator()],
      '.g.dart',
      allowSyntaxErrors: true,
      options: options,
    );
