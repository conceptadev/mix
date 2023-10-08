import 'package:flutter/rendering.dart';

import '../../factory/exports.dart';
import '../base/color.dto.dart';
import '../gradient/gradient.attribute.dart';
import '../helpers/list.attribute.dart';
import '../shadow/box_shadow.attribute.dart';
import 'decoration.attribute.dart';

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
      final gradientAttribute = mix.get<GradientAttribute>();
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
