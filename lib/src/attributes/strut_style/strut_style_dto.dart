import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';

@immutable
class StrutStyleDto extends Dto<StrutStyle> {
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? leading;
  final bool? forceStrutHeight;

  const StrutStyleDto({
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.leading,
    this.forceStrutHeight,
  });

  static StrutStyleDto from(StrutStyle strutStyle) {
    return StrutStyleDto(
      fontFamily: strutStyle.fontFamily,
      fontFamilyFallback: strutStyle.fontFamilyFallback,
      fontSize: strutStyle.fontSize,
      fontWeight: strutStyle.fontWeight,
      fontStyle: strutStyle.fontStyle,
      height: strutStyle.height,
      leading: strutStyle.leading,
      forceStrutHeight: strutStyle.forceStrutHeight,
    );
  }

  static StrutStyleDto? maybeFrom(StrutStyle? strutStyle) {
    return strutStyle == null ? null : from(strutStyle);
  }

  @override
  StrutStyleDto merge(StrutStyleDto? other) {
    if (other == null) return this;

    return StrutStyleDto(
      fontFamily: other.fontFamily ?? fontFamily,
      fontFamilyFallback: other.fontFamilyFallback ?? fontFamilyFallback,
      fontSize: other.fontSize ?? fontSize,
      fontWeight: other.fontWeight ?? fontWeight,
      fontStyle: other.fontStyle ?? fontStyle,
      height: other.height ?? height,
      leading: other.leading ?? leading,
      forceStrutHeight: other.forceStrutHeight ?? forceStrutHeight,
    );
  }

  @override
  StrutStyle resolve(MixData mix) {
    const defaultValue = StrutStyle();

    return StrutStyle(
      fontFamily: fontFamily ?? defaultValue.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? defaultValue.fontFamilyFallback,
      fontSize: fontSize ?? defaultValue.fontSize,
      height: height ?? defaultValue.height,
      leading: leading ?? defaultValue.leading,
      fontWeight: fontWeight ?? defaultValue.fontWeight,
      fontStyle: fontStyle ?? defaultValue.fontStyle,
      forceStrutHeight: forceStrutHeight ?? defaultValue.forceStrutHeight,
    );
  }

  @override
  get props => [
        fontFamily,
        fontFamilyFallback,
        fontSize,
        fontWeight,
        fontStyle,
        height,
        leading,
        forceStrutHeight,
      ];
}
