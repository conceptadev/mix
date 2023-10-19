// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/rendering.dart';

import '../../factory/exports.dart';
import '../base/color.dto.dart';
import '../border/box_border.attribute.dart';
import '../border_radius/border_radius.attribute.dart';
import '../gradient/gradient.attribute.dart';
import '../helpers/list.attribute.dart';
import '../shadow/box_shadow.attribute.dart';
import '../style_attribute.dart';

abstract class DecorationAttribute<T extends Decoration>
    extends StyleAttribute<T> {
  const DecorationAttribute();

  @override
  DecorationAttribute<T> merge(covariant DecorationAttribute<T>? other);
}

class BoxDecorationAttribute extends DecorationAttribute<BoxDecoration> {
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusAttribute? borderRadius;
  final GradientAttribute? gradient;
  final ListAtttribute<BoxShadowAttribute>? boxShadow;
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
      boxShadow: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
      color: color?.merge(other.color) ?? other.color,
      shape: other.shape ?? shape,
    );
  }

  @override
  BoxDecoration resolve(MixData mix) {
    BorderRadiusGeometry? _borderRadius = borderRadius?.resolve(mix);
    BoxBorder? _border = border?.resolve(mix);
    Gradient? _gradient = gradient?.resolve(mix);

    _borderRadius ??= mix.maybeGet<BorderRadiusAttribute, BorderRadius>();

    _border ??= mix.maybeGet<BoxBorderAttribute, BoxBorder>();

    _gradient ??= mix.maybeGet<GradientAttribute, Gradient>();

    final boxShadowAttributes = boxShadow?.resolve(mix);

    BoxDecoration boxDecoration = BoxDecoration(
      color: color?.resolve(mix),
      border: _border,
      borderRadius: _borderRadius,
      boxShadow: boxShadowAttributes?.map((e) => e.resolve(mix)).toList(),
      gradient: _gradient,
    );

    // Shape is added separately because it doesn't accept a nullable value.
    if (shape != null) {
      boxDecoration = boxDecoration.copyWith(shape: shape);
    }

    // Border radius is added if no shape exists.
    boxDecoration = boxDecoration.copyWith(borderRadius: _borderRadius);

    return boxDecoration;
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
  final ListAtttribute<BoxShadowAttribute>? boxShadow;

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
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      boxShadow: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
    );
  }

  @override
  ShapeDecoration resolve(MixData mix) {
    Gradient? resolvedGradient = gradient?.resolve(mix);
    if (resolvedGradient == null) {
      final gradientAttribute = mix.attributeOf<GradientAttribute>();
      resolvedGradient = gradientAttribute?.resolve(mix);
    }

    // Need to resolve the list first
    final boxShadowAttributes = boxShadow?.resolve(mix);

    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: resolvedGradient,
      shadows: boxShadowAttributes?.map((e) => e.resolve(mix)).toList(),
      shape: shape ?? const RoundedRectangleBorder(),
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, boxShadow];
}
