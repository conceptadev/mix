import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_ref.dart';
import '../attribute.dart';

class ColorDto extends Dto<Color> {
  final Color value;

  const ColorDto(this.value);

  static ColorDto? maybeFrom(Color? color) {
    return color == null ? null : ColorDto(color);
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    return ColorDto(other?.value ?? value);
  }

  @override
  Color resolve(MixData mix) {
    Color resolvedColor = value;

    return resolvedColor is ColorRef
        ? resolvedColor = mix.resolver.color(resolvedColor)
        : resolvedColor;
  }

  @override
  get props => [value];
}
