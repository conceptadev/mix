import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';

class TextFriendlyUtility {
  const TextFriendlyUtility._();

  static TextAttributes textStyle({
    Color? color,
    Paint? background,
    Color? backgroundColor,
    String? debugLabel,
    FontWeight? weight,
    double? size,
    String? family,
    FontStyle? style,
    double? letterSpacing,
    double? wordSpacing,
    List<String>? fontFamilyFallback,
    Paint? foreground,
    double? height,
    bool inherit = true,
    Locale? locale,
    Shadow? shadow,
    List<Shadow>? shadows,
    double? decorationThickness,
    TextDecorationStyle? decorationStyle,
    TextBaseline? textBaseline,
    Color? decorationColor,
  }) {
    combineShadows() {
      final s = shadows ?? [];
      if (shadow != null) s.add(shadow);
      return s;
    }

    return TextAttributes(
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: family,
        fontStyle: style,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        fontFamilyFallback: fontFamilyFallback,
        foreground: foreground,
        height: height,
        inherit: inherit,
        locale: locale,
        shadows: combineShadows(),
        textBaseline: textBaseline,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle,
        decorationColor: decorationColor,
        debugLabel: debugLabel,
        background: background,
        backgroundColor: backgroundColor,
      ),
    );
  }

  static TextAttributes bold() {
    return TextStyleUtility.fontWeight(FontWeight.bold);
  }

  static TextAttributes italic() {
    return TextStyleUtility.fontStyle(FontStyle.italic);
  }

  static TextAttributes textShadow({
    Color color = const Color(0x33000000),
    double blurRadius = 0.0,
    Offset offset = Offset.zero,
  }) {
    return TextStyleUtility.shadows([
      Shadow(
        color: color,
        blurRadius: blurRadius,
        offset: offset,
      ),
    ]);
  }
}

class TextUtility {
  const TextUtility._();

  static TextAttributes style(TextStyle? style) {
    return TextAttributes(style: style);
  }

  static TextAttributes strutStyle(StrutStyle? strutStyle) {
    return TextAttributes(strutStyle: strutStyle);
  }

  static TextAttributes textAlign(TextAlign? textAlign) {
    return TextAttributes(textAlign: textAlign);
  }

  static TextAttributes locale(Locale? locale) {
    return TextAttributes(locale: locale);
  }

  static TextAttributes softWrap(bool? softWrap) {
    return TextAttributes(softWrap: softWrap);
  }

  static TextAttributes overflow(TextOverflow? overflow) {
    return TextAttributes(overflow: overflow);
  }

  static TextAttributes textScaleFactor(double? textScaleFactor) {
    return TextAttributes(textScaleFactor: textScaleFactor);
  }

  static TextAttributes maxLines(int? maxLines) {
    return TextAttributes(maxLines: maxLines);
  }

  static TextAttributes semanticsLabel(String? semanticsLabel) {
    return TextAttributes(semanticsLabel: semanticsLabel);
  }

  static TextAttributes textWidthBasis(TextWidthBasis? textWidthBasis) {
    return TextAttributes(textWidthBasis: textWidthBasis);
  }
}

class TextStyleUtility {
  const TextStyleUtility._();

  static TextAttributes background(Paint? background) {
    return TextAttributes(
      style: TextStyle(background: background),
    );
  }

  static TextAttributes backgroundColor(Color? backgroundColor) {
    return TextAttributes(
      style: TextStyle(backgroundColor: backgroundColor),
    );
  }

  static TextAttributes color(Color? color) {
    return TextAttributes(
      style: TextStyle(color: color),
    );
  }

  static TextAttributes debugLabel(String? debugLabel) {
    return TextAttributes(
      style: TextStyle(debugLabel: debugLabel),
    );
  }

  static TextAttributes decoration(TextDecoration? decoration) {
    return TextAttributes(
      style: TextStyle(decoration: decoration),
    );
  }

  static TextAttributes decorationColor(Color? decorationColor) {
    return TextAttributes(
      style: TextStyle(decorationColor: decorationColor),
    );
  }

  static TextAttributes decorationStyle(TextDecorationStyle? decorationStyle) {
    return TextAttributes(
      style: TextStyle(decorationStyle: decorationStyle),
    );
  }

  static TextAttributes decorationThickness(double? decorationThickness) {
    return TextAttributes(
      style: TextStyle(decorationThickness: decorationThickness),
    );
  }

  static TextAttributes fontFamily(String? fontFamily) {
    return TextAttributes(
      style: TextStyle(fontFamily: fontFamily),
    );
  }

  static TextAttributes fontFamilyFallback(List<String>? fontFamilyFallback) {
    return TextAttributes(
      style: TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  static TextAttributes fontFeatures(List<FontFeature>? fontFeatures) {
    return TextAttributes(
      style: TextStyle(fontFeatures: fontFeatures),
    );
  }

  static TextAttributes fontSize(double? fontSize) {
    return TextAttributes(
      style: TextStyle(fontSize: fontSize),
    );
  }

  static TextAttributes fontStyle(FontStyle? fontStyle) {
    return TextAttributes(
      style: TextStyle(fontStyle: fontStyle),
    );
  }

  static TextAttributes fontWeight(FontWeight? fontWeight) {
    return TextAttributes(
      style: TextStyle(fontWeight: fontWeight),
    );
  }

  static TextAttributes foreground(Paint? foreground) {
    return TextAttributes(
      style: TextStyle(foreground: foreground),
    );
  }

  static TextAttributes height(double? height) {
    return TextAttributes(
      style: TextStyle(height: height),
    );
  }

  static TextAttributes inherit({inherit = true}) {
    return TextAttributes(
      style: TextStyle(inherit: inherit),
    );
  }

  static TextAttributes letterSpacing(double? letterSpacing) {
    return TextAttributes(
      style: TextStyle(letterSpacing: letterSpacing),
    );
  }

  static TextAttributes locale(Locale? locale) {
    return TextAttributes(
      style: TextStyle(locale: locale),
    );
  }

  static TextAttributes shadows(List<Shadow> shadows) {
    return TextAttributes(
      style: TextStyle(shadows: shadows),
    );
  }

  static TextAttributes textBaseline(TextBaseline? textBaseline) {
    return TextAttributes(
      style: TextStyle(textBaseline: textBaseline),
    );
  }

  static TextAttributes wordSpacing(double? wordSpacing) {
    return TextAttributes(
      style: TextStyle(wordSpacing: wordSpacing),
    );
  }
}
