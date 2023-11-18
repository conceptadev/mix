import 'dart:ui';

import 'package:flutter/material.dart';

import '../../mix.dart';

StrutStyleAttribute strutStyle(StrutStyle strutStyle) {
  return strutStyle.toAttribute();
}

TextDirectiveAttribute textDirective(TextDirective directive) =>
    TextDirectiveAttribute([directive]);

const textStyle = TextStyleUtility();

TextStyleAttribute bold() => textStyle.fontWeight.bold();

TextStyleAttribute italic() => textStyle.fontStyle.italic();

ShadowAttribute _shadowFromDto(Shadow shadow) {
  return ShadowAttribute(
    blurRadius: shadow.blurRadius,
    color: shadow.color.toAttribute(),
    offset: shadow.offset,
  );
}

List<ShadowAttribute>? _shadowsFromDto(List<Shadow>? shadows) {
  if (shadows == null) return null;
  if (shadows.isEmpty) return [];

  return shadows.map(_shadowFromDto).toList();
}

class TextStyleUtility {
  const TextStyleUtility();

  ColorUtility<TextStyleAttribute> get color =>
      ColorUtility((Color color) => textStyle(color: color));

  FontWeightUtility get fontWeight => const FontWeightUtility();
  FontStyleUtility get fontStyle => const FontStyleUtility();
  TextDecorationUtility get decoration => const TextDecorationUtility();
  FontSizeUtility get fontSize => const FontSizeUtility();
  LetterSpacingUtility get letterSpacing => const LetterSpacingUtility();
  WordSpacingUtility get wordSpacing => const WordSpacingUtility();
  ColorUtility<TextStyleAttribute> get backgroundColor =>
      ColorUtility((value) => call(backgroundColor: value));
  ColorUtility<TextStyleAttribute> get decorationColor =>
      ColorUtility((value) => call(decorationColor: value));

  TextDecorationStyleUtility get decorationStyle =>
      const TextDecorationStyleUtility();
  TextBaselineUtility<TextStyleAttribute> get textBaseline {
    return TextBaselineUtility((value) => call(textBaseline: value));
  }

  FontFamilyUtility get fontFamily => const FontFamilyUtility();

  FontFeatureUtility get fontFeatures => const FontFeatureUtility();
  TextStyleShadowsUtility get shadows => const TextStyleShadowsUtility();

  TextStyleAttribute as(TextStyle style) => style.toAttribute();

  TextStyleAttribute call({
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    List<Shadow>? shadows,
    Color? color,
    Color? backgroundColor,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    Paint? foreground,
    Paint? background,
    double? height,
  }) =>
      TextStyleAttribute(
        background: background?.toAttribute(),
        backgroundColor: backgroundColor?.toAttribute(),
        color: color?.toAttribute(),
        decoration: decoration,
        decorationColor: decorationColor?.toAttribute(),
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        shadows: _shadowsFromDto(shadows),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );
}
