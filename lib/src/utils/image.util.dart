// ignore_for_file: long-parameter-list

import 'package:flutter/material.dart';

import '../attributes/value_attributes.dart';
import '../core/dto/dtos.dart';

WidthAttribute imageWidth(double width) {
  return WidthAttribute(DoubleDto(width));
}

HeightAttribute imageHeight(double height) {
  return HeightAttribute(DoubleDto(height));
}

ImageColorAttribute imageColor(Color color) {
  return ImageColorAttribute(ColorDto(color));
}

ImageRepeatAttribute imageRepeat(ImageRepeat repeat) {
  return ImageRepeatAttribute(repeat);
}

BoxFitAttribute imageFit(BoxFit fit) {
  return BoxFitAttribute(fit);
}

// const imageColor = ImageUtility.color;
// const imageScale = ImageUtility.scale;
// const imageColorBlendMode = ImageUtility.colorBlendMode;
// const imageFit = ImageUtility.fit;
// const imageAlignment = ImageUtility.alignment;
// const imageRepeat = ImageUtility.repeat;
