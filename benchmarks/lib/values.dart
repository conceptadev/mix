import 'package:benchmarks/common.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:mix/mix.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

/// flutter run -d windows -t lib/values.dart --release
void main() async {
  assert(
    false,
    "Don't run benchmarks in debug mode! Use 'flutter run --release'.",
  );

  final printer = BenchmarkResultPrinter();
  final watch = Stopwatch();

  {
    watch.start();

    final variant = Variant('light');
    Mix.fromValues(MixValues.create([
      bgColor(Color(0xFFFFFFFFF)), // directive
      variant(textColor(Color(0xFF000000))), // variant
      onHover(textColor(Color(0xFF645876))), // context
      scale(2.0), // decorator
    ]));

    watch.stop();

    printer.addResult(
      description: 'Create a Mix from values',
      value: watch.elapsedMicroseconds.toDouble(),
      unit: 'microseconds',
      name: 'create_mix_from_values_bench',
    );
  }
  printer.printToStdout();
}
