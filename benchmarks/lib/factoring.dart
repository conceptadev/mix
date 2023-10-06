import 'package:benchmarks/common.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// flutter run -t lib/factoring.dart --release
void main() {
  assert(
    false,
    "Don't run benchmarks in debug mode! Use 'flutter run --release'.",
  );

  final printer = BenchmarkResultPrinter();
  final watch = Stopwatch();

  {
    final firstMix = StyleMix(
      height(100),
      animation(),
      marginVertical(10),
      rounded(10),
      backgroundColor(Color(0xFF00FF80)),
      textStyle(as: TextStyle(), color: Color(0xFFFFFFFF)),
      onHover(
        padding(20),
        backgroundColor(Color(0xFFFFFF80)),
        textStyle(color: Color(0xFF000000)),
      ),
    );

    final secondMix = StyleMix(
      width(100),
      marginHorizontal(10),
      shadow(spreadRadius: 100),
      rounded(100),
      backgroundColor(Color(0xFF00FF80)),
      border(color: Color(0xFF984F9B)),
      onPress(
        shadow(spreadRadius: 2),
        margin(20),
        backgroundColor(Color(0xFFFFFF80)),
        textStyle(color: Color(0xFF000000)),
      ),
    );

    watch.start();

    StyleMix.combine([firstMix, secondMix]);

    watch.stop();

    printer.addResult(
      description: 'Combine two extense mixes',
      value: watch.elapsedMicroseconds.toDouble(),
      unit: 'microseconds',
      name: 'combine_mix_bench',
    );
  }

  watch.reset();

  {
    watch.start();

    StyleMix.combine([
      StyleMix(backgroundColor(Colors.black)),
      StyleMix(textStyle(color: Colors.black)),
      StyleMix(margin(20)),
      StyleMix(rounded(10)),
      StyleMix(border(color: Colors.black)),
    ]);

    watch.stop();

    printer.addResult(
      description: 'Combine multiple mixes',
      value: watch.elapsedMicroseconds.toDouble(),
      unit: 'microseconds',
      name: 'combine_multiple_mixes_bench',
    );
  }

  watch.reset();

  {
    final hasError = Variant('hasError');
    final mix = StyleMix(
      hasError(
        padding(20),
        backgroundColor(Color(0xFFFFFF80)),
        textStyle(color: Color(0xFF000000)),
      ),
    );

    watch.start();

    mix.selectVariant(hasError);

    watch.stop();

    printer.addResult(
      description: 'Apply a variant to a mix',
      value: watch.elapsedMicroseconds.toDouble(),
      unit: 'microseconds',
      name: 'apply_variant_bench',
    );
  }

  watch.reset();

  {
    final mix = StyleMix(
      onDisabled(padding(20)),
      onFocus(backgroundColor(Color(0xFFFFFF80))),
      onHover(textStyle(color: Color(0xFF000000))),
      onPress(textStyle(backgroundColor: Color(0xFF964234))),
      onDark(textStyle(height: 10)),
      onLight(textStyle(shadow: Shadow(color: Color(0xFF000000)))),
    );

    watch.start();

    mix.selectVariants([
      onDisabled,
      onFocus,
      onHover,
      onPress,
      onDark,
      onLight,
    ]);

    watch.stop();

    printer.addResult(
      description: 'Apply multiple variants to a mix',
      value: watch.elapsedMicroseconds.toDouble(),
      unit: 'microseconds',
      name: 'apply_multiple_variants_bench',
    );
  }
  printer.printToStdout();
}
