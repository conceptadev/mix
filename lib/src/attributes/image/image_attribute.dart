import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../../specs/image_spec.dart';
import '../attribute.dart';
import '../color_attribute.dart';

class ImageDto extends Dto<ImageSpec> {
  final double? width;
  final double? height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageDto({
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
    );
  }

  @override
  ImageDto merge(covariant ImageDto? other) {
    if (other == null) return this;

    return ImageDto(
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

class ImageAttribute extends ResolvableAttribute<ImageDto, ImageSpec> {
  const ImageAttribute(super.value);

  @override
  ImageAttribute merge(covariant ImageAttribute? other) {
    return ImageAttribute(value.merge(other?.value));
  }
}
