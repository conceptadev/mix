import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/shadow_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../core/extensions/values_ext.dart';
import '../theme/tokens/text_style_token.dart';
import 'scalar_util.dart';

StrutStyleAttribute strutStyle(StrutStyle strutStyle) {
  return strutStyle.toAttribute();
}

const textStyle = TextStyleUtility();

TextStyleAttribute bold() => textStyle.fontWeight.bold();

TextStyleAttribute italic() => textStyle.fontStyle.italic();

class TextStyleUtility {
  const TextStyleUtility();

  TextStyleAttribute _color(ColorAttribute color) =>
      TextStyleAttribute.only(color: color);

  TextStyleAttribute _fontWeight(FontWeight weight) =>
      TextStyleAttribute.only(fontWeight: weight);
  TextStyleAttribute _fontStyle(FontStyle style) =>
      TextStyleAttribute.only(fontStyle: style);

  TextStyleAttribute _decoration(TextDecoration decoration) =>
      TextStyleAttribute.only(decoration: decoration);

  TextStyleAttribute _fontSize(double size) =>
      TextStyleAttribute.only(fontSize: size);

  TextStyleAttribute _letterSpacing(double spacing) =>
      TextStyleAttribute.only(letterSpacing: spacing);

  TextStyleAttribute _wordSpacing(double spacing) =>
      TextStyleAttribute.only(wordSpacing: spacing);

  TextStyleAttribute _backgroundColor(ColorAttribute color) =>
      TextStyleAttribute.only(backgroundColor: color);

  TextStyleAttribute _decorationColor(ColorAttribute color) =>
      TextStyleAttribute.only(decorationColor: color);

  TextStyleAttribute _decorationStyle(TextDecorationStyle style) =>
      TextStyleAttribute.only(decorationStyle: style);

  TextStyleAttribute _textBaseline(TextBaseline baseline) =>
      TextStyleAttribute.only(textBaseline: baseline);

  TextStyleAttribute _shadows(List<ShadowAttribute> shadows) =>
      TextStyleAttribute.only(shadows: shadows);

  ColorUtility<TextStyleAttribute> get color => ColorUtility(_color);

  FontWeightUtility<TextStyleAttribute> get fontWeight =>
      FontWeightUtility(_fontWeight);

  FontStyleUtility<TextStyleAttribute> get fontStyle =>
      FontStyleUtility(_fontStyle);

  TextDecorationUtility<TextStyleAttribute> get decoration =>
      TextDecorationUtility(_decoration);

  FontSizeUtility<TextStyleAttribute> get fontSize =>
      FontSizeUtility(_fontSize);

  DoubleUtility<TextStyleAttribute> get letterSpacing =>
      DoubleUtility(_letterSpacing);

  DoubleUtility<TextStyleAttribute> get wordSpacing =>
      DoubleUtility(_wordSpacing);

  ColorUtility<TextStyleAttribute> get backgroundColor =>
      ColorUtility(_backgroundColor);

  ColorUtility<TextStyleAttribute> get decorationColor =>
      ColorUtility(_decorationColor);

  TextDecorationStyleUtility<TextStyleAttribute> get decorationStyle =>
      TextDecorationStyleUtility(_decorationStyle);

  TextBaselineUtility<TextStyleAttribute> get textBaseline =>
      TextBaselineUtility(_textBaseline);

  TextStyleAttribute fontFamily(String family) =>
      TextStyleAttribute.only(fontFamily: family);

  TextStyleAttribute foreground(Paint foreground) =>
      TextStyleAttribute.only(foreground: foreground);

  TextStyleAttribute background(Paint background) =>
      TextStyleAttribute.only(background: background);

  TextStyleAttribute fontFeatures(List<FontFeature> fontFeatures) =>
      TextStyleAttribute.only(fontFeatures: fontFeatures);

  TextStyleAttribute height(double height) =>
      TextStyleAttribute.only(height: height);

  TextStyleAttribute locale(Locale locale) =>
      TextStyleAttribute.only(locale: locale);

  TextStyleAttribute debugLabel(String label) =>
      TextStyleAttribute.only(debugLabel: label);

  TextStyleAttribute decorationThickness(double thickness) =>
      TextStyleAttribute.only(decorationThickness: thickness);
  TextStyleAttribute fontFamilyFallback(List<String> fallback) =>
      TextStyleAttribute.only(fontFamilyFallback: fallback);

  TextStyleAttribute token(TextStyleToken token) =>
      TextStyleAttribute.token(token);

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
    TextDecorationStyle? decorationStyle,
    Paint? foreground,
    Paint? background,
    Color? decorationColor,
    double? height,
  }) {
    return TextStyleAttribute.only(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      color: color?.toAttribute(),
      backgroundColor: backgroundColor?.toAttribute(),
      shadows: shadows?.map((e) => e.toAttribute()).toList(),
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor?.toAttribute(),
      decorationStyle: decorationStyle,
      height: height,
      foreground: foreground,
      background: background,
    );
  }
}

class StrutStyleUtility {
  const StrutStyleUtility();

  StrutStyleAttribute call({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    return StrutStyleAttribute(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );
  }
}
