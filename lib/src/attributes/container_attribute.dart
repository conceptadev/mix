import 'dart:ui';

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'alignment_geometry_attribute.dart';
import 'box_constraints_attribute.dart';
import 'clip_attribute.dart';
import 'color_attribute.dart';
import 'decoration_attribute.dart';
import 'matrix4_attribute.dart';
import 'size_attribute.dart';
import 'space_attribute.dart';
import 'style_attribute.dart';

class ContainerAttributes extends SpecAttribute<ContainerSpec> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final MarginAttribute? margin;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final WidthAttribute? width;
  final HeightAttribute? height;
  final Matrix4Attribute? transform;
  final BackgroundColorAttribute? color;
  final ClipAttribute? clipBehavior;

  const ContainerAttributes({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.width,
    this.height,
    this.transform,
    this.color,
    this.clipBehavior,
  });

  factory ContainerAttributes.from({
    AlignmentGeometry? alignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    double? width,
    double? height,
    Matrix4? transform,
    Color? color,
    Clip? clipBehavior,
  }) {
    return ContainerAttributes(
      alignment: AlignmentGeometryAttribute.maybeFrom(alignment),
      padding: padding == null ? null : PaddingAttribute.from(padding),
      margin: margin == null ? null : MarginAttribute.from(margin),
      constraints: constraints == null
          ? null
          : BoxConstraintsAttribute.from(constraints),
      decoration:
          decoration == null ? null : DecorationAttribute.from(decoration),
      width: width == null ? null : WidthAttribute.from(width),
      height: height == null ? null : HeightAttribute.from(height),
      transform: transform == null ? null : Matrix4Attribute(transform),
      color: color == null ? null : BackgroundColorAttribute.from(color),
      clipBehavior: clipBehavior == null ? null : ClipAttribute(clipBehavior),
    );
  }

  @override
  ContainerAttributes merge(ContainerAttributes? other) {
    if (other == null) return this;

    return ContainerAttributes(
      alignment: mergeAttr(alignment, other.alignment),
      padding: mergeAttr(padding, other.padding),
      margin: mergeAttr(margin, other.margin),
      constraints: mergeAttr(constraints, other.constraints),
      decoration: mergeAttr(decoration, other.decoration),
      width: mergeAttr(width, other.width),
      height: mergeAttr(height, other.height),
      transform: mergeAttr(transform, other.transform),
      color: mergeAttr(color, other.color),
      clipBehavior: mergeAttr(clipBehavior, other.clipBehavior),
    );
  }

  @override
  ContainerSpec resolve(MixData mix) {
    return ContainerSpec(
      alignment: resolveAttr(alignment, mix),
      padding: resolveAttr(padding, mix),
      margin: resolveAttr(margin, mix),
      constraints: resolveAttr(constraints, mix),
      decoration: resolveAttr(decoration, mix),
      width: resolveAttr(width, mix),
      height: resolveAttr(height, mix),
      transform: resolveAttr(transform, mix),
      color: resolveAttr(color, mix),
      clipBehavior: resolveAttr(clipBehavior, mix),
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        width,
        height,
        transform,
        color,
        clipBehavior,
      ];
}

class ContainerSpec extends Spec<ContainerSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final Color? color;
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
    required this.color,
    required this.clipBehavior,
  });

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
    Color? color,
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
      color: color ?? this.color,
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
      color: Color.lerp(color, other.color, t),
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
        color,
        clipBehavior,
      ];
}
