import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import '../utils/scalar_util.dart';

@immutable
class ColorAttribute extends Dto<Color> {
  final Color value;
  const ColorAttribute(this.value);

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
  }

  @override
  ColorAttribute merge(covariant ColorAttribute? other) {
    if (other == null) return this;

    return ColorAttribute(other.value);
  }

  @override
  get props => [value];
}

@immutable
class ColorUtility<T> extends MixUtility<T, ColorAttribute> {
  const ColorUtility(super.builder);

  T call(Color color) => as(ColorAttribute(color));
}
