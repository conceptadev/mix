import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'image.attributes.dart';

class StyledImageDescriptor {
  final Color? color;
  final double? scale;

  final double? width;
  final double? height;

  final BlendMode? colorBlendMode;
  final BoxFit? fit;

  final AlignmentGeometry alignment;
  final ImageRepeat repeat;

  const StyledImageDescriptor({
    required this.alignment,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.height,
    required this.repeat,
    this.scale,
    this.width,
  });

  factory StyledImageDescriptor.fromContext(MixData mix) {
    final attributes = mix.attributesOfType<StyledImageAttributes>();

    return StyledImageDescriptor(
      alignment: attributes?.alignment ?? Alignment.center,
      color: attributes?.color?.resolve(mix),
      colorBlendMode: attributes?.colorBlendMode,
      fit: attributes?.fit,
      height: attributes?.height,
      repeat: attributes?.repeat ?? ImageRepeat.noRepeat,
      scale: attributes?.scale,
      width: attributes?.width,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyledImageDescriptor &&
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
  String toString() {
    return 'ImageMixer(color: $color, scale: $scale, width: $width, height: $height, colorBlendMode: $colorBlendMode, fit: $fit, alignment: $alignment, repeat: $repeat)';
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
}
