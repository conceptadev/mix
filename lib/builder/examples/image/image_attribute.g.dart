import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'image_spec.g.dart';

/// Represents the attributes of a [ImageTestSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ImageTestSpec].
///
/// Use this class to configure the attributes of a [ImageTestSpec] and pass it to
/// the [ImageTestSpec] constructor.
class ImageTestSpecAttribute extends SpecAttribute<ImageTestSpec> {
  const ImageTestSpecAttribute({
    this.alignment,
    super.animated,
    this.centerSlice,
    this.color,
    this.colorBlendMode,
    this.filterQuality,
    this.fit,
    this.height,
    this.repeat,
    this.width,
  });

  final AlignmentGeometry? alignment;

  final Rect? centerSlice;

  final ColorDto? color;

  final BlendMode? colorBlendMode;

  final FilterQuality? filterQuality;

  final BoxFit? fit;

  final double? height;

  final ImageRepeat? repeat;

  final double? width;

  @override
  ImageTestSpec resolve(MixData mix) {
    return ImageTestSpec(
      alignment: alignment,
      animated: animated?.resolve(mix),
      centerSlice: centerSlice,
      color: color?.resolve(mix),
      colorBlendMode: colorBlendMode,
      filterQuality: filterQuality,
      fit: fit,
      height: height,
      repeat: repeat,
      width: width,
    );
  }

  @override
  ImageTestSpecAttribute merge(ImageTestSpecAttribute? other) {
    if (other == null) return this;

    return ImageTestSpecAttribute(
      alignment: other.alignment ?? alignment,
      animated: animated?.merge(other.animated) ?? other.animated,
      centerSlice: other.centerSlice ?? centerSlice,
      color: color?.merge(other.color) ?? other.color,
      colorBlendMode: other.colorBlendMode ?? colorBlendMode,
      filterQuality: other.filterQuality ?? filterQuality,
      fit: other.fit ?? fit,
      height: other.height ?? height,
      repeat: other.repeat ?? repeat,
      width: other.width ?? width,
    );
  }

  /// The list of properties that constitute the state of this [ImageTestSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageTestSpecAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
      alignment,
      animated,
      centerSlice,
      color,
      colorBlendMode,
      filterQuality,
      fit,
      height,
      repeat,
      width,
    ];
  }
}
