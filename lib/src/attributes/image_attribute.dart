import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../core/dto/double_dto.dart';
import '../core/style_attribute.dart';

class ImageColorAttribute extends ColorAttribute {
  const ImageColorAttribute(super.color);

  @override
  ImageColorAttribute create(value) => ImageColorAttribute(value);
}

class ImageAlignmentAttribute
    extends ValueAttribute<ImageAlignmentAttribute, Alignment> {
  const ImageAlignmentAttribute(super.value);

  @override
  ImageAlignmentAttribute create(value) => ImageAlignmentAttribute(value);
}

class ImageScaleAttribute extends DoubleAttribute {
  const ImageScaleAttribute(super.value);

  @override
  ImageScaleAttribute create(value) => ImageScaleAttribute(value);
}

class ImageFitAttribute extends ValueAttribute<ImageFitAttribute, BoxFit> {
  const ImageFitAttribute(super.value);

  @override
  ImageFitAttribute create(value) => ImageFitAttribute(value);
}

class ImageRepeatAttribute
    extends ValueAttribute<ImageRepeatAttribute, ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  @override
  ImageRepeatAttribute create(value) => ImageRepeatAttribute(value);
}
