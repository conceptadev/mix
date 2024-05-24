import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../helpers/lerp_helpers.dart';
import 'icon_attribute.dart';

class IconSpec extends Spec<IconSpec> {
  final Color? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final TextDirection? textDirection;
  final bool? applyTextScaling;
  final List<Shadow>? shadows;
  final double? fill;

  const IconSpec({
    required this.color,
    required this.size,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.textDirection,
    this.applyTextScaling,
    this.fill,
    super.animatedData,
  });

  const IconSpec.empty()
      : color = null,
        size = null,
        weight = null,
        grade = null,
        opticalSize = null,
        shadows = null,
        textDirection = null,
        fill = null,
        applyTextScaling = null;

  static IconSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return mix.attributeOf<IconSpecAttribute>()?.resolve(mix) ??
        const IconSpec.empty();
  }

  static IconSpec from(MixData mix) {
    return mix.attributeOf<IconSpecAttribute>()?.resolve(mix) ??
        const IconSpec.empty();
  }

  @override
  IconSpec lerp(IconSpec? other, double t) {
    return IconSpec(
      color: Color.lerp(color, other?.color, t),
      size: lerpDouble(size, other?.size, t),
      weight: lerpDouble(weight, other?.weight, t),
      grade: lerpDouble(grade, other?.grade, t),
      opticalSize: lerpDouble(opticalSize, other?.opticalSize, t),
      shadows: Shadow.lerpList(shadows, other?.shadows, t),
      textDirection: lerpSnap(textDirection, other?.textDirection, t),
      applyTextScaling: lerpSnap(applyTextScaling, other?.applyTextScaling, t),
      fill: lerpDouble(fill, other?.fill, t),
    );
  }

  @override
  IconSpec copyWith({
    Color? color,
    double? size,
    double? fill,
    TextDirection? textDirection,
    double? weight,
    double? grade,
    double? opticalSize,
    List<Shadow>? shadows,
    String? semanticLabel,
    bool? applyTextScaling,
  }) {
    return IconSpec(
      color: color ?? this.color,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      shadows: shadows ?? this.shadows,
      textDirection: textDirection ?? this.textDirection,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
      fill: fill ?? this.fill,
    );
  }

  @override
  get props => [
        color,
        size,
        weight,
        grade,
        opticalSize,
        shadows,
        textDirection,
        applyTextScaling,
        fill,
      ];
}

class IconSpecTween extends Tween<IconSpec> {
  IconSpecTween({IconSpec? begin, IconSpec? end})
      : super(begin: begin, end: end);

  @override
  IconSpec lerp(double t) => begin!.lerp(end, t);
}
