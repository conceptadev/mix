import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../core/extensions/values_ext.dart';
import 'scalar_util.dart';

StrutStyleAttribute strutStyle(StrutStyle strutStyle) {
  return strutStyle.toAttribute();
}

const textStyle = TextStyleUtility();

TextStyleAttribute bold() => textStyle.fontWeight.bold();

TextStyleAttribute italic() => textStyle.fontStyle.italic();

class TextStyleUtility {
  const TextStyleUtility();

  ColorUtility<TextStyleAttribute> get color => ColorUtility(
        (Color color) => call(color: color),
      );

  FontWeightUtility<TextStyleAttribute> get fontWeight =>
      FontWeightUtility((value) => call(fontWeight: value));
  FontStyleUtility<TextStyleAttribute> get fontStyle =>
      FontStyleUtility((value) => call(fontStyle: value));
  TextDecorationUtility<TextStyleAttribute> get decoration =>
      TextDecorationUtility((value) => call(decoration: value));
  FontSizeUtility<TextStyleAttribute> get fontSize =>
      FontSizeUtility((value) => call(fontSize: value));
  DoubleUtility<TextStyleAttribute> get letterSpacing =>
      DoubleUtility((value) => call(letterSpacing: value));
  DoubleUtility<TextStyleAttribute> get wordSpacing =>
      DoubleUtility((value) => call(wordSpacing: value));
  ColorUtility<TextStyleAttribute> get backgroundColor =>
      ColorUtility((value) => call(backgroundColor: value));
  ColorUtility<TextStyleAttribute> get decorationColor =>
      ColorUtility((value) => call(decorationColor: value));

  TextDecorationStyleUtility<TextStyleAttribute> get decorationStyle =>
      TextDecorationStyleUtility((value) => call(decorationStyle: value));
  TextBaselineUtility<TextStyleAttribute> get textBaseline {
    return TextBaselineUtility((value) => call(textBaseline: value));
  }

  FontFamilyUtility<TextStyleAttribute> get fontFamily =>
      FontFamilyUtility(((value) => call(fontFamily: value)));

  TextStyleAttribute shadows(List<Shadow> shadows) => call(shadows: shadows);

  TextStyleAttribute foreground(Paint foreground) =>
      call(foreground: foreground);

  TextStyleAttribute background(Paint background) =>
      call(background: background);

  TextStyleAttribute fontFeatures(List<FontFeature> fontFeatures) =>
      call(fontFeatures: fontFeatures);

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
