import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'button_spec.g.dart';

@MixableSpec()
base class ButtonSpec extends Spec<ButtonSpec> with _$ButtonSpec {
  final FlexSpec flex;
  final BoxSpec container;
  final IconSpec icon;
  final TextSpec label;

  /// {@macro button_spec_of}
  static const of = _$ButtonSpec.of;

  static const from = _$ButtonSpec.from;

  const ButtonSpec({
    BoxSpec? container,
    FlexSpec? flex,
    IconSpec? icon,
    TextSpec? label,
    super.animated,
  })  : flex = flex ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec();
}
