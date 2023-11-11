import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import 'attribute.dart';

@immutable
class ColorAttribute extends ScalarAttribute<ColorAttribute, Color> {
  const ColorAttribute(super.value);

  @override
  ColorAttribute create(Color value) => ColorAttribute(value);

  @override
  Color resolve(MixData mix) {
    final resolvedColor = value;

    return resolvedColor is ColorToken
        ? mix.resolver.colorToken(resolvedColor)
        : resolvedColor;
  }
}

@immutable
class IconColorAttribute extends ColorAttribute {
  const IconColorAttribute(super.color);

  @override
  IconColorAttribute create(value) => IconColorAttribute(value);
}

@immutable
class ImageColorAttribute extends ColorAttribute {
  const ImageColorAttribute(super.color);

  @override
  ImageColorAttribute create(value) => ImageColorAttribute(value);
}
