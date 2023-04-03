import 'package:benchmarks/common.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

/// flutter run -t lib/context.dart --release
void main() async {
  assert(
    false,
    "Don't run benchmarks in debug mode! Use 'flutter run --release'.",
  );

  final printer = BenchmarkResultPrinter();
  final watch = Stopwatch();

  testWidgets('Build', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        final expensiveContextMix = Mix(
          onNot(onHover)(padding(10)),
          onNot(onPress)(padding(15)),
          onNot(onFocus)(p(20)),
          onNot(onDisabled)(padding(25)),
          onDark(padding(30)),
          onPortrait(padding(35)),
          onMedium(padding(40)),
          onSmall(padding(45)),
          onLight(padding(50)),
          onXSmall(padding(55)),
          onLarge(padding(60)),
          onPortrait(padding(65)),
        );

        watch.start();

        MixData.create(context: context, mix: expensiveContextMix);

        watch.stop();

        printer.addResult(
          description: 'Build an expensive context mix',
          value: watch.elapsedMicroseconds.toDouble(),
          unit: 'microseconds',
          name: 'build_mix_context_bench',
        );
        printer.printToStdout();

        return Placeholder();
      }),
    ));
  });
}
