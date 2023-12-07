import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'image_spec.dart';

class ImageSpecAttribute
    extends ResolvableAttribute<ImageSpecAttribute, ImageSpec> {
  final double? width;
  final double? height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageSpecAttribute({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
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
  ImageSpecAttribute merge(covariant ImageSpecAttribute? other) {
    if (other == null) return this;

    return ImageSpecAttribute(
      width: other.width ?? width,
      height: other.height ?? height,
      color: other.color ?? color,
      repeat: other.repeat ?? repeat,
      fit: other.fit ?? fit,
    );
  }

  @override
  get props => [width, height, color, repeat, fit];
}
