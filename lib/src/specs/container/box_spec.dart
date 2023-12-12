import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../helpers/lerp_helpers.dart';

class BoxSpec extends Spec<BoxSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;
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
    required this.transform,
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
        transform = null,
        width = null,
        height = null,
        clipBehavior = null;

  @override
  BoxSpec copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    double? width,
    double? height,
    Matrix4? transform,
    Clip? clipBehavior,
    Color? color,
  }) {
    return BoxSpec(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      transform: transform ?? this.transform,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  BoxSpec lerp(BoxSpec other, double t) {
    return BoxSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      decoration: Decoration.lerp(decoration, other.decoration, t),
      transform: Matrix4Tween(begin: transform, end: other.transform).lerp(t),
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
        transform,
        clipBehavior,
      ];
}

class BoxSpecTween extends Tween<BoxSpec?> {
  BoxSpecTween({super.begin, super.end});

  @override
  BoxSpec? lerp(double t) {
    if (begin == null) return end;
    if (end == null) return begin;

    // ignore: avoid-non-null-assertion
    return begin!.lerp(end!, t);
  }
}
