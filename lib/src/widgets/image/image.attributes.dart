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
  ImageAttributes copyWith({
    ColorDto? color,
    double? scale,
    double? width,
    double? height,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
  }) {
    return ImageAttributes(
      color: color ?? this.color,
      scale: scale ?? this.scale,
      width: width ?? this.width,
      height: height ?? this.height,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      repeat: repeat ?? this.repeat,
    );
  }

  @override
  ImageAttributes merge(ImageAttributes? other) {
    if (other == null) return this;

    return copyWith(
      color: other.color,
      scale: other.scale,
      width: other.width,
      height: other.height,
      colorBlendMode: other.colorBlendMode,
      fit: other.fit,
      alignment: other.alignment,
      repeat: other.repeat,
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
