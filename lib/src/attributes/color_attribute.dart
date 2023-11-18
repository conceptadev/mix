import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import '../utils/scalar_util.dart';
import 'attribute.dart';

@immutable
abstract class ScalarColorAttribute<T extends ScalarColorAttribute<T>>
    extends ScalarAttribute<T, Color> {
  const ScalarColorAttribute(super.value);

  @override
  T Function(Color) get create;

  @override
  T merge(covariant T? other) {
    return create(other?.value ?? value);
  }

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
  }
}

@immutable
class ColorAttribute extends ScalarColorAttribute<ColorAttribute> {
  const ColorAttribute(super.color);

  @override
  final create = ColorAttribute.new;
}

@immutable
class IconColorAttribute extends ScalarColorAttribute<IconColorAttribute> {
  const IconColorAttribute(super.color);

  @override
  final create = IconColorAttribute.new;
}

@immutable
class ImageColorAttribute extends ScalarColorAttribute<ImageColorAttribute> {
  const ImageColorAttribute(super.color);

  @override
  final create = ImageColorAttribute.new;
}

@immutable
class ColorUtility<T> extends ScalarUtility<Color, T> {
  const ColorUtility(super.builder);
}
