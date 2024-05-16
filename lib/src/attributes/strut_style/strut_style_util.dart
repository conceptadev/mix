import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'strut_style_dto.dart';

@immutable
class StrutStyleUtility<T extends Attribute>
    extends DtoUtility<T, StrutStyleDto, StrutStyle> {
  late final fontFamily = FontFamilyUtility((v) => only(fontFamily: v));

  late final fontSize = FontSizeUtility((v) => only(fontSize: v));

  late final fontWeight = FontWeightUtility((v) => only(fontWeight: v));

  late final fontStyle = FontStyleUtility((v) => only(fontStyle: v));

  late final forceStrutHeight = BoolUtility((v) => only(forceStrutHeight: v));

  StrutStyleUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T height(double v) => only(height: v);

  T leading(double v) => only(leading: v);

  T fontFamilyFallback(List<String> v) => only(fontFamilyFallback: v);

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
    return only(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );
  }

  @override
  T only({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    return builder(
      StrutStyleDto(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        leading: leading,
        forceStrutHeight: forceStrutHeight,
      ),
    );
  }
}
