import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'strut_style_dto.dart';

@immutable
class StrutStyleUtility<T extends StyleAttribute> extends DtoUtility<T, StrutStyleDto, StrutStyle> {
  const StrutStyleUtility(super.builder) : super(valueToDto: StrutStyleDto.from);

  FontFamilyUtility<T> get fontFamily {
    return FontFamilyUtility((fontFamily) => call(fontFamily: fontFamily));
  }

  FontSizeUtility<T> get fontSize {
    return FontSizeUtility((fontSize) => call(fontSize: fontSize));
  }

  FontWeightUtility<T> get fontWeight {
    return FontWeightUtility((fontWeight) => call(fontWeight: fontWeight));
  }

  FontStyleUtility<T> get fontStyle {
    return FontStyleUtility((fontStyle) => call(fontStyle: fontStyle));
  }

  BoolUtility<T> get forceStrutHeight {
    return BoolUtility(
      (forceStrutHeight) => call(forceStrutHeight: forceStrutHeight),
    );
  }

  T height(double height) => call(height: height);

  T leading(double leading) => call(leading: leading);

  T fontFamilyFallback(List<String> fontFamilyFallback) =>
      call(fontFamilyFallback: fontFamilyFallback);

  T call({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    final strutStyle = StrutStyleDto(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );

    return builder(strutStyle);
  }
}
