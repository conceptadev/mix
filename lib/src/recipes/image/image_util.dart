import 'package:flutter/material.dart';

import '../../attributes/color/color_attribute.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/extensions/values_ext.dart';
import 'image_attribute.dart';

const image = ImageUtility.selfBuilder;

class ImageUtility<T> extends MixUtility<T, ImageMixAttribute> {
  static const selfBuilder = ImageUtility(MixUtility.selfBuilder);
  const ImageUtility(super.builder);

  ImageMixAttribute _color(ColorDto color) => ImageMixAttribute(color: color);
  ImageMixAttribute _repeat(ImageRepeat repeat) =>
      ImageMixAttribute(repeat: repeat);
  ImageMixAttribute _fit(BoxFit fit) => ImageMixAttribute(fit: fit);

  ColorUtility<ImageMixAttribute> get color => ColorUtility(_color);
  ImageRepeatUtility<ImageMixAttribute> get repeat =>
      ImageRepeatUtility(_repeat);
  BoxFitUtility<ImageMixAttribute> get fit => BoxFitUtility(_fit);

  ImageMixAttribute width(double width) => ImageMixAttribute(width: width);
  ImageMixAttribute height(double height) => ImageMixAttribute(height: height);

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
