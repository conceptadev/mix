import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/text/text.properties.dart';

class TextUtility {
  const TextUtility();

  TextProperties style(TextStyle? style) {
    return TextProperties(style: style);
  }

  TextProperties strutStyle(StrutStyle? strutStyle) {
    return TextProperties(strutStyle: strutStyle);
  }

  TextProperties textAlign(TextAlign? textAlign) {
    return TextProperties(textAlign: textAlign);
  }

  TextProperties textDirection(TextDirection? textDirection) {
    return TextProperties(textDirection: textDirection);
  }

  TextProperties locale(Locale? locale) {
    return TextProperties(locale: locale);
  }

  TextProperties softWrap(bool? softWrap) {
    return TextProperties(softWrap: softWrap);
  }

  TextProperties overflow(TextOverflow? overflow) {
    return TextProperties(overflow: overflow);
  }

  TextProperties textScaleFactor(double? textScaleFactor) {
    return TextProperties(textScaleFactor: textScaleFactor);
  }

  TextProperties maxLines(int? maxLines) {
    return TextProperties(maxLines: maxLines);
  }

  TextProperties semanticsLabel(String? semanticsLabel) {
    return TextProperties(semanticsLabel: semanticsLabel);
  }

  TextProperties textWidthBasis(TextWidthBasis? textWidthBasis) {
    return TextProperties(textWidthBasis: textWidthBasis);
  }
}

class TextStyleUtility {
  const TextStyleUtility();

  TextProperties background(Paint? background) {
    return TextProperties(
      style: TextStyle(background: background),
    );
  }

  TextProperties backgroundColor(Color? backgroundColor) {
    return TextProperties(
      style: TextStyle(backgroundColor: backgroundColor),
    );
  }

  TextProperties color(Color? color) {
    return TextProperties(
      style: TextStyle(color: color),
    );
  }

  TextProperties debugLabel(String? debugLabel) {
    return TextProperties(
      style: TextStyle(debugLabel: debugLabel),
    );
  }

  TextProperties decoration(TextDecoration? decoration) {
    return TextProperties(
      style: TextStyle(decoration: decoration),
    );
  }

  TextProperties decorationColor(Color? decorationColor) {
    return TextProperties(
      style: TextStyle(decorationColor: decorationColor),
    );
  }

  TextProperties decorationStyle(TextDecorationStyle? decorationStyle) {
    return TextProperties(
      style: TextStyle(decorationStyle: decorationStyle),
    );
  }

  TextProperties decorationThickness(double? decorationThickness) {
    return TextProperties(
      style: TextStyle(decorationThickness: decorationThickness),
    );
  }

  TextProperties fontFamily(String? fontFamily) {
    return TextProperties(
      style: TextStyle(fontFamily: fontFamily),
    );
  }

  TextProperties fontFamilyFallback(List<String>? fontFamilyFallback) {
    return TextProperties(
      style: TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  TextProperties fontFeatures(List<FontFeature>? fontFeatures) {
    return TextProperties(
      style: TextStyle(fontFeatures: fontFeatures),
    );
  }

  TextProperties fontSize(double? fontSize) {
    return TextProperties(
      style: TextStyle(fontSize: fontSize),
    );
  }

  TextProperties fontStyle(FontStyle? fontStyle) {
    return TextProperties(
      style: TextStyle(fontStyle: fontStyle),
    );
  }

  TextProperties fontWeight(FontWeight? fontWeight) {
    return TextProperties(
      style: TextStyle(fontWeight: fontWeight),
    );
  }

  TextProperties foreground(Paint? foreground) {
    return TextProperties(
      style: TextStyle(foreground: foreground),
    );
  }

  TextProperties height(double? height) {
    return TextProperties(
      style: TextStyle(height: height),
    );
  }

  TextProperties inherit({inherit = true}) {
    return TextProperties(
      style: TextStyle(inherit: inherit),
    );
  }

  TextProperties letterSpacing(double? letterSpacing) {
    return TextProperties(
      style: TextStyle(letterSpacing: letterSpacing),
    );
  }

  TextProperties locale(Locale? locale) {
    return TextProperties(
      style: TextStyle(locale: locale),
    );
  }

  TextProperties shadows(List<Shadow> shadows) {
    return TextProperties(
      style: TextStyle(shadows: shadows),
    );
  }

  TextProperties textBaseline(TextBaseline? textBaseline) {
    return TextProperties(
      style: TextStyle(textBaseline: textBaseline),
    );
  }

  TextProperties wordSpacing(double? wordSpacing) {
    return TextProperties(
      style: TextStyle(wordSpacing: wordSpacing),
    );
  }
}
