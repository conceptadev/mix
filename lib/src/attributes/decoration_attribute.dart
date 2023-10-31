// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/attribute.dart';
import '../core/dto/color_dto.dart';
import '../core/dto/shadow_dto.dart';
import '../factory/mix_provider_data.dart';
import '../utils/helper_util.dart';
import 'visual_attributes.dart';

abstract class DecorationAttribute<T extends Decoration>
    extends VisualAttribute<T> {
  const DecorationAttribute();

  @override
  DecorationAttribute<T> merge(covariant DecorationAttribute<T>? other);

  @override
  T resolve(MixData mix);
}

class BoxDecorationAttribute extends DecorationAttribute<BoxDecoration> {
  final ColorData? color;
  final BoxBorderAttribute? border;
  final BorderRadiusGeometryAttribute? borderRadius;
  final GradientAttribute? gradient;
  final List<BoxShadowData>? boxShadow;
  final BoxShapeAttribute? shape;

  const BoxDecorationAttribute({
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.color,
    this.shape,
  });

  @override
  BoxDecorationAttribute merge(BoxDecorationAttribute? other) {
    if (other == null) return this;

    return BoxDecorationAttribute(
      border: border?.merge(other.border) ?? other.border,
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      boxShadow: mergeMergeableList(boxShadow, other.boxShadow),
      color: color?.merge(other.color) ?? other.color,
      shape: other.shape ?? shape,
    );
  }

  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: color?.resolve(mix),
      border: resolveAttribute(border, mix),
      borderRadius: resolveAttribute(borderRadius, mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: resolveAttribute(gradient, mix),
    );
  }

  @override
  get props => [border, borderRadius, gradient, boxShadow, color, shape];
}

class ShapeDecorationDto extends DecorationAttribute<ShapeDecoration> {
  // The color to fill in the background of the shape.
  final ColorData? color;

  // The shape of the box.
  final ShapeBorder? shape;
  // A gradient to use when filling the box.
  final GradientAttribute? gradient;

  // Shadows cast by this box behind the box.
  final List<BoxShadowData>? boxShadow;

  const ShapeDecorationDto({
    this.color,
    this.shape,
    this.gradient,
    this.boxShadow,
  });

  @override
  ShapeDecorationDto merge(ShapeDecorationDto? other) {
    if (other == null) return this;

    return ShapeDecorationDto(
      color: color?.merge(other.color) ?? other.color,
      shape: other.shape ?? shape,
      gradient: mergeAttribute(gradient, other.gradient),
      boxShadow: mergeMergeableList(boxShadow, other.boxShadow),
    );
  }

  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: resolveAttribute(gradient, mix),
      shadows: boxShadow?.map((e) => e.resolve(mix)).toList(),
      shape: shape ?? const RoundedRectangleBorder(),
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, boxShadow];
}
