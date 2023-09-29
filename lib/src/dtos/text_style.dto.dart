import 'dart:ui';

import 'package:flutter/material.dart';

import '../../mix.dart';
import 'color.dto.dart';
import 'dto.dart';
import 'shadow/shadow.dto.dart';

class TextStyleDto extends Dto<TextStyle> {
  final String? fontFamily;
  final FontWeight? fontWeight;

  final bool? inherit;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final ColorDto? color;
  final ColorDto? backgroundColor;
  final List<ShadowDto>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorDto? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final Locale? locale;
  final String? debugLabel;
  final double? height;
  final Paint? foreground;
  final Paint? background;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;

  final TextStyleToken? styleToken;

  const TextStyleDto({
    this.inherit,
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
    this.foreground,
    this.background,
    this.decorationThickness,
    this.fontFamilyFallback,
    this.styleToken,
  });

  factory TextStyleDto.from(TextStyle style) {
    if (style is TextStyleToken) {
      return TextStyleDto(styleToken: style);
    }

    return TextStyleDto(
      fontFamily: style.fontFamily,
      inherit: style.inherit,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      fontSize: style.fontSize,
      background: style.background,
      foreground: style.foreground,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      textBaseline: style.textBaseline,
      color: ColorDto.maybeFrom(style.color),
      backgroundColor: ColorDto.maybeFrom(style.backgroundColor),
      decorationColor: ColorDto.maybeFrom(style.decorationColor),
      shadows: style.shadows?.map((e) => ShadowDto.from(e)).toList(),
      fontFeatures: style.fontFeatures,
      decoration: style.decoration,
      decorationStyle: style.decorationStyle,
      debugLabel: style.debugLabel,
      locale: style.locale,
      height: style.height,
      decorationThickness: style.decorationThickness,
      fontFamilyFallback: style.fontFamilyFallback,
    );
  }

  static maybeFrom(TextStyle? style) {
    return style != null ? TextStyleDto.from(style) : null;
  }

  bool get hasToken => styleToken != null;

  @override
  TextStyle resolve(MixData mix) {
    TextStyleDto? styleRef;

    if (styleToken != null) {
      // Load as DTO for consistent merging behavior
      final textStyle = mix.resolveToken.textStyle(styleToken!);
      styleRef = TextStyleDto.from(textStyle);
    }

    styleRef = styleRef != null ? styleRef.merge(this) : this;

    return TextStyle(
      inherit: styleRef.inherit ?? true,
      fontFamily: styleRef.fontFamily,
      fontWeight: styleRef.fontWeight,
      fontStyle: styleRef.fontStyle,
      fontSize: styleRef.fontSize,
      letterSpacing: styleRef.letterSpacing,
      height: styleRef.height,
      wordSpacing: styleRef.wordSpacing,
      textBaseline: styleRef.textBaseline,
      color: styleRef.color?.resolve(mix),
      backgroundColor: styleRef.backgroundColor?.resolve(mix),
      shadows: styleRef.shadows?.map((e) => e.resolve(mix)).toList(),
      fontFeatures: styleRef.fontFeatures,
      decoration: styleRef.decoration,
      decorationColor: styleRef.decorationColor?.resolve(mix),
      decorationStyle: styleRef.decorationStyle,
      debugLabel: styleRef.debugLabel,
      background: styleRef.background,
      foreground: styleRef.foreground,
      locale: styleRef.locale,
      decorationThickness: styleRef.decorationThickness,
      fontFamilyFallback: styleRef.fontFamilyFallback,
    );
  }

  TextStyleDto copyWith({
    String? fontFamily,
    bool? inherit,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    ColorDto? color,
    ColorDto? backgroundColor,
    List<ShadowDto>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    String? debugLabel,
    Locale? locale,
    double? height,
    Paint? background,
    Paint? foreground,
    double? decorationThickness,
    List<String>? fontFamilyFallback,
    TextStyleToken? styleToken,
  }) {
    return TextStyleDto(
      inherit: inherit ?? this.inherit,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      fontSize: fontSize ?? this.fontSize,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadows: Mergeable.mergeLists(this.shadows, shadows),
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      debugLabel: debugLabel ?? this.debugLabel,
      locale: locale ?? this.locale,
      height: height ?? this.height,
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      fontFamilyFallback: [...?this.fontFamilyFallback, ...?fontFamilyFallback],
      styleToken: styleToken ?? this.styleToken,
    );
  }

  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return this;

    return copyWith(
      fontFamily: other.fontFamily,
      inherit: other.inherit,
      fontWeight: other.fontWeight,
      fontStyle: other.fontStyle,
      fontSize: other.fontSize,
      height: other.height,
      letterSpacing: other.letterSpacing,
      wordSpacing: other.wordSpacing,
      textBaseline: other.textBaseline,
      color: other.color,
      backgroundColor: other.backgroundColor,
      shadows: other.shadows,
      fontFeatures: other.fontFeatures,
      decoration: other.decoration,
      decorationColor: other.decorationColor,
      decorationStyle: other.decorationStyle,
      debugLabel: other.debugLabel,
      locale: other.locale,
      background: other.background,
      foreground: other.foreground,
      decorationThickness: other.decorationThickness,
      fontFamilyFallback: other.fontFamilyFallback,
      styleToken: other.styleToken,
    );
  }

  @override
  get props => [
        fontFamily,
        inherit,
        fontWeight,
        fontStyle,
        fontSize,
        letterSpacing,
        wordSpacing,
        textBaseline,
        color,
        backgroundColor,
        shadows,
        fontFeatures,
        decoration,
        decorationColor,
        decorationStyle,
        debugLabel,
        locale,
        height,
        background,
        foreground,
        decorationThickness,
        fontFamilyFallback,
        styleToken,
      ];
}
