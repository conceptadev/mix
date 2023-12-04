// ignore_for_file: avoid-non-null-assertion

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../core/extensions/values_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/text_style_token.dart';
import '../color/color_dto.dart';
import '../shadow/shadow_dto.dart';

@immutable
class TextStyleDataDto extends Dto<TextStyle> with Mergeable<TextStyleDataDto> {
  final String? fontFamily;
  final FontWeight? fontWeight;
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

  final TextStyleToken? token;

  const TextStyleDataDto({
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
    this.letterSpacing,
    this.locale,
    this.shadows,
    this.textBaseline,
    this.wordSpacing,
  }) : token = null;

  const TextStyleDataDto.token(this.token)
      : background = null,
        backgroundColor = null,
        color = null,
        debugLabel = null,
        decoration = null,
        decorationColor = null,
        decorationStyle = null,
        decorationThickness = null,
        fontFamily = null,
        fontFamilyFallback = null,
        fontFeatures = null,
        fontSize = null,
        fontStyle = null,
        fontWeight = null,
        foreground = null,
        height = null,
        letterSpacing = null,
        locale = null,
        shadows = null,
        textBaseline = null,
        wordSpacing = null;

  static TextStyleDataDto from(TextStyle style) {
    return TextStyleDataDto(
      background: style.background,
      backgroundColor: style.backgroundColor?.toDto(),
      color: style.color?.toDto(),
      debugLabel: style.debugLabel,
      decoration: style.decoration,
      decorationColor: style.decorationColor?.toDto(),
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
      letterSpacing: style.letterSpacing,
      locale: style.locale,
      shadows: style.shadows?.map((e) => e.toDto()).toList(),
      textBaseline: style.textBaseline,
      wordSpacing: style.wordSpacing,
    );
  }

  static TextStyleDataDto? maybeFrom(TextStyle? style) {
    return style == null ? null : TextStyleDataDto.from(style);
  }

  bool get isTokenRef => token != null;

  @override
  TextStyleDataDto merge(TextStyleDataDto? other) {
    if (other == null) return this;
    assert(
      token == null && other.token == null,
      'Cannot merge token refs',
    );

    return TextStyleDataDto(
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
      letterSpacing: other.letterSpacing ?? letterSpacing,
      locale: other.locale ?? locale,
      shadows: shadows?.merge(other.shadows) ?? other.shadows,
      textBaseline: other.textBaseline ?? textBaseline,
      wordSpacing: other.wordSpacing ?? wordSpacing,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    return isTokenRef
        ? mix.tokens.textStyleToken(token!)
        : TextStyle(
            color: color?.resolve(mix),
            backgroundColor: backgroundColor?.resolve(mix),
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            textBaseline: textBaseline,
            height: height,
            locale: locale,
            foreground: foreground,
            background: background,
            shadows: shadows?.map((e) => e.resolve(mix)).toList(),
            fontFeatures: fontFeatures,
            decoration: decoration,
            decorationColor: decorationColor?.resolve(mix),
            decorationStyle: decorationStyle,
            decorationThickness: decorationThickness,
            debugLabel: debugLabel,
            fontFamily: fontFamily,
            fontFamilyFallback: fontFamilyFallback,
          );
  }

  @override
  get props => [
        fontFamily,
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
        token,
      ];
}

@immutable
class TextStyleDto extends Dto<TextStyle> with Mergeable<TextStyleDto> {
  final List<TextStyleDataDto> value;
  const TextStyleDto.raw(this.value);

  factory TextStyleDto.only({
    ColorDto? color,
    ColorDto? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    String? debugLabel,
    double? wordSpacing,
    TextBaseline? textBaseline,
    List<ShadowDto>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    Locale? locale,
    double? height,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
  }) {
    return TextStyleDto(TextStyleDataDto(
      background: background,
      backgroundColor: backgroundColor,
      color: color,
      debugLabel: debugLabel,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontFeatures: fontFeatures,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      foreground: foreground,
      height: height,
      letterSpacing: letterSpacing,
      locale: locale,
      shadows: shadows,
      textBaseline: textBaseline,
      wordSpacing: wordSpacing,
    ));
  }

  factory TextStyleDto(TextStyleDataDto value) {
    return TextStyleDto.raw([value]);
  }

  factory TextStyleDto.token(TextStyleToken token) {
    return TextStyleDto(TextStyleDataDto.token(token));
  }

  static TextStyleDto from(TextStyle style) {
    return TextStyleDto(TextStyleDataDto.from(style));
  }

  static TextStyleDto? maybeFrom(TextStyle? style) {
    return style == null ? null : TextStyleDto.from(style);
  }

  // This method resolves the TextStyleAttribute to a TextStyle.
  // It maps over the values list and checks if each TextStyleDto is a token reference.
  // If it is, it resolves the token reference and converts it to a TextStyleDto.
  // If it's not a token reference, it leaves the TextStyleDto as is.
  // Then it reduces the list of TextStyleDto objects to a single TextStyleDto by merging them.
  // Finally, it resolves the resulting TextStyleDto to a TextStyle.
  @override
  TextStyle resolve(MixData mix) {
    return value
        .map((e) => e.isTokenRef ? TextStyleDataDto.from(e.resolve(mix)) : e)
        .reduce((value, element) => value.merge(element))
        .resolve(mix);
  }

  @override
  TextStyleDto merge(TextStyleDto? other) {
    return other == null ? this : TextStyleDto.raw([...value, ...other.value]);
  }

  @override
  get props => [value];
}
