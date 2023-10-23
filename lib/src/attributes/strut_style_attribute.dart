import 'package:flutter/painting.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class StrutStyleAttribute extends StyleAttribute<StrutStyle> {
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? leading;
  final bool? forceStrutHeight;

  final _default = const StrutStyle();

  const StrutStyleAttribute._({
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.leading,
    this.forceStrutHeight,
  });

  const StrutStyleAttribute.only({
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.leading,
    this.forceStrutHeight,
  });

  factory StrutStyleAttribute.from(StrutStyle strutStyle) {
    return StrutStyleAttribute.only(
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

  static StrutStyleAttribute? maybeFrom(StrutStyle? strutStyle) {
    return strutStyle == null ? null : StrutStyleAttribute.from(strutStyle);
  }

  @override
  StrutStyleAttribute merge(StrutStyleAttribute? other) {
    if (other == null) return this;

    return StrutStyleAttribute._(
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
    return StrutStyle(
      fontFamily: fontFamily ?? _default.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? _default.fontFamilyFallback,
      fontSize: fontSize ?? _default.fontSize,
      height: height ?? _default.height,
      leading: leading ?? _default.leading,
      fontWeight: fontWeight ?? _default.fontWeight,
      fontStyle: fontStyle ?? _default.fontStyle,
      forceStrutHeight: forceStrutHeight ?? _default.forceStrutHeight,
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
