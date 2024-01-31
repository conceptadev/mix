import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import 'image_attribute.dart';

const image = ImageUtility();

class ImageUtility extends SpecUtility<ImageSpecAttribute> {
  const ImageUtility();

  ImageSpecAttribute _only({
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
    return ImageSpecAttribute(
      width: width,
      height: height,
      color: color,
      repeat: repeat,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      colorBlendMode: blendMode,
      filterQuality: filterQuality,
    );
  }

  ColorUtility<ImageSpecAttribute> get color {
    return ColorUtility((color) => _only(color: color));
  }

  ImageRepeatUtility<ImageSpecAttribute> get repeat {
    return ImageRepeatUtility((repeat) => _only(repeat: repeat));
  }

  BoxFitUtility<ImageSpecAttribute> get fit {
    return BoxFitUtility((fit) => _only(fit: fit));
  }

  DoubleUtility<ImageSpecAttribute> get width {
    return DoubleUtility((width) => _only(width: width));
  }

  DoubleUtility<ImageSpecAttribute> get height {
    return DoubleUtility((height) => _only(height: height));
  }

  AlignmentUtility<ImageSpecAttribute> get alignment {
    return AlignmentUtility((alignment) => _only(alignment: alignment));
  }

  RectUtility<ImageSpecAttribute> get centerSlice {
    return RectUtility((rect) => _only(centerSlice: rect));
  }

  FilterQualityUtility<ImageSpecAttribute> get filterQuality {
    return FilterQualityUtility(
        (filterQuality) => _only(filterQuality: filterQuality));
  }

  BlendModeUtility<ImageSpecAttribute> get blendMode {
    return BlendModeUtility((blendMode) => _only(blendMode: blendMode));
  }
}
