import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../core/spec.dart';
import 'image_attribute.dart';

class ImageSpecUtility<T extends Attribute>
    extends SpecUtility<T, ImageSpecAttribute> {
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

  ImageSpecUtility(super.builder);

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
      ImageSpecAttribute(
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
