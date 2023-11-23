import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'image_attribute.dart';

@immutable
class ImageRecipeMix extends RecipeMix<ImageRecipeMix> {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageRecipeMix({
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  const ImageRecipeMix.empty()
      : width = null,
        height = null,
        color = null,
        repeat = null,
        fit = null;

  static ImageRecipeMix resolve(MixData mix) {
    final recipe = mix.attributeOfType<ImageMixAttribute>()?.resolve(mix);

    return recipe ?? const ImageRecipeMix.empty();
  }

  @override
  ImageRecipeMix lerp(ImageRecipeMix? other, double t) {
    return ImageRecipeMix(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
      color: Color.lerp(color, other?.color, t),
      repeat: t < 0.5 ? repeat : other?.repeat,
      fit: t < 0.5 ? fit : other?.fit,
    );
  }

  @override
  ImageRecipeMix copyWith({
    ImageProvider? image,
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageRecipeMix(
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      repeat: repeat ?? this.repeat,
      fit: fit ?? this.fit,
    );
  }

  @override
  get props => [width, height, color, repeat, fit];
}
