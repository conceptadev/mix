import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'badge_spec.g.dart';

@MixableSpec()
base class BadgeSpec extends Spec<BadgeSpec> with _$BadgeSpec {
  final BoxSpec container;
  final TextSpec label;

  /// {@macro badge_spec_of}
  static const of = _$BadgeSpec.of;

  static const from = _$BadgeSpec.from;

  const BadgeSpec({
    BoxSpec? container,
    TextSpec? label,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        label = label ?? const TextSpec();
}
