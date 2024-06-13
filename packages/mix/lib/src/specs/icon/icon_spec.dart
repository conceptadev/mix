import 'package:flutter/material.dart';
import 'package:mix/annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'icon_spec.g.dart';

@MixableSpec()
final class IconSpec extends Spec<IconSpec> with _$IconSpec {
  final Color? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final TextDirection? textDirection;
  final bool? applyTextScaling;

  @MixableField()
  // TODO: add shadow utility
  final List<Shadow>? shadows;
  final double? fill;

  static const of = _$IconSpec.of;

  static const from = _$IconSpec.from;

  const IconSpec({
    this.color,
    this.size,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.textDirection,
    this.applyTextScaling,
    this.fill,
    super.animated,
  });
}

extension IconSpecUtilityExt<T extends Attribute> on IconSpecUtility<T> {
  ShadowUtility get shadow => ShadowUtility((v) => only(shadows: [v]));
}
