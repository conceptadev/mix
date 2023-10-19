import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../attributes/base/color.dto.dart';
import '../../attributes/style_attribute.dart';
import '../../factory/mix_provider_data.dart';

class ImageAttributes extends StyleAttribute<ImageSpec> {
  final ImageProvider? image;
  final double? width, height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageAttributes({
    this.image,
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
  });

  ImageAttributes copyWith({
    ImageProvider? image,
    double? width,
    double? height,
    ColorDto? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageAttributes(
      image: image ?? this.image,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      repeat: repeat ?? this.repeat,
      fit: fit ?? this.fit,
    );
  }

  @override
  ImageAttributes merge(ImageAttributes? other) {
    if (other == null) return this;

    return copyWith(
      image: other.image,
      width: other.width,
      height: other.height,
      color: other.color,
      repeat: other.repeat,
      fit: other.fit,
    );
  }

  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec(
      image: image,
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat ?? ImageRepeat.noRepeat,
      fit: fit ?? BoxFit.contain,
    );
  }

  @override
  get props => [image, width, height, color, repeat, fit];
}

class ImageSpec extends Spec {
  final ImageProvider? image;
  final double? width, height;
  final Color? color;
  final ImageRepeat repeat;
  final BoxFit fit;

  const ImageSpec({
    required this.image,
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  @override
  get props => [image, width, height, color, repeat, fit];
}
