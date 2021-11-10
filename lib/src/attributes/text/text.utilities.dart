import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';

class TextUtility {
  const TextUtility();

  TextAttributes style(TextStyle? style) {
    return TextAttributes(style: style);
  }

  TextAttributes strutStyle(StrutStyle? strutStyle) {
    return TextAttributes(strutStyle: strutStyle);
  }

  TextAttributes textAlign(TextAlign? textAlign) {
    return TextAttributes(textAlign: textAlign);
  }

  TextAttributes textDirection(TextDirection? textDirection) {
    return TextAttributes(textDirection: textDirection);
  }

  TextAttributes locale(Locale? locale) {
    return TextAttributes(locale: locale);
  }

  TextAttributes softWrap(bool? softWrap) {
    return TextAttributes(softWrap: softWrap);
  }

  TextAttributes overflow(TextOverflow? overflow) {
    return TextAttributes(overflow: overflow);
  }

  TextAttributes textScaleFactor(double? textScaleFactor) {
    return TextAttributes(textScaleFactor: textScaleFactor);
  }

  TextAttributes maxLines(int? maxLines) {
    return TextAttributes(maxLines: maxLines);
  }

  TextAttributes semanticsLabel(String? semanticsLabel) {
    return TextAttributes(semanticsLabel: semanticsLabel);
  }

  TextAttributes textWidthBasis(TextWidthBasis? textWidthBasis) {
    return TextAttributes(textWidthBasis: textWidthBasis);
  }
}

class TextStyleUtility {
  const TextStyleUtility();

  TextAttributes background(Paint? background) {
    return TextAttributes(
      style: TextStyle(background: background),
    );
  }

  TextAttributes backgroundColor(Color? backgroundColor) {
    return TextAttributes(
      style: TextStyle(backgroundColor: backgroundColor),
    );
  }

  TextAttributes color(Color? color) {
    return TextAttributes(
      style: TextStyle(color: color),
    );
  }

  TextAttributes debugLabel(String? debugLabel) {
    return TextAttributes(
      style: TextStyle(debugLabel: debugLabel),
    );
  }

  TextAttributes decoration(TextDecoration? decoration) {
    return TextAttributes(
      style: TextStyle(decoration: decoration),
    );
  }

  TextAttributes decorationColor(Color? decorationColor) {
    return TextAttributes(
      style: TextStyle(decorationColor: decorationColor),
    );
  }

  TextAttributes decorationStyle(TextDecorationStyle? decorationStyle) {
    return TextAttributes(
      style: TextStyle(decorationStyle: decorationStyle),
    );
  }

  TextAttributes decorationThickness(double? decorationThickness) {
    return TextAttributes(
      style: TextStyle(decorationThickness: decorationThickness),
    );
  }

  TextAttributes fontFamily(String? fontFamily) {
    return TextAttributes(
      style: TextStyle(fontFamily: fontFamily),
    );
  }

  TextAttributes fontFamilyFallback(List<String>? fontFamilyFallback) {
    return TextAttributes(
      style: TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  TextAttributes fontFeatures(List<FontFeature>? fontFeatures) {
    return TextAttributes(
      style: TextStyle(fontFeatures: fontFeatures),
    );
  }

  TextAttributes fontSize(double? fontSize) {
    return TextAttributes(
      style: TextStyle(fontSize: fontSize),
    );
  }

  TextAttributes fontStyle(FontStyle? fontStyle) {
    return TextAttributes(
      style: TextStyle(fontStyle: fontStyle),
    );
  }

  TextAttributes fontWeight(FontWeight? fontWeight) {
    return TextAttributes(
      style: TextStyle(fontWeight: fontWeight),
    );
  }

  TextAttributes foreground(Paint? foreground) {
    return TextAttributes(
      style: TextStyle(foreground: foreground),
    );
  }

  TextAttributes height(double? height) {
    return TextAttributes(
      style: TextStyle(height: height),
    );
  }

  TextAttributes inherit({inherit = true}) {
    return TextAttributes(
      style: TextStyle(inherit: inherit),
    );
  }

  TextAttributes letterSpacing(double? letterSpacing) {
    return TextAttributes(
      style: TextStyle(letterSpacing: letterSpacing),
    );
  }

  TextAttributes locale(Locale? locale) {
    return TextAttributes(
      style: TextStyle(locale: locale),
    );
  }

  TextAttributes shadows(List<Shadow> shadows) {
    return TextAttributes(
      style: TextStyle(shadows: shadows),
    );
  }

  TextAttributes textBaseline(TextBaseline? textBaseline) {
    return TextAttributes(
      style: TextStyle(textBaseline: textBaseline),
    );
  }

  TextAttributes wordSpacing(double? wordSpacing) {
    return TextAttributes(
      style: TextStyle(wordSpacing: wordSpacing),
    );
  }
}
