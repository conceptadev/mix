import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';
import '../resolvable_attribute.dart';

typedef ColorModifier = ValueModifier<Color>;

class ColorAttribute extends ModifiableAttribute<Color> {
  // Modifier is only used after value is resolved.

  const ColorAttribute(super.value, {super.modifier});

  @override
  ColorAttribute merge(covariant ColorAttribute? other) {
    return ColorAttribute(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }

  @override
  Color resolve(MixData mix) {
    Color resolvedColor = value;

    if (resolvedColor is ColorToken) {
      resolvedColor = mix.resolveToken.color(resolvedColor);
    }

    return modify(resolvedColor);
  }

  @override
  get props => [value, modifier];
}
