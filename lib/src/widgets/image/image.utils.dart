import 'package:flutter/material.dart';

import 'image.attributes.dart';

class ImageUtility {
  const ImageUtility._();

  static ImageAttributes image({
    Color? color,
    double? width,
    double? height,
    double? scale,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
  }) {
    return ImageAttributes(
      color: color,
      scale: scale,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
    );
  }

  static ImageAttributes color(Color color) {
    return ImageAttributes(color: color);
  }

  static ImageAttributes scale(double scale) {
    return ImageAttributes(scale: scale);
  }

  static ImageAttributes width(double width) {
    return ImageAttributes(width: width);
  }

  static ImageAttributes height(double height) {
    return ImageAttributes(height: height);
  }

  static ImageAttributes colorBlendMode(BlendMode colorBlendMode) {
    return ImageAttributes(colorBlendMode: colorBlendMode);
  }

  static ImageAttributes fit(BoxFit fit) {
    return ImageAttributes(fit: fit);
  }

  static ImageAttributes alignment(AlignmentGeometry alignment) {
    return ImageAttributes(alignment: alignment);
  }

  static ImageAttributes repeat(ImageRepeat repeat) {
    return ImageAttributes(repeat: repeat);
  }
}
