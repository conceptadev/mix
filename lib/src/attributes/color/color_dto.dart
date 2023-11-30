import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';

@immutable
class ColorDto extends Dto<ColorDto, Color> {
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
