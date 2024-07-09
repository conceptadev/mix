import 'package:flutter/cupertino.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'radio_spec.g.dart';

@MixableSpec()
base class RadioSpec extends Spec<RadioSpec> with _$RadioSpec {
  final BoxSpec container;
  final BoxSpec indicator;

  /// {@macro radio_spec_of}
  static const of = _$RadioSpec.of;

  static const from = _$RadioSpec.from;

  const RadioSpec({
    BoxSpec? container,
    BoxSpec? indicator,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const BoxSpec();
}
