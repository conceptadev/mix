import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

class BoxSpecLegacy extends Spec<BoxSpecLegacy> {
  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final BoxConstraints? constraints;

  final Decoration? decoration;

  final Decoration? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip? clipBehavior;

  final double? width;

  final double? height;

  const BoxSpecLegacy({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });

  const BoxSpecLegacy.exhaustive({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.foregroundDecoration,
    required this.transform,
    required this.transformAlignment,
    required this.clipBehavior,
    required this.width,
    required this.height,
    required super.animated,
  });

  static BoxSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return BoxSpecLegacy.from(mix);
  }

  static BoxSpecLegacy from(MixData mix) {
    return mix.attributeOf<BoxSpecLegacyAttribute>()?.resolve(mix) ??
        const BoxSpecLegacy();
  }

  @override
  BoxSpecLegacy copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return BoxSpecLegacy(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      width: width ?? this.width,
      height: height ?? this.height,
      animated: animated ?? this.animated,
    );
  }

  @override
  BoxSpecLegacy lerp(BoxSpecLegacy? other, double t) {
    if (other == null) return this;

    return BoxSpecLegacy(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      decoration: Decoration.lerp(decoration, other.decoration, t),
      foregroundDecoration: Decoration.lerp(
        foregroundDecoration,
        other.foregroundDecoration,
        t,
      ),
      transform: lerpMatrix4(transform, other.transform, t),
      transformAlignment: AlignmentGeometry.lerp(
        transformAlignment,
        other.transformAlignment,
        t,
      ),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      animated: lerpSnap(animated, other.animated, t),
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        width,
        height,
        padding,
        margin,
        constraints,
        decoration,
        foregroundDecoration,
        transform,
        transformAlignment,
        clipBehavior,
        animated,
      ];
}

class BoxSpecLegacyTween extends Tween<BoxSpecLegacy?> {
  BoxSpecLegacyTween({super.begin, super.end});

  @override
  BoxSpecLegacy lerp(double t) {
    if (begin == null && end == null) return const BoxSpecLegacy();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

class BoxSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, BoxSpecLegacyAttribute> {
  late final decoration = BoxDecorationUtility((v) => only(decoration: v));

  late final foregroundDecoration =
      BoxDecorationUtility((v) => only(foregroundDecoration: v));

  late final alignment = AlignmentUtility((v) => only(alignment: v));

  late final padding = SpacingUtility((v) => only(padding: v));

  late final margin = SpacingUtility((v) => only(margin: v));

  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));

  late final transform = Matrix4Utility((v) => only(transform: v));

  late final transformAlignment = AlignmentUtility((v) => only(alignment: v));

  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  late final width = DoubleUtility((v) => only(width: v));

  late final height = DoubleUtility((v) => only(height: v));

  late final color = decoration.color;
  late final elevation = decoration.elevation;
  late final radialGradient = gradient.radial;
  late final linearGradient = gradient.linear;
  late final shapeDecoration =
      ShapeDecorationUtility((v) => only(decoration: v));
  late final borderRadius = decoration.borderRadius;
  late final gradient = decoration.gradient;
  late final borderRadiusDirectional = decoration.borderRadiusDirectional;
  late final border = decoration.border;
  late final borderDirectional = decoration.borderDirectional;
  late final shadows = decoration.boxShadows;
  late final shadow = decoration.boxShadow;

  late final maxWidth = constraints.maxWidth;
  late final minWidth = constraints.minWidth;
  late final maxHeight = constraints.maxHeight;
  late final minHeight = constraints.minHeight;

  BoxSpecLegacyUtility(super.builder);

  @override
  T only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    DecorationDto? decoration,
    DecorationDto? foregroundDecoration,
    BoxConstraintsDto? constraints,
    double? width,
    double? height,
    Matrix4? transform,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(
      BoxSpecLegacyAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        clipBehavior: clipBehavior,
        width: width,
        height: height,
        animated: animated,
      ),
    );
  }
}

class BoxSpecLegacyAttribute extends SpecAttribute<BoxSpecLegacy> {
  final AlignmentGeometry? alignment;

  final SpacingDto? padding;

  final SpacingDto? margin;

  final BoxConstraintsDto? constraints;

  final DecorationDto? decoration;

  final DecorationDto? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip? clipBehavior;

  final double? width;

  final double? height;

  const BoxSpecLegacyAttribute({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });

  @override
  BoxSpecLegacy resolve(MixData mix) {
    return BoxSpecLegacy(
      alignment: alignment,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      foregroundDecoration: foregroundDecoration?.resolve(mix),
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
      animated: animated?.resolve(mix),
    );
  }

  @override
  BoxSpecLegacyAttribute merge(BoxSpecLegacyAttribute? other) {
    if (other == null) return this;

    return BoxSpecLegacyAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      foregroundDecoration:
          foregroundDecoration?.merge(other.foregroundDecoration) ??
              other.foregroundDecoration,
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      width: other.width ?? width,
      height: other.height ?? height,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  @override
  List<Object?> get props {
    return [
      alignment,
      padding,
      margin,
      constraints,
      decoration,
      foregroundDecoration,
      transform,
      transformAlignment,
      clipBehavior,
      width,
      height,
      animated,
    ];
  }
}
