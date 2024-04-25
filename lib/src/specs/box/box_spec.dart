import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../helpers/lerp_helpers.dart';
import 'box_attribute.dart';

class BoxSpec extends Spec<BoxSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? transformAlignment;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final Matrix4? transform;
  final Clip? clipBehavior;
  final double? width;
  final double? height;

  const BoxSpec({
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
  });

  const BoxSpec.empty()
      : alignment = null,
        padding = null,
        margin = null,
        constraints = null,
        decoration = null,
        foregroundDecoration = null,
        transformAlignment = null,
        transform = null,
        width = null,
        height = null,
        clipBehavior = null;

  static BoxSpec of(BuildContext context) {
    final mix = MixProvider.of(context);

    return mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
        const BoxSpec.empty();
  }

  static BoxSpec from(MixData mix) {
    return mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
        const BoxSpec.empty();
  }

  @override
  BoxSpec copyWith({
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
    Color? color,
  }) {
    return BoxSpec(
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
    );
  }

  @override
  BoxSpec lerp(BoxSpec? other, double t) {
    if (other == null) return this;

    return BoxSpec(
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
      transform: transform != null && other.transform != null
          ? Matrix4Tween(begin: transform, end: other.transform).lerp(t)
          : lerpSnap(transform, other.transform, t),
      transformAlignment: AlignmentGeometry.lerp(
        transformAlignment,
        other.transformAlignment,
        t,
      ),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
    );
  }

  @override
  get props => [
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
      ];
}

class BoxSpecTween extends Tween<BoxSpec?> {
  BoxSpecTween({super.begin, super.end});

  @override
  BoxSpec lerp(double t) {
    if (begin == null && end == null) return const BoxSpec.empty();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
