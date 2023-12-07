import 'package:flutter/material.dart';

import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/extensions/values_ext.dart';
import 'image_attribute.dart';

const image = ImageUtility();

class ImageUtility extends SpecUtility<ImageSpecAttribute> {
  const ImageUtility();

  ColorUtility<ImageSpecAttribute> get color {
    return ColorUtility((color) => ImageSpecAttribute(color: color));
  }

  ImageRepeatUtility<ImageSpecAttribute> get repeat {
    return ImageRepeatUtility(
      (repeat) => ImageSpecAttribute(repeat: repeat),
    );
  }

  BoxFitUtility<ImageSpecAttribute> get fit {
    return BoxFitUtility((fit) => ImageSpecAttribute(fit: fit));
  }

  ImageSpecAttribute call({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageSpecAttribute(
      width: width,
      height: height,
      color: color?.toDto(),
      repeat: repeat,
      fit: fit,
    );
  }
}
