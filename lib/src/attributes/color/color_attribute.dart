import 'package:flutter/material.dart';

import '../../dtos/double.dto.dart';
import '../../dtos/dto.dart';
import '../../factory/exports.dart';
import '../../theme/exports.dart';

class ColorAttribute extends ResolvableAttribute<Color> {
  final Color value;

  // Modifier is only used after value is resolved.
  final ValueModifier<Color>? _directive;

  const ColorAttribute(this.value, {ValueModifier<Color>? directive})
      : _directive = directive;

  const ColorAttribute.from(Color color, {ValueModifier<Color>? directive})
      : value = color,
        _directive = directive;

  @override
  ColorAttribute merge(covariant ColorAttribute? other) {
    if (other == null) return this;

    return ColorAttribute(
      other.value,
      directive: other._directive ?? _directive,
    );
  }

  @override
  Color resolve(MixData mix) {
    Color resolvedColor = value;

    if (resolvedColor is ColorToken) {
      resolvedColor = mix.resolveToken.color(resolvedColor);
    }

    return _directive?.call(resolvedColor) ?? resolvedColor;
  }

  @override
  get props => [value];
}
