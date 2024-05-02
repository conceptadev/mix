import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'image_attribute.dart';

@Deprecated(r'use $image')
final image = ImageSpecUtility(selfBuilder);

final $image = ImageSpecUtility(selfBuilder);

class ImageSpecUtility<T extends SpecAttribute>
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
      ),
    );
  }
}
