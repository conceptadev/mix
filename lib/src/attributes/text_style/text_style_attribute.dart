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
class TextStyleDto extends Dto<TextStyleDto, TextStyle> {
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
    this.letterSpacing,
    this.locale,
    this.shadows,
    this.textBaseline,
    this.wordSpacing,
  }) : token = null;

  const TextStyleDto.token(this.token)
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

  bool get isTokenRef => token != null;

  @override
  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return this;
    assert(
      token == null && other.token == null,
      'Cannot merge token refs',
    );

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

class TextStyleAttribute
    extends ResolvableAttribute<TextStyleAttribute, TextStyle> {
  // A list of TextStyleDto objects.
  final List<TextStyleDto> values;

  const TextStyleAttribute.raw(this.values);

  factory TextStyleAttribute(TextStyleDto style) {
    return TextStyleAttribute.raw([style]);
  }

  factory TextStyleAttribute.token(TextStyleToken token) {
    return TextStyleAttribute(TextStyleDto.token(token));
  }

  factory TextStyleAttribute.only({
    final String? fontFamily,
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
    Locale? locale,
    String? debugLabel,
    double? height,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    List<String>? fontFamilyFallback,
  }) {
    final textStyle = TextStyleDto(
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
    );

    return TextStyleAttribute.raw([textStyle]);
  }

  @override
  // This method resolves the TextStyleAttribute to a TextStyle.
  // It maps over the values list and checks if each TextStyleDto is a token reference.
  // If it is, it resolves the token reference and converts it to a TextStyleDto.
  // If it's not a token reference, it leaves the TextStyleDto as is.
  // Then it reduces the list of TextStyleDto objects to a single TextStyleDto by merging them.
  // Finally, it resolves the resulting TextStyleDto to a TextStyle.
  TextStyle resolve(MixData mix) {
    final textStylesDtos =
        values.map((e) => e.isTokenRef ? e.resolve(mix).toDto() : e);

    return textStylesDtos
        .reduce((value, element) => value.merge(element))
        .resolve(mix);
  }

  @override
  // This method merges this TextStyleAttribute with another TextStyleAttribute.
  // If the other TextStyleAttribute is null, it returns this TextStyleAttribute.
  // Otherwise, it returns a new TextStyleAttribute with the values of both TextStyleAttributes.
  TextStyleAttribute merge(TextStyleAttribute? other) {
    if (other == null) return this;

    return TextStyleAttribute.raw([...values, ...other.values]);
  }

  @override
  get props => [values];
}
