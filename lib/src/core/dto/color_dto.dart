import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_ref.dart';
import '../attribute.dart';

class ColorData extends Data<Color> {
  final Color value;

  const ColorData(this.value);

  @override
  ColorData merge(covariant ColorData? other) {
    return ColorData(other?.value ?? value);
  }

  @override
  Color resolve(MixData mix) {
    final resolvedColor = value;

    return resolvedColor is ColorRef
        ? mix.resolver.color(resolvedColor)
        : resolvedColor;
  }

  @override
  get props => [value];
}
