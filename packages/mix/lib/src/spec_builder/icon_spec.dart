import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../mix.dart';

part 'icon_spec.spec.dart';

@MixableSpec()
class IconDef extends Spec<IconDef> with IconDefMixable {
  final Color? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final TextDirection? textDirection;
  final bool? applyTextScaling;
  final List<Shadow>? shadows;
  final double? fill;

  const IconDef({
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
