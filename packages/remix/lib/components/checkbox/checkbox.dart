import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/helpers/utility_extension.dart';
import 'package:remix/helpers/variant.dart';

import '../../tokens/remix_tokens.dart';

part 'checkbox.g.dart';
part 'checkbox_style.dart';
part 'checkbox_variants.dart';
part 'checkbox_widget.dart';

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
