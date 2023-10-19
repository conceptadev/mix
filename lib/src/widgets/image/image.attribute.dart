import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../attributes/base/color.dto.dart';
import '../../attributes/enum/box_fit.attribute.dart';
import '../../attributes/size/height.attribute.dart';
import '../../attributes/size/width.attribute.dart';
import '../../attributes/style_attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../image/image_provider.attribute.dart';
import '../../image/image_repeat.attribute.dart';

class ImageAttributes extends SpecAttribute<ImageSpec> {
  final ImageProviderAttribute? image;
  final WidthAttribute? width;
  final HeightAttribute? height;
  final ColorDto? color;
  final ImageRepeatAttribute? repeat;
  final BoxFitAttribute? fit;

  const ImageAttributes({
    this.image,
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
  });

  @override
  ImageAttributes merge(ImageAttributes? other) {
    if (other == null) return this;

    return ImageAttributes(
      image: other.image,
      width: mergeProp(width, other.width),
      height: mergeProp(height, other.height),
      color: mergeProp(color, other.color),
      repeat: mergeProp(repeat, other.repeat),
      fit: mergeProp(fit, other.fit),
    );
  }

  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec(
      image: resolveAttribute(image, mix),
      width: resolveAttribute(width, mix),
      height: resolveAttribute(height, mix),
      color: resolveDto(color, mix),
      repeat: resolveAttribute(repeat, mix) ?? ImageRepeat.noRepeat,
      fit: resolveAttribute(fit, mix) ?? BoxFit.contain,
    );
  }

  @override
  get props => [image, width, height, color, repeat, fit];
}

class ImageSpec extends Spec<ImageSpec> {
  final ImageProvider? image;
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageSpec({
    required this.image,
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  @override
  ImageSpec lerp(ImageSpec? other, double t) {
    return ImageSpec(
      image: t < 0.5 ? image : other?.image,
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
      color: Color.lerp(color, other?.color, t),
      repeat: t < 0.5 ? repeat : other?.repeat,
      fit: t < 0.5 ? fit : other?.fit,
    );
  }

  @override
  ImageSpec copyWith({
    ImageProvider? image,
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageSpec(
      image: image ?? this.image,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      repeat: repeat ?? this.repeat,
      fit: fit ?? this.fit,
    );
  }

  @override
  get props => [image, width, height, color, repeat, fit];
}
