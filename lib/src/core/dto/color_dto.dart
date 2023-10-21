import 'package:flutter/material.dart';

import '../../attributes/style_attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';

class ColorDto extends ModifiableDto<Color> {
  // Modifier is only used after value is resolved.

  const ColorDto(super.value, {super.modifier});

  static ColorDto? maybeFrom(Color? color) {
    return color == null ? null : ColorDto(color);
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    return ColorDto(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }

  @override
  Color resolve(MixData mix) {
    Color resolvedColor = value;

    if (resolvedColor is ColorToken) {
      resolvedColor = mix.resolver.color(resolvedColor);
    }

    return modify(resolvedColor);
  }

  @override
  get props => [value, modifier];
}
