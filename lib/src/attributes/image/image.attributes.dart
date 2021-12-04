import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class ImageAttributes extends Attribute {
  final Color? color;
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
}
