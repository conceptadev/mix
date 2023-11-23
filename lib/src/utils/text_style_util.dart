import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/shadow_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../core/extensions/values_ext.dart';
import '../theme/tokens/text_style_token.dart';
import 'scalar_util.dart';

class TextStyleUtility<T> extends MixUtility<T, TextStyleAttribute> {
  const TextStyleUtility(super.builder);

  T _color(ColorAttribute color) =>
      builder(TextStyleAttribute.only(color: color));
  T _fontWeight(FontWeight weight) => call(fontWeight: weight);
  T _fontStyle(FontStyle style) => call(fontStyle: style);

  T _decoration(TextDecoration decoration) => call(decoration: decoration);

  T _fontSize(double size) => call(fontSize: size);

  T _letterSpacing(double spacing) => call(letterSpacing: spacing);

  T _wordSpacing(double spacing) => call(wordSpacing: spacing);

  T _backgroundColor(ColorAttribute color) =>
      builder(TextStyleAttribute.only(backgroundColor: color));

  T _decorationColor(ColorAttribute color) =>
      builder(TextStyleAttribute.only(decorationColor: color));

  T _decorationStyle(TextDecorationStyle style) => call(decorationStyle: style);

  T _textBaseline(TextBaseline baseline) => call(textBaseline: baseline);

  T _shadows(List<ShadowAttribute> shadows) => builder(TextStyleAttribute.only(
        shadows: shadows,
      ));

  ColorUtility<T> get color => ColorUtility(_color);

  FontWeightUtility<T> get fontWeight => FontWeightUtility(_fontWeight);

  FontStyleUtility<T> get fontStyle => FontStyleUtility(_fontStyle);

  TextDecorationUtility<T> get decoration => TextDecorationUtility(_decoration);

  FontSizeUtility<T> get fontSize => FontSizeUtility(_fontSize);

  DoubleUtility<T> get letterSpacing => DoubleUtility(_letterSpacing);

  DoubleUtility<T> get wordSpacing => DoubleUtility(_wordSpacing);

  ColorUtility<T> get backgroundColor => ColorUtility(_backgroundColor);

  ColorUtility<T> get decorationColor => ColorUtility(_decorationColor);

  TextDecorationStyleUtility<T> get decorationStyle =>
      TextDecorationStyleUtility(_decorationStyle);

  TextBaselineUtility<T> get textBaseline => TextBaselineUtility(_textBaseline);

  T fontFamily(String family) => call(fontFamily: family);

  T foreground(Paint foreground) => call(foreground: foreground);

  T background(Paint background) => call(background: background);

  T fontFeatures(List<FontFeature> fontFeatures) =>
      call(fontFeatures: fontFeatures);

  T height(double height) => call(height: height);

  T locale(Locale locale) => call(locale: locale);

  T debugLabel(String label) => call(debugLabel: label);

  T decorationThickness(double thickness) =>
      call(decorationThickness: thickness);
  T fontFamilyFallback(List<String> fallback) =>
      call(fontFamilyFallback: fallback);

  T token(TextStyleToken token) => builder(TextStyleAttribute.token(token));

  T as(TextStyle style) => builder(style.toAttribute());
  T call({
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
    Locale? locale,
    String? debugLabel,
    List<String>? fontFamilyFallback,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    Color? decorationColor,
    double? height,
  }) {
    final textStyle = TextStyleAttribute.only(
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
      locale: locale,
      debugLabel: debugLabel,
      height: height,
      foreground: foreground,
      background: background,
      decorationThickness: decorationThickness,
      fontFamilyFallback: fontFamilyFallback,
    );

    return builder(textStyle);
  }
}

class StrutStyleUtility<T> extends MixUtility<T, StrutStyleAttribute> {
  const StrutStyleUtility(super.builder);

  T _fontFamily(String fontFamily) => call(fontFamily: fontFamily);
  T _fontFamilyFallback(List<String> fontFamilyFallback) =>
      call(fontFamilyFallback: fontFamilyFallback);
  T _fontSize(double fontSize) => call(fontSize: fontSize);
  T _fontWeight(FontWeight fontWeight) => call(fontWeight: fontWeight);
  T _fontStyle(FontStyle fontStyle) => call(fontStyle: fontStyle);
  T _height(double height) => call(height: height);
  T _leading(double leading) => call(leading: leading);
  T _forceStrutHeight(bool forceStrutHeight) =>
      call(forceStrutHeight: forceStrutHeight);

  FontFamilyUtility<T> get fontFamily => FontFamilyUtility(_fontFamily);
  ListUtility<T, String> get fontFamilyFallback =>
      ListUtility(_fontFamilyFallback);

  DoubleUtility<T> get fontSize => DoubleUtility(_fontSize);
  FontWeightUtility<T> get fontWeight => FontWeightUtility(_fontWeight);
  FontStyleUtility<T> get fontStyle => FontStyleUtility(_fontStyle);
  DoubleUtility<T> get height => DoubleUtility(_height);
  DoubleUtility<T> get leading => DoubleUtility(_leading);
  BoolUtility<T> get forceStrutHeight => BoolUtility(_forceStrutHeight);

  T call({
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? leading,
    bool? forceStrutHeight,
  }) {
    final strutStyle = StrutStyleAttribute(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      leading: leading,
      forceStrutHeight: forceStrutHeight,
    );

    return builder(strutStyle);
  }
}
