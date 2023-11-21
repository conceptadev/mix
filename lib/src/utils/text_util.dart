import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../core/extensions/values_ext.dart';
import '../directives/directive.dart';
import 'scalar_util.dart';

StrutStyleAttribute strutStyle(StrutStyle strutStyle) {
  return strutStyle.toAttribute();
}

TextDirective textDirective(Modifier<String> modifier) =>
    TextDirective([modifier]);

const textStyle = TextStyleUtility();

TextStyleAttribute bold() => textStyle.fontWeight.bold();

TextStyleAttribute italic() => textStyle.fontStyle.italic();

class TextStyleUtility {
  const TextStyleUtility();

  ColorUtility<TextStyleAttribute> get color =>
      ColorUtility((Color color) => textStyle(color: color));

  FontWeightUtility get fontWeight =>
      FontWeightUtility((value) => call(fontWeight: value));
  FontStyleUtility get fontStyle =>
      FontStyleUtility((value) => call(fontStyle: value));
  TextDecorationUtility get decoration =>
      TextDecorationUtility((value) => call(decoration: value));
  FontSizeUtility get fontSize =>
      FontSizeUtility((value) => call(fontSize: value));
  DoubleUtility<TextStyleAttribute> get letterSpacing =>
      DoubleUtility((value) => call(letterSpacing: value));
  DoubleUtility<TextStyleAttribute> get wordSpacing =>
      DoubleUtility((value) => call(wordSpacing: value));
  ColorUtility<TextStyleAttribute> get backgroundColor =>
      ColorUtility((value) => call(backgroundColor: value));
  ColorUtility<TextStyleAttribute> get decorationColor =>
      ColorUtility((value) => call(decorationColor: value));

  TextDecorationStyleUtility get decorationStyle =>
      TextDecorationStyleUtility((value) => call(decorationStyle: value));
  TextBaselineUtility<TextStyleAttribute> get textBaseline {
    return TextBaselineUtility((value) => call(textBaseline: value));
  }

  FontFamilyUtility get fontFamily =>
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
    final textStyle = TextStyleDto(
      background: background,
      backgroundColor: backgroundColor?.toDto(),
      color: color?.toDto(),
      decoration: decoration,
      decorationColor: decorationColor?.toDto(),
      decorationStyle: decorationStyle,
      fontFamily: fontFamily,
      fontFeatures: fontFeatures,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      foreground: foreground,
      height: height,
      letterSpacing: letterSpacing,
      shadows: shadows?.map((e) => e.toDto()).toList(),
      textBaseline: textBaseline,
      wordSpacing: wordSpacing,
    );

    return TextStyleAttribute(TextStyleListDto([textStyle]));
  }
}
