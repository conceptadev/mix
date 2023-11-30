import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../../theme/tokens/text_style_token.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import '../shadow/shadow_dto.dart';
import '../shadow/shadow_util.dart';
import '../strut_style/strut_style_attribute.dart';
import 'text_style_attribute.dart';

class TextStyleUtility<T> extends MixUtility<T, TextStyleAttribute> {
  static const selfBuilder = TextStyleUtility(MixUtility.selfBuilder);

  const TextStyleUtility(super.builder);

  T _color(ColorDto color) => _only(color: color);
  T _fontWeight(FontWeight weight) => _only(fontWeight: weight);
  T _fontStyle(FontStyle style) => _only(fontStyle: style);

  T _decoration(TextDecoration decoration) => _only(decoration: decoration);

  T _fontSize(double size) => _only(fontSize: size);

  T _letterSpacing(double spacing) => _only(letterSpacing: spacing);

  T _wordSpacing(double spacing) => _only(wordSpacing: spacing);

  T _backgroundColor(ColorDto color) => _only(backgroundColor: color);

  T _decorationColor(ColorDto color) => _only(decorationColor: color);

  T _decorationStyle(TextDecorationStyle style) =>
      _only(decorationStyle: style);

  T _textBaseline(TextBaseline baseline) => _only(textBaseline: baseline);

  T _shadow(ShadowDto shadow) => _only(shadows: [shadow]);

  T _shadows(List<Shadow> shadows) => call(shadows: shadows);

  T _only({
    ColorDto? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    ColorDto? backgroundColor,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    TextBaseline? textBaseline,
    List<ShadowDto>? shadows,
    List<FontFeature>? fontFeatures,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    List<String>? fontFamilyFallback,
    Locale? locale,
    String? debugLabel,
    double? height,
  }) {
    final textStyle = TextStyleAttribute.only(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      color: color,
      backgroundColor: backgroundColor,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
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

  ColorUtility<T> get color => ColorUtility(_color);

  FontWeightUtility<T> get fontWeight => FontWeightUtility(_fontWeight);

  FontStyleUtility<T> get fontStyle => FontStyleUtility(_fontStyle);

  TextDecorationUtility<T> get decoration => TextDecorationUtility(_decoration);

  FontSizeUtility<T> get fontSize => FontSizeUtility(_fontSize);

  DoubleUtility<T> get letterSpacing => DoubleUtility(_letterSpacing);

  DoubleUtility<T> get wordSpacing => DoubleUtility(_wordSpacing);

  ColorUtility<T> get backgroundColor => ColorUtility(_backgroundColor);

  ColorUtility<T> get decorationColor => ColorUtility(_decorationColor);

  ListUtility<T, Shadow> get shadows => ListUtility<T, Shadow>(_shadows);

  ShadowUtility<T> get shadow => ShadowUtility(_shadow);

  TextDecorationStyleUtility<T> get decorationStyle =>
      TextDecorationStyleUtility(_decorationStyle);

  TextBaselineUtility<T> get textBaseline => TextBaselineUtility(_textBaseline);

  T as(TextStyle style) => builder(TextStyleAttribute.from(style));

  T italic() => fontStyle.italic();

  T bold() => fontWeight.bold();

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
      color: color?.toDto(),
      backgroundColor: backgroundColor?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor?.toDto(),
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
