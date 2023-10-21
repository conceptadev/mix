import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/dto/color.dto.dart';
import '../factory/mix_provider_data.dart';
import 'box_fit.attribute.dart';
import 'height.attribute.dart';
import 'image_provider.attribute.dart';
import 'image_repeat.attribute.dart';
import 'style_attribute.dart';
import 'width.attribute.dart';

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
      width: mergeAttr(width, other.width),
      height: mergeAttr(height, other.height),
      color: mergeAttr(color, other.color),
      repeat: mergeAttr(repeat, other.repeat),
      fit: mergeAttr(fit, other.fit),
    );
  }

  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec(
      image: resolveAttr(image, mix),
      width: resolveAttr(width, mix),
      height: resolveAttr(height, mix),
      color: resolveDto(color, mix),
      repeat: resolveAttr(repeat, mix) ?? ImageRepeat.noRepeat,
      fit: resolveAttr(fit, mix) ?? BoxFit.contain,
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
