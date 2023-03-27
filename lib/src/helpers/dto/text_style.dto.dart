import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'color.dto.dart';
import 'dto.dart';

class TextStyleDto extends Dto<TextStyle> {
  final String? fontFamily;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final ColorDto? color;
  final ColorDto? backgroundColor;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorDto? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final Locale? locale;
  final String? debugLabel;
  final double? height;

  const TextStyleDto({
    this.fontFamily,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.color,
    this.backgroundColor,
    this.shadows,
    this.fontFeatures,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.debugLabel,
    this.locale,
    this.height,
  });

  factory TextStyleDto.from(TextStyle style) {
    return TextStyleDto(
      fontFamily: style.fontFamily,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      fontSize: style.fontSize,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      textBaseline: style.textBaseline,
      color: ColorDto.maybeFrom(style.color),
      backgroundColor: ColorDto.maybeFrom(style.backgroundColor),
      decorationColor: ColorDto.maybeFrom(style.decorationColor),
      shadows: style.shadows,
      fontFeatures: style.fontFeatures,
      decoration: style.decoration,
      decorationStyle: style.decorationStyle,
      debugLabel: style.debugLabel,
      locale: style.locale,
      height: style.height,
    );
  }

  static maybeFrom(TextStyle? style) {
    return style != null ? TextStyleDto.from(style) : null;
  }

  // TODO: Move this to a test file
  factory TextStyleDto.random() {
    return TextStyleDto(
      color: ColorDto.random(),
      backgroundColor: ColorDto.random(),
      decorationColor: ColorDto.random(),
    );
  }

  @override
  TextStyle resolve(BuildContext context) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      color: color?.resolve(context),
      backgroundColor: backgroundColor?.resolve(context),
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor?.resolve(context),
      decorationStyle: decorationStyle,
      debugLabel: debugLabel,
      locale: locale,
    );
  }

  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return this;

    return TextStyleDto(
      fontFamily: other.fontFamily ?? fontFamily,
      fontWeight: other.fontWeight ?? fontWeight,
      fontStyle: other.fontStyle ?? fontStyle,
      fontSize: other.fontSize ?? fontSize,
      height: other.height ?? height,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      wordSpacing: other.wordSpacing ?? wordSpacing,
      textBaseline: other.textBaseline ?? textBaseline,
      color: other.color ?? color,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      shadows: other.shadows ?? shadows,
      fontFeatures: other.fontFeatures ?? fontFeatures,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      debugLabel: other.debugLabel ?? debugLabel,
      locale: other.locale ?? locale,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleDto &&
        other.fontFamily == fontFamily &&
        other.fontWeight == fontWeight &&
        other.fontStyle == fontStyle &&
        other.fontSize == fontSize &&
        other.letterSpacing == letterSpacing &&
        other.wordSpacing == wordSpacing &&
        other.height == height &&
        other.textBaseline == textBaseline &&
        other.color == color &&
        other.backgroundColor == backgroundColor &&
        listEquals(other.shadows, shadows) &&
        listEquals(other.fontFeatures, fontFeatures) &&
        other.decoration == decoration &&
        other.decorationColor == decorationColor &&
        other.decorationStyle == decorationStyle &&
        other.debugLabel == debugLabel &&
        other.locale == locale;
  }

  @override
  int get hashCode =>
      fontFamily.hashCode ^
      fontWeight.hashCode ^
      fontStyle.hashCode ^
      fontSize.hashCode ^
      letterSpacing.hashCode ^
      wordSpacing.hashCode ^
      textBaseline.hashCode ^
      color.hashCode ^
      height.hashCode ^
      backgroundColor.hashCode ^
      shadows.hashCode ^
      fontFeatures.hashCode ^
      decoration.hashCode ^
      decorationColor.hashCode ^
      decorationStyle.hashCode ^
      debugLabel.hashCode;

  @override
  String toString() {
    return 'TextStyleDto(fontFamily: $fontFamily, fontWeight: $fontWeight, fontStyle: $fontStyle, fontSize: $fontSize, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, textBaseline: $textBaseline, color: $color, backgroundColor: $backgroundColor, shadows: $shadows, fontFeatures: $fontFeatures, decoration: $decoration, decorationColor: $decorationColor, decorationStyle: $decorationStyle, debugLabel: $debugLabel)';
  }

  TextStyleDto copyWith({
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    ColorDto? color,
    ColorDto? backgroundColor,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    String? debugLabel,
    Locale? locale,
    double? height,
  }) {
    return TextStyleDto(
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      debugLabel: debugLabel ?? this.debugLabel,
      locale: locale ?? this.locale,
      height: height ?? this.height,
    );
  }
}
