import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';

@immutable
class ImageSpecLegacy extends Spec<ImageSpecLegacy> {
  final double? width, height;
  final Color? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  const ImageSpecLegacy({
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

  const ImageSpecLegacy.exhaustive({
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

  static ImageSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return ImageSpecLegacy.from(mix);
  }

  static ImageSpecLegacy from(MixData mix) {
    return mix.attributeOf<ImageSpecLegacyAttribute>()?.resolve(mix) ??
        const ImageSpecLegacy();
  }

  @override
  ImageSpecLegacy lerp(ImageSpecLegacy? other, double t) {
    if (other == null) return this;

    return ImageSpecLegacy(
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
  ImageSpecLegacy copyWith({
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
    return ImageSpecLegacy(
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

class ImageSpecLegacyTween extends Tween<ImageSpecLegacy> {
  ImageSpecLegacyTween({ImageSpecLegacy? begin, ImageSpecLegacy? end})
      : super(begin: begin, end: end);

  @override
  ImageSpecLegacy lerp(double t) => begin!.lerp(end, t);
}

class ImageSpecLegacyAttribute extends SpecAttribute<ImageSpecLegacy> {
  final double? width;
  final double? height;
  final ColorDto? color;
  final ImageRepeat? repeat;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Rect? centerSlice;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;

  const ImageSpecLegacyAttribute({
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
  ImageSpecLegacy resolve(MixData mix) {
    return ImageSpecLegacy.exhaustive(
      width: width,
      height: height,
      color: color?.resolve(mix),
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      filterQuality: filterQuality,
      colorBlendMode: colorBlendMode,
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  @override
  ImageSpecLegacyAttribute merge(covariant ImageSpecLegacyAttribute? other) {
    if (other == null) return this;

    return ImageSpecLegacyAttribute(
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

class ImageSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, ImageSpecLegacyAttribute> {
  late final color = ColorUtility((v) => only(color: v));
  late final repeat = ImageRepeatUtility((v) => only(repeat: v));
  late final fit = BoxFitUtility((v) => only(fit: v));
  late final width = DoubleUtility((v) => only(width: v));
  late final height = DoubleUtility((v) => only(height: v));
  late final alignment = AlignmentUtility((v) => only(alignment: v));
  late final centerSlice = RectUtility((v) => only(centerSlice: v));
  late final filterQuality =
      FilterQualityUtility((v) => only(filterQuality: v));
  late final blendMode = BlendModeUtility((v) => only(blendMode: v));

  ImageSpecLegacyUtility(super.builder);

  @override
  T only({
    double? width,
    double? height,
    ColorDto? color,
    ImageRepeat? repeat,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    Rect? centerSlice,
    BlendMode? blendMode,
    FilterQuality? filterQuality,
    AnimatedDataDto? animated,
  }) {
    return builder(
      ImageSpecLegacyAttribute(
        centerSlice: centerSlice,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
        alignment: alignment,
        colorBlendMode: blendMode,
        filterQuality: filterQuality,
        animated: animated,
      ),
    );
  }
}
