import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'image_attribute.dart';

const image = ImageUtility(selfBuilder);

class ImageUtility<T extends SpecAttribute>
    extends SpecUtility<T, ImageSpecAttribute> {
  const ImageUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => only(color: color));
  }

  ImageRepeatUtility<T> get repeat {
    return ImageRepeatUtility((repeat) => only(repeat: repeat));
  }

  BoxFitUtility<T> get fit {
    return BoxFitUtility((fit) => only(fit: fit));
  }

  DoubleUtility<T> get width {
    return DoubleUtility((width) => only(width: width));
  }

  DoubleUtility<T> get height {
    return DoubleUtility((height) => only(height: height));
  }

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => only(alignment: alignment));
  }

  RectUtility<T> get centerSlice {
    return RectUtility((rect) => only(centerSlice: rect));
  }

  FilterQualityUtility<T> get filterQuality {
    return FilterQualityUtility(
      (filterQuality) => only(filterQuality: filterQuality),
    );
  }

  BlendModeUtility<T> get blendMode {
    return BlendModeUtility((blendMode) => only(blendMode: blendMode));
  }

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
    return builder(ImageSpecAttribute(
      centerSlice: centerSlice,
      width: width,
      height: height,
      color: color,
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      colorBlendMode: blendMode,
      filterQuality: filterQuality,
    ));
  }
}
