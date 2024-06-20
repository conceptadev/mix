import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'button_spec.g.dart';

@MixableSpec()
base class ButtonSpec extends Spec<ButtonSpec> with _$ButtonSpec {
  final BoxSpec? container;
  final IconSpec? icon;
  final TextSpec? label;

  const ButtonSpec({
    this.container,
    this.icon,
    this.label,
    super.animated,
  });
}
