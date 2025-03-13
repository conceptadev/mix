// ignore_for_file: avoid-unused-parameters

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/mixable_dto_generator.dart';
import 'src/generators/mixable_spec_generator.dart';
import 'src/generators/mixable_utility_generator.dart';

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

// Builder classUtilityDefinition(BuilderOptions options) => SharedPartBuilder(
//       [const MixableClassUtilityGenerator()],
//       'class_utility',
//       allowSyntaxErrors: true,
//     );

// Builder enumUtilityDefinition(BuilderOptions options) => SharedPartBuilder(
//       [MixableEnumUtilityGenerator()],
//       'enum_utility',
//       allowSyntaxErrors: true,
//     );

Builder utilityDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableUtilityGenerator()],
      'utility',
      allowSyntaxErrors: true,
    );

// Builder tokensDefinition(BuilderOptions options) => SharedPartBuilder(
//       [const MixableTokensGenerator()],
//       'tokens',
//       allowSyntaxErrors: true,
//     );
