import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';

@immutable
class ColorDto extends Dto<Color> with Mergeable<ColorDto> {
  final Color value;
  const ColorDto(this.value);

  static ColorDto? maybeFrom(Color? value) =>
      value == null ? null : ColorDto(value);

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    return other == null ? this : ColorDto(other.value);
  }

  @override
  get props => [value];
}


  // Color withAlpha(int a) {
  //   return Color.fromARGB(a, red, green, blue);
  // }

  // Color withOpacity(double opacity) {
  //   assert(opacity >= 0.0 && opacity <= 1.0);
  //   return withAlpha((255.0 * opacity).round());
  // }

  // Color withRed(int r) {
  //   return Color.fromARGB(alpha, r, green, blue);
  // }

  // Color withGreen(int g) {
  //   return Color.fromARGB(alpha, red, g, blue);
  // }

  // Color withBlue(int b) {
  //   return Color.fromARGB(alpha, red, green, b);
  // }