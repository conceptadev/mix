// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../border/border_attribute.dart';
import '../border/border_radius_attribute.dart';
import '../color_attribute.dart';
import '../gradient_attribute.dart';
import '../shadow_attribute.dart';

@immutable
abstract class DecorationAttribute<Value extends Decoration>
    extends ResolvableAttribute<DecorationAttribute, Value>
    with SingleChildRenderAttributeMixin<DecoratedBox> {
  const DecorationAttribute();

  @override
  DecorationAttribute merge(covariant DecorationAttribute? other);

  @override
  DecoratedBox build(mix, child) {
    return DecoratedBox(decoration: resolve(mix), child: child);
  }
}

@immutable
class BoxDecorationAttribute extends DecorationAttribute<BoxDecoration> {
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

  static BoxDecorationAttribute from(BoxDecoration decoration) {
    return BoxDecorationAttribute(
      color: ColorDto.maybeFrom(decoration.color),
      border: BoxBorderAttribute.maybeFrom(decoration.border),
      borderRadius:
          BorderRadiusGeometryAttribute.maybeFrom(decoration.borderRadius),
      gradient: GradientAttribute.maybeFrom(decoration.gradient),
      boxShadow: decoration.boxShadow?.map(BoxShadowAttribute.from).toList(),
      shape: decoration.shape,
    );
  }

  static BoxDecorationAttribute? maybeFrom(BoxDecoration? decoration) {
    return decoration == null ? null : from(decoration);
  }

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

@immutable
class ShapeDecorationAttribute extends DecorationAttribute<ShapeDecoration> {
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
