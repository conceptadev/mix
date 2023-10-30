// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/attribute.dart';
import '../core/dto/dtos.dart';
import '../core/dto/shadow_dto.dart';
import '../factory/mix_provider_data.dart';
import '../utils/helper_util.dart';
import 'value_attributes.dart';

abstract class DecorationAttribute<T extends Decoration>
    extends StyleAttribute<T> {
  const DecorationAttribute();

  @override
  DecorationAttribute<T> merge(covariant DecorationAttribute<T>? other);
}

class BoxDecorationAttribute extends DecorationAttribute<BoxDecoration> {
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusGeometryAttribute? borderRadius;
  final GradientAttribute? gradient;
  final List<BoxShadowDto>? boxShadow;
  final BoxShape? shape;

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
      border: resolveAttr(border, mix),
      borderRadius: resolveAttr(borderRadius, mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: resolveAttr(gradient, mix),
    );
  }

  @override
  get props => [border, borderRadius, gradient, boxShadow, color, shape];
}

class ShapeDecorationAttribute extends DecorationAttribute<ShapeDecoration> {
  // The color to fill in the background of the shape.
  final ColorDto? color;

  // The shape of the box.
  final ShapeBorder? shape;
  // A gradient to use when filling the box.
  final GradientAttribute? gradient;

  // Shadows cast by this box behind the box.
  final List<BoxShadowDto>? boxShadow;

  const ShapeDecorationAttribute({
    this.color,
    this.shape,
    this.gradient,
    this.boxShadow,
  });

  @override
  ShapeDecorationAttribute merge(ShapeDecorationAttribute? other) {
    if (other == null) return this;

    return ShapeDecorationAttribute(
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
      gradient: resolveAttr(gradient, mix),
      shadows: boxShadow?.map((e) => e.resolve(mix)).toList(),
      shape: shape ?? const RoundedRectangleBorder(),
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, boxShadow];
}
