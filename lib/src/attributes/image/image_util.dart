import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../../utils/scalar_util.dart';
import '../color_attribute.dart';
import 'image_attribute.dart';

const image = ImageUtility();

class ImageUtility extends MixUtility<ImageAttribute, ImageDto> {
  const ImageUtility() : super(ImageAttribute.new);

  ImageAttribute _color(Color color) => call(color: color);
  ImageAttribute _repeat(ImageRepeat repeat) => call(repeat: repeat);
  ImageAttribute _fit(BoxFit fit) => call(fit: fit);

  ColorUtility<ImageAttribute> get color => ColorUtility(_color);
  ImageRepeatUtility<ImageAttribute> get repeat => ImageRepeatUtility(_repeat);
  BoxFitUtility<ImageAttribute> get fit => BoxFitUtility(_fit);

  ImageAttribute width(double width) => call(width: width);
  ImageAttribute height(double height) => call(height: height);

  ImageAttribute call({
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    final image = ImageDto(
      width: width,
      height: height,
      color: color?.toDto(),
      repeat: repeat,
      fit: fit,
    );

    return builder(image);
  }
}
