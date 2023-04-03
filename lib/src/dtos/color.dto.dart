import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
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
  Color resolve(MixData mix) {
    var resolvedColor = value;

    if (resolvedColor is ColorToken) {
      resolvedColor = mix.resolveToken.color(resolvedColor);
    }

    return value;
  }

  @override
  get props => [value];
}
