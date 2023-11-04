import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../attributes/color_attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

@immutable
class ImageSpec extends MixExtension<ImageSpec> {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;

  const ImageSpec({
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
  });

  static ImageSpec resolve(MixData mix) {
    return ImageSpec(
      width: mix.get<ImageWidthAttribute, double>(),
      height: mix.get<ImageHeightAttribute, double>(),
      color: mix.get<ImageColorAttribute, Color>(),
      repeat: mix.get<ImageRepeatAttribute, ImageRepeat>(),
      fit: mix.get<BoxFitAttribute, BoxFit>(),
    );
  }

  @override
  ImageSpec lerp(ImageSpec? other, double t) {
    return ImageSpec(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
      color: Color.lerp(color, other?.color, t),
      repeat: t < 0.5 ? repeat : other?.repeat,
      fit: t < 0.5 ? fit : other?.fit,
    );
  }

  @override
  ImageSpec copyWith({
    ImageProvider? image,
    double? width,
    double? height,
    Color? color,
    ImageRepeat? repeat,
    BoxFit? fit,
  }) {
    return ImageSpec(
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
