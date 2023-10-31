import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_ref.dart';
import '../attribute.dart';

class ColorData extends Data<Color> {
  final Color value;

  const ColorData(this.value);

  static ColorData? maybeFrom(Color? color) {
    return color == null ? null : ColorData(color);
  }

  @override
  ColorData merge(covariant ColorData? other) {
    return ColorData(other?.value ?? value);
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
