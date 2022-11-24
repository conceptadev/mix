import 'package:benchmarks/common.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

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
          onNot(onHover)(p(10)),
          onNot(onPress)(p(15)),
          onNot(onFocus)(p(20)),
          onNot(onDisabled)(p(25)),
          onDark(p(30)),
          onPortrait(p(35)),
          onMedium(p(40)),
          onSmall(p(45)),
          onLight(p(50)),
          onXSmall(p(55)),
          onLarge(p(60)),
          onPortrait(p(65)),
        );

        watch.start();

        MixContext.create(context: context, mix: expensiveContextMix);

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
