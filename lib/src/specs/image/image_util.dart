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
    return ColorUtility((color) => call(color: color));
  }

  ImageRepeatUtility<T> get repeat {
    return ImageRepeatUtility((repeat) => call(repeat: repeat));
  }

  BoxFitUtility<T> get fit {
    return BoxFitUtility((fit) => call(fit: fit));
  }

  DoubleUtility<T> get width {
    return DoubleUtility((width) => call(width: width));
  }

  DoubleUtility<T> get height {
    return DoubleUtility((height) => call(height: height));
  }

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => call(alignment: alignment));
  }

  RectUtility<T> get centerSlice {
    return RectUtility((rect) => call(centerSlice: rect));
  }

  FilterQualityUtility<T> get filterQuality {
    return FilterQualityUtility(
      (filterQuality) => call(filterQuality: filterQuality),
    );
  }

  BlendModeUtility<T> get blendMode {
    return BlendModeUtility((blendMode) => call(blendMode: blendMode));
  }

  @override
  T call({
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
