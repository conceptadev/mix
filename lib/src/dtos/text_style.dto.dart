import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/exports.dart';
import '../factory/exports.dart';
import '../theme/exports.dart';
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
    this.background,
    this.backgroundColor,
    this.color,
    this.debugLabel,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontFeatures,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.foreground,
    this.height,
    this.inherit,
    this.letterSpacing,
    this.locale,
    this.shadows,
    this.styleToken,
    this.textBaseline,
    this.wordSpacing,
  });

  factory TextStyleDto.from(TextStyle style) {
    return style is TextStyleToken
        ? TextStyleDto(styleToken: style)
        : TextStyleDto(
            background: style.background,
            backgroundColor: ColorDto.maybeFrom(style.backgroundColor),
            color: ColorDto.maybeFrom(style.color),
            debugLabel: style.debugLabel,
            decoration: style.decoration,
            decorationColor: ColorDto.maybeFrom(style.decorationColor),
            decorationStyle: style.decorationStyle,
            decorationThickness: style.decorationThickness,
            fontFamily: style.fontFamily,
            fontFamilyFallback: style.fontFamilyFallback,
            fontFeatures: style.fontFeatures,
            fontSize: style.fontSize,
            fontStyle: style.fontStyle,
            fontWeight: style.fontWeight,
            foreground: style.foreground,
            height: style.height,
            inherit: style.inherit,
            letterSpacing: style.letterSpacing,
            locale: style.locale,
            shadows: style.shadows?.map((e) => ShadowDto.from(e)).toList(),
            textBaseline: style.textBaseline,
            wordSpacing: style.wordSpacing,
          );
  }

  static maybeFrom(TextStyle? style) {
    return style == null ? null : TextStyleDto.from(style);
  }

  bool get hasToken => styleToken != null;

  TextStyleDto copyWith({
    Paint? background,
    ColorDto? backgroundColor,
    ColorDto? color,
    String? debugLabel,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    bool? inherit,
    double? letterSpacing,
    Locale? locale,
    List<ShadowDto>? shadows,
    TextStyleToken? styleToken,
    TextBaseline? textBaseline,
    double? wordSpacing,
  }) {
    return TextStyleDto(
      background: background ?? this.background,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      color: color ?? this.color,
      debugLabel: debugLabel ?? this.debugLabel,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: [...?this.fontFamilyFallback, ...?fontFamilyFallback],
      fontFeatures: fontFeatures ?? this.fontFeatures,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      fontWeight: fontWeight ?? this.fontWeight,
      foreground: foreground ?? this.foreground,
      height: height ?? this.height,
      inherit: inherit ?? this.inherit,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      locale: locale ?? this.locale,
      shadows: Mergeable.mergeLists(this.shadows, shadows),
      styleToken: styleToken ?? this.styleToken,
      textBaseline: textBaseline ?? this.textBaseline,
      wordSpacing: wordSpacing ?? this.wordSpacing,
    );
  }

  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return this;

    return copyWith(
      background: other.background,
      backgroundColor: other.backgroundColor,
      color: other.color,
      debugLabel: other.debugLabel,
      decoration: other.decoration,
      decorationColor: other.decorationColor,
      decorationStyle: other.decorationStyle,
      decorationThickness: other.decorationThickness,
      fontFamily: other.fontFamily,
      fontFamilyFallback: other.fontFamilyFallback,
      fontFeatures: other.fontFeatures,
      fontSize: other.fontSize,
      fontStyle: other.fontStyle,
      fontWeight: other.fontWeight,
      foreground: other.foreground,
      height: other.height,
      inherit: other.inherit,
      letterSpacing: other.letterSpacing,
      locale: other.locale,
      shadows: other.shadows,
      styleToken: other.styleToken,
      textBaseline: other.textBaseline,
      wordSpacing: other.wordSpacing,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    TextStyleDto? styleRef;

    if (styleToken != null) {
      // Load as DTO for consistent merging behavior.
      final textStyle = mix.resolveToken.textStyle(styleToken!);
      styleRef = TextStyleDto.from(textStyle);
    }

    styleRef = styleRef != null ? styleRef.merge(this) : this;

    return TextStyle(
      inherit: styleRef.inherit ?? true,
      color: styleRef.color?.resolve(mix),
      backgroundColor: styleRef.backgroundColor?.resolve(mix),
      fontSize: styleRef.fontSize,
      fontWeight: styleRef.fontWeight,
      fontStyle: styleRef.fontStyle,
      letterSpacing: styleRef.letterSpacing,
      wordSpacing: styleRef.wordSpacing,
      textBaseline: styleRef.textBaseline,
      height: styleRef.height,
      locale: styleRef.locale,
      foreground: styleRef.foreground,
      background: styleRef.background,
      shadows: styleRef.shadows?.map((e) => e.resolve(mix)).toList(),
      fontFeatures: styleRef.fontFeatures,
      decoration: styleRef.decoration,
      decorationColor: styleRef.decorationColor?.resolve(mix),
      decorationStyle: styleRef.decorationStyle,
      decorationThickness: styleRef.decorationThickness,
      debugLabel: styleRef.debugLabel,
      fontFamily: styleRef.fontFamily,
      fontFamilyFallback: styleRef.fontFamilyFallback,
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
