import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'image_attribute.g.dart';

/// A specification that defines the visual properties of ImageTestSpec.
///
/// To retrieve an instance of [ImageTestSpec], use the [ImageTestSpec.of] method with a
/// [BuildContext], or the [ImageTestSpec.from] method with [MixData]
class ImageTestSpec extends Spec<ImageTestSpec> {
  /// Creates a [ImageTestSpec] with the given fields
  ///
// All parameters are optional
  const ImageTestSpec({
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

  final Color? color;

  final BlendMode? colorBlendMode;

  final FilterQuality? filterQuality;

  final BoxFit? fit;

  final double? height;

  final ImageRepeat? repeat;

  final double? width;

  /// Retrieves the [ImageTestSpec] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [ImageTestSpec].
  static ImageTestSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return ImageTestSpec.from(mix);
  }

  /// Retrieves the [ImageTestSpec] from a MixData.
  static ImageTestSpec from(MixData mix) {
    return mix.attributeOf<ImageTestSpecAttribute>()?.resolve(mix) ??
        const ImageTestSpec();
  }

  /// Creates a copy of this [ImageTestSpec] but with the given fields
  /// replaced with the new values.
  @override
  ImageTestSpec copyWith({
    AlignmentGeometry? alignment,
    AnimatedData? animated,
    Rect? centerSlice,
    Color? color,
    BlendMode? colorBlendMode,
    FilterQuality? filterQuality,
    BoxFit? fit,
    double? height,
    ImageRepeat? repeat,
    double? width,
  }) {
    return ImageTestSpec(
      alignment: alignment ?? this.alignment,
      animated: animated ?? this.animated,
      centerSlice: centerSlice ?? this.centerSlice,
      color: color ?? this.color,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      filterQuality: filterQuality ?? this.filterQuality,
      fit: fit ?? this.fit,
      height: height ?? this.height,
      repeat: repeat ?? this.repeat,
      width: width ?? this.width,
    );
  }

  @override
  ImageTestSpec lerp(
    ImageTestSpec? other,
    double t,
  ) {
    if (other == null) return this;

    return ImageTestSpec(
      alignment: AlignmentGeometry.lerp(
        alignment,
        other.alignment,
        t,
      ),
      animated: t < 0.5 ? animated : other.animated,
      centerSlice: t < 0.5 ? centerSlice : other.centerSlice,
      color: t < 0.5 ? color : other.color,
      colorBlendMode: t < 0.5 ? colorBlendMode : other.colorBlendMode,
      filterQuality: t < 0.5 ? filterQuality : other.filterQuality,
      fit: t < 0.5 ? fit : other.fit,
      height: lerpDouble(
        height,
        other.height,
        t,
      ),
      repeat: t < 0.5 ? repeat : other.repeat,
      width: lerpDouble(
        width,
        other.width,
        t,
      ),
    );
  }

  /// The list of properties that constitute the state of this [ImageTestSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ImageTestSpec] instances for equality.
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

/// A tween that interpolates between two [ImageTestSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ImageTestSpec] specifications.
class ImageTestSpecTween extends Tween<ImageTestSpec?> {
  ImageTestSpecTween({
    super.begin,
    super.end,
  });

  @override
  ImageTestSpec lerp(double t) {
    if (begin == null && end == null) return const ImageTestSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
