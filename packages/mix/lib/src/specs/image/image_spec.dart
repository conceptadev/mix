import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';
import 'image_attribute.dart';

@immutable
class ImageSpec extends Spec<ImageSpec> {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  const ImageSpec({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
    super.animated,
  });

  const ImageSpec.exhaustive({
    required this.width,
    required this.height,
    required this.color,
    required this.repeat,
    required this.fit,
    required this.alignment,
    required this.centerSlice,
    required this.filterQuality,
    required this.colorBlendMode,
    required super.animated,
  });

  static ImageSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return ImageSpec.from(mix);
  }

  static ImageSpec from(MixData mix) {
    return mix.attributeOf<ImageSpecAttribute>()?.resolve(mix) ??
        const ImageSpec();
  }

  @override
  ImageSpec lerp(ImageSpec? other, double t) {
    if (other == null) return this;

    return ImageSpec(
      width: lerpDouble(width, other.width, t),
      height: lerpDouble(height, other.height, t),
      color: Color.lerp(color, other.color, t),
      repeat: lerpSnap(repeat, other.repeat, t),
      fit: lerpSnap(fit, other.fit, t),
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      centerSlice: lerpSnap(centerSlice, other.centerSlice, t),
      filterQuality: lerpSnap(filterQuality, other.filterQuality, t),
      colorBlendMode: lerpSnap(colorBlendMode, other.colorBlendMode, t),
      animated: other.animated ?? animated,
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
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    FilterQuality? filterQuality,
    BlendMode? colorBlendMode,
    AnimatedData? animated,
  }) {
    return ImageSpec(
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      repeat: repeat ?? this.repeat,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      centerSlice: centerSlice ?? this.centerSlice,
      filterQuality: filterQuality ?? this.filterQuality,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      animated: animated ?? this.animated,
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

class ImageSpecTween extends Tween<ImageSpec> {
  ImageSpecTween({ImageSpec? begin, ImageSpec? end})
      : super(begin: begin, end: end);

  @override
  ImageSpec lerp(double t) => begin!.lerp(end, t);
}
