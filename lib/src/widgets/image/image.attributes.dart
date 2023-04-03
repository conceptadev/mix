import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../dtos/color.dto.dart';

class ImageAttributes extends WidgetAttributes {
  final ColorDto? color;
  final double? scale;

  final double? width;
  final double? height;

  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final ImageRepeat? repeat;

  const ImageAttributes({
    this.color,
    this.scale,
    this.width,
    this.height,
    this.colorBlendMode,
    this.fit,
    this.alignment,
    this.repeat,
  });

  @override
  ImageAttributes merge(ImageAttributes? other) {
    if (other == null) return this;

    return ImageAttributes(
      color: other.color ?? color,
      scale: other.scale ?? scale,
      width: other.width ?? width,
      height: other.height ?? height,
      colorBlendMode: other.colorBlendMode ?? colorBlendMode,
      fit: other.fit ?? fit,
      alignment: other.alignment ?? alignment,
      repeat: other.repeat ?? repeat,
    );
  }

  @override
  get props => [
        color,
        scale,
        width,
        height,
        colorBlendMode,
        fit,
        alignment,
        repeat,
      ];
}
