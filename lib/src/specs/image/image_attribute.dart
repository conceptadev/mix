import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'image_spec.dart';

class ImageSpecAttribute extends SpecAttribute<ImageSpec> {
  final double? width;
  final double? height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  const ImageSpecAttribute({
    this.centerSlice,
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.colorBlendMode,
    this.filterQuality,
    super.animated,
  });

  @override
  ImageSpec resolve(MixData mix) {
    return ImageSpec.exhaustive(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: mix.animation,
    );
  }

  @override
  ImageSpecAttribute merge(covariant ImageSpecAttribute? other) {
    if (other == null) return this;

    return ImageSpecAttribute(
      centerSlice: other.centerSlice ?? centerSlice,
      width: other.width ?? width,
      height: other.height ?? height,
      color: color?.merge(other.color) ?? other.color,
      repeat: other.repeat ?? repeat,
      fit: other.fit ?? fit,
      alignment: other.alignment ?? alignment,
      colorBlendMode: other.colorBlendMode ?? colorBlendMode,
      filterQuality: other.filterQuality ?? filterQuality,
      animated: other.animated ?? animated,
    );
  }

  @override
  get props => [
        width,
        height,
        color,
        repeat,
        fit,
        centerSlice,
        alignment,
        filterQuality,
        colorBlendMode,
        animated,
      ];
}
