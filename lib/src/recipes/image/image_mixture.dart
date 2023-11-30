import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'image_attribute.dart';

@immutable
class ImageMixture extends Mixture<ImageMixture> {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageMixture({
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  const ImageMixture.empty()
      : width = null,
        height = null,
        color = null,
        repeat = null,
        fit = null;

  static ImageMixture resolve(MixData mix) {
    final recipe = mix.attributeOf<ImageMixAttribute>()?.resolve(mix);

    return recipe ?? const ImageMixAttribute().resolve(mix);
  }

  @override
  ImageMixture merge(ImageMixture? other) {
    return copyWith(
      width: other?.width,
      height: other?.height,
      color: other?.color,
      repeat: other?.repeat,
      fit: other?.fit,
    );
  }

  @override
  ImageMixture lerp(ImageMixture? other, double t) {
    return ImageMixture(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
      color: Color.lerp(color, other?.color, t),
      repeat: t < 0.5 ? repeat : other?.repeat,
      fit: t < 0.5 ? fit : other?.fit,
    );
  }

  @override
  ImageMixture copyWith({
    ImageProvider? image,
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageMixture(
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