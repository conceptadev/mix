import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/text_style_token.dart';
import '../color/color_dto.dart';
import '../shadow/shadow_dto.dart';

@immutable
class TextStyleData extends Dto<TextStyle> with Mergeable<TextStyleData> {
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

  final TextStyleRef? ref;

  const TextStyleData({
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
  }) : ref = null;

  const TextStyleData.tokenRef(TextStyleRef tokenRef)
      : ref = tokenRef,
        background = null,
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

  static TextStyleData from(TextStyle style) {
    return style is TextStyleRef
        ? TextStyleData.tokenRef(style)
        : TextStyleData(
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
            letterSpacing: style.letterSpacing,
            locale: style.locale,
            shadows: style.shadows?.map(ShadowDto.from).toList(),
            textBaseline: style.textBaseline,
            wordSpacing: style.wordSpacing,
          );
  }

  static TextStyleData? maybeFrom(TextStyle? style) {
    return style == null ? null : TextStyleData.from(style);
  }

  bool get isTokenRef => ref != null;

  @override
  TextStyleData merge(TextStyleData? other) {
    if (other == null) return this;
    assert(
      ref == null && other.ref == null,
      'Cannot merge token refs',
    );

    return TextStyleData(
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
    return ref == null
        ? TextStyle(
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
          )
        : mix.tokens.textStyleRef(ref!);
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
        ref,
      ];
}

@immutable
class TextStyleDto extends Dto<TextStyle> with Mergeable<TextStyleDto> {
  final List<TextStyleData> value;
  const TextStyleDto._(this.value);

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
    return TextStyleDto(TextStyleData(
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

  factory TextStyleDto(TextStyleData value) => TextStyleDto._([value]);

  factory TextStyleDto.of(TextStyleToken token) {
    return TextStyleDto(TextStyleData.tokenRef(token()));
  }

  static TextStyleDto as(TextStyle style) {
    return TextStyleDto(TextStyleData.from(style));
  }

  static TextStyleDto? maybeAs(TextStyle? style) {
    return style == null ? null : TextStyleDto.as(style);
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
        .map((e) => e.isTokenRef ? TextStyleData.from(e.resolve(mix)) : e)
        .reduce((value, element) => value.merge(element))
        .resolve(mix);
  }

  @override
  TextStyleDto merge(TextStyleDto? other) {
    return other == null ? this : TextStyleDto._([...value, ...other.value]);
  }

  @override
  get props => [value];
}
