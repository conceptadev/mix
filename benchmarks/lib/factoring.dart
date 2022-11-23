import 'package:benchmarks/common.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

void main() {
  assert(
    false,
    "Don't run benchmarks in debug mode! Use 'flutter run --release'.",
  );

  final printer = BenchmarkResultPrinter();
  final watch = Stopwatch();

  final firstMix = Mix(
    height(100),
    animated(),
    marginY(10),
    // elevation(10),
    rounded(10),
    bgColor(Color(0xFF00FF80)),
    textStyle(TextStyle()),
    textColor(Color(0xFFFFFFFF)),
    onHover(
      // elevation(2),
      padding(20),
      bgColor(Color(0xFFFFFF80)),
      textColor(Color(0xFF000000)),
    ),
  );

  final secondMix = Mix(
    width(100),
    marginX(10),
    shadow(spreadRadius: 100),
    rounded(100),
    bgColor(Color(0xFF00FF80)),
    borderColor(Color(0xFF984F9B)),
    onHover(
      shadow(spreadRadius: 2),
      margin(20),
      bgColor(Color(0xFFFFFF80)),
      textColor(Color(0xFF000000)),
    ),
  );

  watch.start();

  Mix.combine(firstMix, secondMix);

  watch.stop();

  printer.addResult(
    description: 'Combine two extense mixes',
    value: watch.elapsedMicroseconds.toDouble(),
    unit: 'microseconds',
    name: 'combine_mix_bench',
  );
  printer.printToStdout();
}
