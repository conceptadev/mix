import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

class IconSpecLegacy extends Spec<IconSpecLegacy> {
  final Color? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final TextDirection? textDirection;
  final bool? applyTextScaling;
  final List<Shadow>? shadows;
  final double? fill;

  const IconSpecLegacy({
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

  const IconSpecLegacy.exhaustive({
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
  static IconSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return IconSpecLegacy.from(mix);
  }

  static IconSpecLegacy from(MixData mix) {
    return mix.attributeOf<IconSpecLegacyAttribute>()?.resolve(mix) ??
        const IconSpecLegacy();
  }

  @override
  IconSpecLegacy lerp(IconSpecLegacy? other, double t) {
    if (other == null) return this;

    return IconSpecLegacy(
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
  IconSpecLegacy copyWith({
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
    return IconSpecLegacy(
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

class IconSpecLegacyTween extends Tween<IconSpecLegacy> {
  IconSpecLegacyTween({IconSpecLegacy? begin, IconSpecLegacy? end})
      : super(begin: begin, end: end);

  @override
  IconSpecLegacy lerp(double t) => begin!.lerp(end, t);
}

class IconSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, IconSpecLegacyAttribute> {
  late final color = ColorUtility((v) => only(color: v));
  late final size = DoubleUtility((v) => only(size: v));
  late final weight = DoubleUtility((v) => only(size: v));
  late final grade = DoubleUtility((v) => only(grade: v));
  late final opticalSize = DoubleUtility((v) => only(opticalSize: v));
  late final shadow = ShadowUtility((v) => only(shadows: [v]));
  late final shadows = ShadowListUtility((v) => only(shadows: v));
  late final fill = DoubleUtility((v) => only(fill: v));
  late final applyTextScaling = BoolUtility(
    (v) => only(applyTextScaling: v),
  );

  IconSpecLegacyUtility(super.builder);

  @override
  T only({
    ColorDto? color,
    double? size,
    double? weight,
    double? grade,
    double? opticalSize,
    List<ShadowDto>? shadows,
    double? fill,
    bool? applyTextScaling,
    AnimatedDataDto? animated,
  }) {
    return builder(
      IconSpecLegacyAttribute(
        size: size,
        color: color,
        weight: weight,
        grade: grade,
        opticalSize: opticalSize,
        shadows: shadows,
        fill: fill,
        applyTextScaling: applyTextScaling,
        animated: animated,
      ),
    );
  }
}

class IconSpecLegacyAttribute extends SpecAttribute<IconSpecLegacy> {
  final ColorDto? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final List<ShadowDto>? shadows;
  final TextDirection? textDirection;
  final double? fill;
  final bool? applyTextScaling;

  const IconSpecLegacyAttribute({
    this.size,
    this.color,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.fill,
    this.textDirection,
    this.applyTextScaling,
    super.animated,
  });

  @override
  IconSpecLegacy resolve(MixData mix) {
    return IconSpecLegacy.exhaustive(
      color: color?.resolve(mix),
      size: size,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      shadows: shadows?.map((e) => e.resolve(mix)).toList(),
      textDirection: textDirection,
      applyTextScaling: applyTextScaling,
      fill: fill,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  @override
  IconSpecLegacyAttribute merge(covariant IconSpecLegacyAttribute? other) {
    if (other == null) return this;

    return IconSpecLegacyAttribute(
      size: other.size ?? size,
      color: color?.merge(other.color) ?? other.color,
      weight: other.weight ?? weight,
      grade: other.grade ?? grade,
      opticalSize: other.opticalSize ?? opticalSize,
      shadows: other.shadows ?? shadows,
      fill: other.fill ?? fill,
      textDirection: other.textDirection ?? textDirection,
      applyTextScaling: other.applyTextScaling ?? applyTextScaling,
      animated: other.animated ?? animated,
    );
  }

  @override
  get props => [
        size,
        color,
        weight,
        grade,
        opticalSize,
        shadows,
        textDirection,
        applyTextScaling,
        animated,
      ];
}
