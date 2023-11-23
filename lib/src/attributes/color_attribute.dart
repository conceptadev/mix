import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import '../utils/scalar_util.dart';
import 'attribute.dart';

@immutable
class ColorDto extends Dto<Color> {
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
class ColorUtility<Attr extends StyleAttribute>
    extends ScalarUtility<Attr, Color> {
  const ColorUtility(super.builder);
}

@immutable
class ColorAttribute extends ResolvableAttribute<Color> {
  final ColorDto value;
  const ColorAttribute(this.value);

  @override
  ColorAttribute merge(covariant ColorAttribute? other) {
    if (other == null) return this;

    return ColorAttribute(other.value);
  }

  @override
  Color resolve(MixData mix) => value.resolve(mix);

  @override
  get props => [value];
}
