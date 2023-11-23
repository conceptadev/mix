import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../recipes/image/image_recipe.dart';

class ImageAttribute extends ResolvableAttribute<ImageRecipeMix> {
  final double? width;
  final double? height;
  final ColorAttribute? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageAttribute({
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  @override
  ImageRecipeMix resolve(MixData mix) {
    return ImageRecipeMix(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
    );
  }

  @override
  ImageAttribute merge(covariant ImageAttribute? other) {
    if (other == null) return this;

    return ImageAttribute(
      width: width ?? other.width,
      height: height ?? other.height,
      color: color ?? other.color,
      repeat: repeat ?? other.repeat,
      fit: fit ?? other.fit,
    );
  }

  @override
  get props => [width, height, color, repeat, fit];
}
