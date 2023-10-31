import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/constraints_attribute.dart';
import '../attributes/decoration_attribute.dart';
import '../attributes/visual_attributes.dart';
import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

class ContainerSpec extends MixExtension<ContainerSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final Clip? clipBehavior;

  const ContainerSpec({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.width,
    required this.height,
    required this.transform,
    required this.clipBehavior,
  });

  static ContainerSpec resolve(MixData mix) {
    return ContainerSpec(
      alignment: mix.get<AlignmentGeometryAttribute, AlignmentGeometry>(),
      padding: mix.get<PaddingAttribute, EdgeInsetsGeometry>(),
      margin: mix.get<MarginAttribute, EdgeInsetsGeometry>(),
      constraints: mix.get<BoxConstraintsAttribute, BoxConstraints>(),
      decoration: mix.get<DecorationAttribute, Decoration>(),
      width: mix.get<WidthAttribute, double>(),
      height: mix.get<HeightAttribute, double>(),
      transform: mix.get<TransformAttribute, Matrix4>(),
      clipBehavior: mix.get<ClipAttribute, Clip>(),
    );
  }

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
  }) {
    return ContainerSpec(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      width: width ?? this.width,
      height: height ?? this.height,
      transform: transform ?? this.transform,
      clipBehavior: clipBehavior ?? this.clipBehavior,
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
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      transform: Matrix4Tween(begin: transform, end: other.transform).lerp(t),
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
    );
  }

  @override
  get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        width,
        height,
        transform,
        clipBehavior,
      ];
}
