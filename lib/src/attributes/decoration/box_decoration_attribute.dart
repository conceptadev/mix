// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/rendering.dart';

import '../../factory/exports.dart';
import '../box_shadow/box_shadow.dto.dart';
import '../color/color_dto.dart';
import '../exports.dart';
import '../gradient/gradient_attribute.dart';
import '../resolvable_attribute.dart';

class DecorationAttribute extends ResolvableAttribute<Decoration> {
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusAttribute? borderRadius;
  final GradientAttribute? gradient;
  final List<BoxShadowDto>? boxShadow;
  final BoxShape? shape;

  const DecorationAttribute({
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.color,
    this.shape,
  });

  @override
  DecorationAttribute merge(DecorationAttribute? other) {
    if (other == null) return this;

    return DecorationAttribute(
      border: border?.merge(other.border),
      borderRadius: borderRadius?.merge(other.borderRadius),
      gradient: gradient?.merge(other.gradient),
      boxShadow: MergeMixin.mergeLists(boxShadow, other.boxShadow),
    );
  }

  @override
  Decoration resolve(MixData mix) {
// TODO: We might have to merge the values.
    BorderRadiusGeometry? _borderRadius = borderRadius?.resolve(mix);
    BoxBorder? _border = border?.resolve(mix);
    Gradient? _gradient = gradient?.resolve(mix);

    if (_borderRadius == null) {
      final borderRadiusAttribute = mix.attributeOf<BorderRadiusAttribute>();
      _borderRadius = borderRadiusAttribute?.resolve(mix);
    }

    if (_border == null) {
      final borderAttribute = mix.attributeOf<BoxBorderAttribute>();
      _border = borderAttribute?.resolve(mix);
    }

    if (_gradient == null) {
      final gradientAttribute = mix.attributeOf<GradientAttribute>();
      _gradient = gradientAttribute?.resolve(mix);
    }

    BoxDecoration boxDecoration = BoxDecoration(
      color: color?.resolve(mix),
      border: _border,
      borderRadius: _borderRadius,
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: _gradient,
    );

    // Shape is added separately because it doesn't accept a nullable value.
    if (shape != null) {
      boxDecoration = boxDecoration.copyWith(shape: shape);
    }

    // Border radius is added if no shape exists.
    if (shape == null && _borderRadius != null) {
      boxDecoration = boxDecoration.copyWith(borderRadius: _borderRadius);
    }

    return boxDecoration;
  }

  @override
  get props => [border, borderRadius, gradient, boxShadow, color, shape];
}
