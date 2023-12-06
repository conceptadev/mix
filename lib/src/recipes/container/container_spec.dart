import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';

class ContainerSpec extends Spec<ContainerSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final Matrix4? transform;
  final Clip? clipBehavior;
  // final Color? color;
  final double? width, height;

  const ContainerSpec({
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

  const ContainerSpec.empty()
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
  ContainerSpec copyWith({
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
    return ContainerSpec(
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
  ContainerSpec lerp(ContainerSpec other, double t) {
    return ContainerSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      decoration: Decoration.lerp(decoration, other.decoration, t),
      transform: Matrix4Tween(begin: transform, end: other.transform).lerp(t),
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
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
