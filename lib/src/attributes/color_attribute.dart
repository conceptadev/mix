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
  ColorAttribute merge(covariant ColorAttribute? other) {
    return create(other?.value ?? value);
  }

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
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

@immutable
class ColorUtility<T extends VisualAttribute> {
  final T Function(Color color) fn;
  const ColorUtility(this.fn);

  T call(Color color) => fn(color);
}
