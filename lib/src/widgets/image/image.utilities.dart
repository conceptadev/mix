import 'package:flutter/material.dart';

import '../../dtos/color.dto.dart';
import 'image.attributes.dart';

class ImageUtility {
  const ImageUtility._();

  // ignore: long-parameter-list
  static StyledImageAttributes image({
    Color? color,
    double? scale,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
  }) {
    return StyledImageAttributes(
      color: ColorDto.maybeFrom(color),
      scale: scale,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
    );
  }

  static StyledImageAttributes color(Color color) {
    return StyledImageAttributes(color: ColorDto.from(color));
  }

  static StyledImageAttributes scale(double scale) {
    return StyledImageAttributes(scale: scale);
  }

  static StyledImageAttributes width(double width) {
    return StyledImageAttributes(width: width);
  }

  static StyledImageAttributes height(double height) {
    return StyledImageAttributes(height: height);
  }

  static StyledImageAttributes colorBlendMode(BlendMode colorBlendMode) {
    return StyledImageAttributes(colorBlendMode: colorBlendMode);
  }

  static StyledImageAttributes fit(BoxFit fit) {
    return StyledImageAttributes(fit: fit);
  }

  static StyledImageAttributes alignment(AlignmentGeometry alignment) {
    return StyledImageAttributes(alignment: alignment);
  }

  static StyledImageAttributes repeat(ImageRepeat repeat) {
    return StyledImageAttributes(repeat: repeat);
  }
}
