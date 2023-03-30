import 'package:flutter/material.dart';

import '../../factory/mix_context.dart';
import 'image.attributes.dart';

class ImageProps {
  final Color? color;
  final double? scale;

  final double? width;
  final double? height;

  final BlendMode? colorBlendMode;
  final BoxFit? fit;

  final AlignmentGeometry alignment;
  final ImageRepeat repeat;

  const ImageProps({
    this.color,
    this.scale,
    this.width,
    this.height,
    this.colorBlendMode,
    this.fit,
    required this.alignment,
    required this.repeat,
  });

  factory ImageProps.fromContext(BuildContext context) {
    final mixContext = MixContext.ensureOf(context);
    final attributes = mixContext.attributesOfType<ImageAttributes>();

    var color = attributes?.color;

    return ImageProps(
      color: color?.resolve(context),
      scale: attributes?.scale,
      width: attributes?.width,
      height: attributes?.height,
      colorBlendMode: attributes?.colorBlendMode,
      fit: attributes?.fit,
      alignment: attributes?.alignment ?? Alignment.center,
      repeat: attributes?.repeat ?? ImageRepeat.noRepeat,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageProps &&
        other.color == color &&
        other.scale == scale &&
        other.width == width &&
        other.height == height &&
        other.colorBlendMode == colorBlendMode &&
        other.fit == fit &&
        other.alignment == alignment &&
        other.repeat == repeat;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        scale.hashCode ^
        width.hashCode ^
        height.hashCode ^
        colorBlendMode.hashCode ^
        fit.hashCode ^
        alignment.hashCode ^
        repeat.hashCode;
  }

  @override
  String toString() {
    return 'ImageMixer(color: $color, scale: $scale, width: $width, height: $height, colorBlendMode: $colorBlendMode, fit: $fit, alignment: $alignment, repeat: $repeat)';
  }
}
