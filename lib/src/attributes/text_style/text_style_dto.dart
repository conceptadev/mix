import 'dart:ui';

import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../../theme/exports.dart';
import '../box_shadow/shadow.dto.dart';
import '../color/color_dto.dart';
import '../exports.dart';
import '../resolvable_attribute.dart';

class TextStyleDto extends ResolvableDto<TextStyle> {
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
    final color = style.color;
    final backgroundColor = style.backgroundColor;
    final decorationColor = style.decorationColor;

    return style is TextStyleToken
        ? TextStyleDto(styleToken: style)
        : TextStyleDto(
            background: style.background,
            backgroundColor:
                backgroundColor == null ? null : ColorDto.from(backgroundColor),
            color: color == null ? null : ColorDto.from(color),
            debugLabel: style.debugLabel,
            decoration: style.decoration,
            decorationColor:
                decorationColor == null ? null : ColorDto.from(decorationColor),
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
            shadows: style.shadows?.map(ShadowDto.from).toList(),
            textBaseline: style.textBaseline,
            wordSpacing: style.wordSpacing,
          );
  }

  @override
  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return this;

    return TextStyleDto(
      background: other.background ?? background,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      color: other.color ?? color,
      debugLabel: other.debugLabel ?? debugLabel,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      decorationThickness: other.decorationThickness ?? decorationThickness,
      fontFamily: other.fontFamily ?? fontFamily,
      fontFamilyFallback: [
        ...?fontFamilyFallback,
        ...?other.fontFamilyFallback,
      ],
      fontFeatures: other.fontFeatures ?? fontFeatures,
      fontSize: other.fontSize ?? fontSize,
      fontStyle: other.fontStyle ?? fontStyle,
      fontWeight: other.fontWeight ?? fontWeight,
      foreground: other.foreground ?? foreground,
      height: other.height ?? height,
      inherit: other.inherit ?? inherit,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      locale: other.locale ?? locale,
      shadows: MergeMixin.mergeLists(shadows, other.shadows),
      styleToken: other.styleToken ?? styleToken,
      textBaseline: other.textBaseline ?? textBaseline,
      wordSpacing: other.wordSpacing ?? wordSpacing,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    TextStyleDto? styleRef;

    if (styleToken != null) {
      // Load as DTO for consistent merging behavior.
      final textStyle = mix.resolveToken.textStyle(styleToken!);
      styleRef = TextStyleDto.from(textStyle).merge(this);
    }

    styleRef ??= this;

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
