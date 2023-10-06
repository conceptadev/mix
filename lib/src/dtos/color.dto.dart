import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import 'double.dto.dart';
import 'dto.dart';

class ColorDto extends ResolvableAttribute<Color> {
  final Color value;

  // Modifier is only used after value is resolved.
  final ValueModifier<Color>? _directive;

  const ColorDto(this.value, {ValueModifier<Color>? directive})
      : _directive = directive;

  const ColorDto.from(Color color, {ValueModifier<Color>? directive})
      : value = color,
        _directive = directive;

  // Helper utility for internal API usage.
  static ColorDto? maybeFrom(
    Color? color, {
    ValueModifier<Color>? directive,
  }) {
    return color == null ? null : ColorDto(color, directive: directive);
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    if (other == null) return this;

    return ColorDto(other.value, directive: other._directive ?? _directive);
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
