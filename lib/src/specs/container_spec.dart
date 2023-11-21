import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import '../attributes/attribute.dart';
import '../attributes/constraints_attribute.dart';
import '../attributes/decoration_attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../attributes/space_attribute.dart';
import '../factory/mix_provider_data.dart';

class ContainerSpec extends StyleRecipe<ContainerSpec> {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Decoration? decoration;

  final Matrix4? transform;
  final Clip? clipBehavior;

  const ContainerSpec({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.transform,
    required this.clipBehavior,
  });

  static ContainerSpec resolve(MixData mix) {
    return ContainerSpec(
      alignment:
          mix.attributeOfType<AlignmentGeometryAttribute>()?.resolve(mix),
      padding: mix.attributeOfType<PaddingAttribute>()?.resolve(mix),
      margin: mix.attributeOfType<MarginAttribute>()?.resolve(mix),
      constraints: mix.attributeOfType<BoxConstraintsAttribute>()?.resolve(mix),
      decoration: mix.attributeOfType<DecorationAttribute>()?.resolve(mix),
      transform: mix.attributeOfType<TransformAttribute>()?.value,
      clipBehavior: mix.attributeOfType<ClipAttribute>()?.value,
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
        transform,
        clipBehavior,
      ];
}
