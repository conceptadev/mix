import 'package:build/build.dart';
import 'package:mix_generator/src/mixable_dto_generator.dart';
import 'package:mix_generator/src/mixable_spec_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder specDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableSpecGenerator()],
      'spec',
      allowSyntaxErrors: true,
    );

Builder dtoDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableDtoGenerator()],
      'dto',
      allowSyntaxErrors: true,
    );
