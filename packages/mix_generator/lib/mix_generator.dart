// ignore_for_file: avoid-unused-parameters

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

import 'src/mix_generator.dart';

Builder mixGenerator(BuilderOptions options) {
  return PartBuilder(
    [MixGenerator()],
    '.g.dart',
    formatOutput: (code, version) {
      return DartFormatter(languageVersion: version).format(code);
    },
  );
}
