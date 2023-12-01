import 'package:flutter/material.dart';

import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/extensions/values_ext.dart';
import 'image_attribute.dart';

const image = ImageUtility.selfBuilder;

class ImageUtility<T> extends MixUtility<T, ImageMixAttribute> {
  static const selfBuilder = ImageUtility(MixUtility.selfBuilder);
  const ImageUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => builder(ImageMixAttribute(color: color)));
  }

  ImageRepeatUtility<T> get repeat {
    return ImageRepeatUtility(
      (repeat) => builder(ImageMixAttribute(repeat: repeat)),
    );
  }

  BoxFitUtility<T> get fit {
    return BoxFitUtility((fit) => builder(ImageMixAttribute(fit: fit)));
  }

  ImageMixAttribute call({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageMixAttribute(
      width: width,
      height: height,
      color: color?.toDto(),
      repeat: repeat,
      fit: fit,
    );
  }
}
