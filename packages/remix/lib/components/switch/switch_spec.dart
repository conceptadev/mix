import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'switch_spec.g.dart';

@MixableSpec()
base class SwitchSpec extends Spec<SwitchSpec> with _$SwitchSpec {
  final BoxSpec container;
  final BoxSpec indicator;

  static const of = _$SwitchSpec.of;

  static const from = _$SwitchSpec.from;

  const SwitchSpec({
    BoxSpec? container,
    BoxSpec? indicator,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const BoxSpec();
}
