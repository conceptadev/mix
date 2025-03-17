// ignore_for_file: avoid-unused-parameters

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/mixable_dto_generator.dart';
import 'src/generators/mixable_spec_generator.dart';
import 'src/generators/mixable_utility_generator.dart';

/// A combined builder that runs all Mix generators at once
Builder mixBuilder(BuilderOptions options) => LibraryBuilder(
      MultiGenerator([
        MixableSpecGenerator(),
        MixableResolvableGenerator(),
        MixableUtilityGenerator(),
      ]),
      generatedExtension: '.g.dart',
      allowSyntaxErrors: true,
    );

Builder specDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableSpecGenerator()],
      'spec',
      allowSyntaxErrors: true,
    );

Builder dtoDefinition(BuilderOptions options) => SharedPartBuilder(
      [MixableResolvableGenerator()],
      'dto',
      allowSyntaxErrors: true,
    );

// Builder classUtilityDefinition(BuilderOptions options) => SharedPartBuilder(
//       [const MixableClassUtilityGenerator()],
//       'class_utility',
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

/// A generator that combines multiple generators
class MultiGenerator implements Generator {
  final List<Generator> generators;

  const MultiGenerator(this.generators);

  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final outputs = <String>[];

    for (final generator in generators) {
      final output = await generator.generate(library, buildStep);
      if (output != null && output.isNotEmpty) {
        outputs.add(output);
      }
    }

    return outputs.isEmpty ? null : outputs.join('\n\n');
  }
}
