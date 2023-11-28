// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../mix.dart';

abstract class DecorationAttribute<T, Value extends Decoration>
    extends ResolvableAttribute<T, Value>
    with SingleChildRenderAttributeMixin<DecoratedBox> {
  const DecorationAttribute();

  @override
  T merge(covariant T other);

  @override
  DecoratedBox build(mix, child) {
    return DecoratedBox(decoration: resolve(mix), child: child);
  }
}

class BoxDecorationAttribute
    extends DecorationAttribute<BoxDecorationAttribute, BoxDecoration> {
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusGeometryAttribute? borderRadius;
  final GradientAttribute? gradient;
  final List<BoxShadowAttribute>? boxShadow;
  final BoxShape? shape;

  const BoxDecorationAttribute({
    this.color,
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.shape,
  });

  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: color?.resolve(mix),
      border: border?.resolve(mix),
      borderRadius: borderRadius?.resolve(mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: gradient?.resolve(mix),
      shape: shape ?? BoxShape.rectangle,
    );
  }

  @override
  BoxDecorationAttribute merge(BoxDecorationAttribute? other) {
    if (other == null) return this;

    return BoxDecorationAttribute(
      color: color?.merge(other.color) ?? other.color,
      border: border?.merge(other.border) ?? other.border,
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      boxShadow: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
    );
  }

  @override
  List<Object?> get props =>
      [color, border, borderRadius, gradient, boxShadow, shape];
}

class ShapeDecorationAttribute
    extends DecorationAttribute<ShapeDecorationAttribute, ShapeDecoration> {
  final ColorDto? color;
  final ShapeBorder? shape;
  final GradientAttribute? gradient;
  final List<BoxShadowAttribute>? boxShadow;

  const ShapeDecorationAttribute({
    this.color,
    this.shape,
    this.gradient,
    this.boxShadow,
  });

  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: gradient?.resolve(mix),
      shadows: boxShadow?.map((e) => e.resolve(mix)).toList(),
      shape: shape ?? const RoundedRectangleBorder(),
    );
  }

  @override
  ShapeDecorationAttribute merge(ShapeDecorationAttribute? other) {
    if (other == null) return this;

    return ShapeDecorationAttribute(
      color: other.color ?? color,
      shape: other.shape ?? shape,
      gradient: other.gradient ?? gradient,
      boxShadow: other.boxShadow ?? boxShadow,
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, boxShadow];
}
