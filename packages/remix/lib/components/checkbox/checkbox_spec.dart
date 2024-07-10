import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'checkbox_spec.g.dart';

@MixableSpec()
base class CheckboxSpec extends Spec<CheckboxSpec> with _$CheckboxSpec {
  final BoxSpec container;
  final IconSpec indicator;

  /// {@macro button_spec_of}
  static const of = _$CheckboxSpec.of;

  static const from = _$CheckboxSpec.from;

  const CheckboxSpec({
    BoxSpec? container,
    IconSpec? indicator,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const IconSpec();
}
