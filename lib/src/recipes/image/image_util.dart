import 'package:flutter/material.dart';

import '../../attributes/color_attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../../utils/scalar_util.dart';
import 'image_attribute.dart';

const image = ImageUtility();

class ImageUtility<T> {
  const ImageUtility();

  ImageMixtureAttribute _color(ColorAttribute color) =>
      ImageMixtureAttribute(color: color);
  ImageMixtureAttribute _repeat(ImageRepeat repeat) =>
      ImageMixtureAttribute(repeat: repeat);
  ImageMixtureAttribute _fit(BoxFit fit) => ImageMixtureAttribute(fit: fit);

  ColorUtility<ImageMixtureAttribute> get color => ColorUtility(_color);
  ImageRepeatUtility<ImageMixtureAttribute> get repeat =>
      ImageRepeatUtility(_repeat);
  BoxFitUtility<ImageMixtureAttribute> get fit => BoxFitUtility(_fit);

  ImageMixtureAttribute width(double width) =>
      ImageMixtureAttribute(width: width);
  ImageMixtureAttribute height(double height) =>
      ImageMixtureAttribute(height: height);

  ImageMixtureAttribute call({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageMixtureAttribute(
      width: width,
      height: height,
      color: color?.toAttribute(),
      repeat: repeat,
      fit: fit,
    );
  }
}
