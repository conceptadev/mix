import 'package:flutter/material.dart';

import '../theme/mix_theme.dart';
import '../theme/tokens/color_token.dart';
import 'dto.dart';

class ColorDto extends Dto<Color> {
  final Color value;

  const ColorDto(this.value);

  const ColorDto.from(Color color) : value = color;

  // Helper utility for internal API usage
  static ColorDto? maybeFrom(Color? color) {
    if (color == null) {
      return null;
    }

    return ColorDto.from(color);
  }

  @override
  Color resolve(BuildContext context) {
    var resolvedColor = value;

    if (resolvedColor is ColorToken) {
      resolvedColor = MixTokenResolver(context).color(resolvedColor);
    }

    return value;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorDto && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ColorDto(value: $value)';
}
