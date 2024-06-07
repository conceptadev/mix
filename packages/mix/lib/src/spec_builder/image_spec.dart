import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageSpecDefinition {
  /// width of the image.
  final double? width;

  /// height of the image.
  final double? height;

  /// If non-null, this color is blended with each image pixel using colorBlendMode.
  final Color? color;

  /// How to paint any portions of the layout bounds not covered by the image.
  final ImageRepeat? repeat;

  /// Fit image into the space allocated during layout.
  final BoxFit? fit;

  /// Align the image within its bounds
  final AlignmentGeometry? alignment;

  /// The center slice for a nine-patch image.
  final Rect? centerSlice;

  /// Used to select a resolution-specific asset or scale the image.
  final FilterQuality? filterQuality;

  /// Combine the image with the color.
  final BlendMode? colorBlendMode;

  const ImageSpecDefinition({
    this.width,
    this.height,
    this.color,
    this.repeat,
    this.fit,
    this.alignment,
    this.centerSlice,
    this.filterQuality,
    this.colorBlendMode,
  });
}
