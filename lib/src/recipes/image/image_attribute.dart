import 'package:flutter/material.dart';

import '../../attributes/color_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'image_mixture.dart';

class ImageMixtureAttribute
    extends ResolvableAttribute<ImageMixtureAttribute, ImageMixture> {
  final double? width;
  final double? height;
  final ColorAttribute? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageMixtureAttribute({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
  });

  @override
  ImageMixture resolve(MixData mix) {
    return ImageMixture(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
    );
  }

  @override
  ImageMixtureAttribute merge(covariant ImageMixtureAttribute? other) {
    if (other == null) return this;

    return ImageMixtureAttribute(
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
