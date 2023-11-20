import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import '../utils/scalar_util.dart';
import 'attribute.dart';

@immutable
class ColorDto extends Dto<ColorDto> with Resolver<Color> {
  final Color value;
  const ColorDto(this.value);

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    if (other == null) return this;
    return ColorDto(other.value);
  }

  @override
  get props => [value];
}

@immutable
class ColorAttribute extends StyleAttribute with Resolver<Color> {
  final Color value;
  const ColorAttribute(this.value);

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
  }

  @override
  get props => [value];
}

@immutable
class ColorUtility<T> extends ScalarUtility<Color, T> {
  const ColorUtility(super.builder);
}
