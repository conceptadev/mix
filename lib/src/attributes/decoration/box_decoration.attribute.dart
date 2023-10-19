// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/rendering.dart';

import '../../factory/exports.dart';
import '../base/color.dto.dart';
import '../border/box_border.attribute.dart';
import '../border_radius/border_radius.attribute.dart';
import '../gradient/gradient.attribute.dart';
import '../helpers/list.attribute.dart';
import '../shadow/box_shadow.attribute.dart';
import 'decoration.attribute.dart';

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
