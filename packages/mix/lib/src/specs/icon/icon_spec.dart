import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/models/animated_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../internal/lerp_helpers.dart';
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

  const IconSpec.exhaustive({
    required this.color,
    required this.size,
    required this.weight,
    required this.grade,
    required this.opticalSize,
    required this.shadows,
    required this.textDirection,
    required this.applyTextScaling,
    required this.fill,
    required super.animated,
  });
  static IconSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return IconSpec.from(mix);
  }

  static IconSpec from(MixData mix) {
    return mix.attributeOf<IconSpecAttribute>()?.resolve(mix) ??
        const IconSpec();
  }

  @override
  IconSpec lerp(IconSpec? other, double t) {
    if (other == null) return this;

    return IconSpec(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
      weight: lerpDouble(weight, other.weight, t),
      grade: lerpDouble(grade, other.grade, t),
      opticalSize: lerpDouble(opticalSize, other.opticalSize, t),
      shadows: Shadow.lerpList(shadows, other.shadows, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      applyTextScaling: lerpSnap(applyTextScaling, other.applyTextScaling, t),
      fill: lerpDouble(fill, other.fill, t),
      animated: other.animated ?? animated,
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
    AnimatedData? animated,
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
      animated: animated ?? this.animated,
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
        animated,
      ];
}

class IconSpecTween extends Tween<IconSpec> {
  IconSpecTween({IconSpec? begin, IconSpec? end})
      : super(begin: begin, end: end);

  @override
  IconSpec lerp(double t) => begin!.lerp(end, t);
}
