// ignore_for_file: avoid-unused-parameters

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/mix_generator.dart';

Builder mixGenerator(BuilderOptions options) {
  return PartBuilder([MixGenerator()], '.g.dart');
}
