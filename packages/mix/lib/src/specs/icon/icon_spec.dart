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

class IconSpecUtility<T extends Attribute>
    extends SpecUtility<T, IconSpecAttribute> {
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

  IconSpecUtility(super.builder);

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
      IconSpecAttribute(
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

class IconSpecAttribute extends SpecAttribute<IconSpec> {
  final ColorDto? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final List<ShadowDto>? shadows;
  final TextDirection? textDirection;
  final double? fill;
  final bool? applyTextScaling;

  const IconSpecAttribute({
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
  IconSpec resolve(MixData mix) {
    return IconSpec.exhaustive(
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
  IconSpecAttribute merge(covariant IconSpecAttribute? other) {
    if (other == null) return this;

    return IconSpecAttribute(
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
