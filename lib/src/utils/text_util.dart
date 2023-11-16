// ignore_for_file: long-parameter-list

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/shadow_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../directives/text_directive.dart';
import '../helpers/extensions/values_ext.dart';
import 'scalar_util.dart';

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

class FontWeightUtility {
  const FontWeightUtility();
  TextStyleAttribute bold() => textStyle(fontWeight: FontWeight.bold);
  TextStyleAttribute normal() => textStyle(fontWeight: FontWeight.normal);

  TextStyleAttribute call(FontWeight fontWeight) =>
      textStyle(fontWeight: fontWeight);
}

class TextDecorationUtility {
  const TextDecorationUtility();

  TextStyleAttribute underline() =>
      textStyle(decoration: TextDecoration.underline);
  TextStyleAttribute overline() =>
      textStyle(decoration: TextDecoration.overline);
  TextStyleAttribute lineThrough() =>
      textStyle(decoration: TextDecoration.lineThrough);
  TextStyleAttribute none() => textStyle(decoration: TextDecoration.none);

  TextStyleAttribute call(TextDecoration textDecoration) =>
      textStyle(decoration: textDecoration);
}

class FontStyleUtility {
  const FontStyleUtility();

  TextStyleAttribute italic() => textStyle(fontStyle: FontStyle.italic);
  TextStyleAttribute normal() => textStyle(fontStyle: FontStyle.normal);

  TextStyleAttribute call(FontStyle fontStyle) =>
      textStyle(fontStyle: fontStyle);
}

class FontSizeUtility {
  const FontSizeUtility();

  TextStyleAttribute call(double fontSize) => textStyle(fontSize: fontSize);
}

class LetterSpacingUtility {
  const LetterSpacingUtility();

  TextStyleAttribute call(double letterSpacing) =>
      textStyle(letterSpacing: letterSpacing);
}

class WordSpacingUtility {
  const WordSpacingUtility();

  TextStyleAttribute call(double wordSpacing) =>
      textStyle(wordSpacing: wordSpacing);
}

class BackgroundColorUtility {
  const BackgroundColorUtility();

  TextStyleAttribute call(Color backgroundColor) =>
      textStyle(backgroundColor: backgroundColor);
}

class PaintUtility {
  const PaintUtility();

  TextStyleAttribute foreground(Paint paint) => textStyle(foreground: paint);
  TextStyleAttribute background(Paint paint) => textStyle(background: paint);
}

class TextDecorationStyleUtility {
  const TextDecorationStyleUtility();

  TextStyleAttribute solid() =>
      textStyle(decorationStyle: TextDecorationStyle.solid);
  TextStyleAttribute double() =>
      textStyle(decorationStyle: TextDecorationStyle.double);
  TextStyleAttribute dotted() =>
      textStyle(decorationStyle: TextDecorationStyle.dotted);
  TextStyleAttribute dashed() =>
      textStyle(decorationStyle: TextDecorationStyle.dashed);
  TextStyleAttribute wavy() =>
      textStyle(decorationStyle: TextDecorationStyle.wavy);

  TextStyleAttribute call(TextDecorationStyle decorationStyle) =>
      textStyle(decorationStyle: decorationStyle);
}

class FontFeaturesUtility {
  const FontFeaturesUtility();

  TextStyleAttribute call(List<FontFeature> fontFeatures) =>
      textStyle(fontFeatures: fontFeatures);
}

class TextStyleShadowsUtility {
  const TextStyleShadowsUtility();

  TextStyleAttribute call(List<Shadow> shadows) => textStyle(shadows: shadows);
}

class TextStyleUtility {
  const TextStyleUtility();

  ColorUtility get color =>
      ColorUtility((Color color) => textStyle(color: color));

  FontWeightUtility get fontWeight => const FontWeightUtility();
  FontStyleUtility get fontStyle => const FontStyleUtility();
  TextDecorationUtility get decoration => const TextDecorationUtility();
  FontSizeUtility get fontSize => const FontSizeUtility();
  LetterSpacingUtility get letterSpacing => const LetterSpacingUtility();
  WordSpacingUtility get wordSpacing => const WordSpacingUtility();
  BackgroundColorUtility get backgroundColor => const BackgroundColorUtility();
  TextDecorationStyleUtility get decorationStyle =>
      const TextDecorationStyleUtility();
  TextBaselineUtility get textBaseline => const TextBaselineUtility();

  FontFeaturesUtility get fontFeatures => const FontFeaturesUtility();
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
    String? debugLabel,
    Locale? locale,
    double? height,
  }) =>
      TextStyleAttribute(
        background: background,
        backgroundColor: backgroundColor?.toAttribute(),
        color: color?.toAttribute(),
        debugLabel: debugLabel,
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
        locale: locale,
        shadows: _shadowsFromDto(shadows),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );
}
