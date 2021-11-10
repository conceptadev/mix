import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../base_attribute.dart';

class TextUtility {
  const TextUtility();

  TextAttribute style(TextStyle? style) {
    return TextAttribute(style: style);
  }

  TextAttribute strutStyle(StrutStyle? strutStyle) {
    return TextAttribute(strutStyle: strutStyle);
  }

  TextAttribute textAlign(TextAlign? textAlign) {
    return TextAttribute(textAlign: textAlign);
  }

  TextAttribute textDirection(TextDirection? textDirection) {
    return TextAttribute(textDirection: textDirection);
  }

  TextAttribute locale(Locale? locale) {
    return TextAttribute(locale: locale);
  }

  TextAttribute softWrap(bool? softWrap) {
    return TextAttribute(softWrap: softWrap);
  }

  TextAttribute overflow(TextOverflow? overflow) {
    return TextAttribute(overflow: overflow);
  }

  TextAttribute textScaleFactor(double? textScaleFactor) {
    return TextAttribute(textScaleFactor: textScaleFactor);
  }

  TextAttribute maxLines(int? maxLines) {
    return TextAttribute(maxLines: maxLines);
  }

  TextAttribute semanticsLabel(String? semanticsLabel) {
    return TextAttribute(semanticsLabel: semanticsLabel);
  }

  TextAttribute textWidthBasis(TextWidthBasis? textWidthBasis) {
    return TextAttribute(textWidthBasis: textWidthBasis);
  }
}

class TextStyleUtility {
  const TextStyleUtility();

  TextAttribute background(Paint? background) {
    return TextAttribute(
      style: TextStyle(background: background),
    );
  }

  TextAttribute backgroundColor(Color? backgroundColor) {
    return TextAttribute(
      style: TextStyle(backgroundColor: backgroundColor),
    );
  }

  TextAttribute color(Color? color) {
    return TextAttribute(
      style: TextStyle(color: color),
    );
  }

  TextAttribute debugLabel(String? debugLabel) {
    return TextAttribute(
      style: TextStyle(debugLabel: debugLabel),
    );
  }

  TextAttribute decoration(TextDecoration? decoration) {
    return TextAttribute(
      style: TextStyle(decoration: decoration),
    );
  }

  TextAttribute decorationColor(Color? decorationColor) {
    return TextAttribute(
      style: TextStyle(decorationColor: decorationColor),
    );
  }

  TextAttribute decorationStyle(TextDecorationStyle? decorationStyle) {
    return TextAttribute(
      style: TextStyle(decorationStyle: decorationStyle),
    );
  }

  TextAttribute decorationThickness(double? decorationThickness) {
    return TextAttribute(
      style: TextStyle(decorationThickness: decorationThickness),
    );
  }

  TextAttribute fontFamily(String? fontFamily) {
    return TextAttribute(
      style: TextStyle(fontFamily: fontFamily),
    );
  }

  TextAttribute fontFamilyFallback(List<String>? fontFamilyFallback) {
    return TextAttribute(
      style: TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  TextAttribute fontFeatures(List<FontFeature>? fontFeatures) {
    return TextAttribute(
      style: TextStyle(fontFeatures: fontFeatures),
    );
  }

  TextAttribute fontSize(double? fontSize) {
    return TextAttribute(
      style: TextStyle(fontSize: fontSize),
    );
  }

  TextAttribute fontStyle(FontStyle? fontStyle) {
    return TextAttribute(
      style: TextStyle(fontStyle: fontStyle),
    );
  }

  TextAttribute fontWeight(FontWeight? fontWeight) {
    return TextAttribute(
      style: TextStyle(fontWeight: fontWeight),
    );
  }

  TextAttribute foreground(Paint? foreground) {
    return TextAttribute(
      style: TextStyle(foreground: foreground),
    );
  }

  TextAttribute height(double? height) {
    return TextAttribute(
      style: TextStyle(height: height),
    );
  }

  TextAttribute inherit({inherit = true}) {
    return TextAttribute(
      style: TextStyle(inherit: inherit),
    );
  }

  TextAttribute letterSpacing(double? letterSpacing) {
    return TextAttribute(
      style: TextStyle(letterSpacing: letterSpacing),
    );
  }

  TextAttribute locale(Locale? locale) {
    return TextAttribute(
      style: TextStyle(locale: locale),
    );
  }

  TextAttribute shadows(List<Shadow> shadows) {
    return TextAttribute(
      style: TextStyle(shadows: shadows),
    );
  }

  TextAttribute textBaseline(TextBaseline? textBaseline) {
    return TextAttribute(
      style: TextStyle(textBaseline: textBaseline),
    );
  }

  TextAttribute wordSpacing(double? wordSpacing) {
    return TextAttribute(
      style: TextStyle(wordSpacing: wordSpacing),
    );
  }
}

class TextAttribute extends Attribute {
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  // Constructor
  const TextAttribute({
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });

  TextAttribute merge(TextAttribute attribute) {
    final wStyle = attribute.style ?? const TextStyle();
    final wStructStyle = attribute.strutStyle ?? const StrutStyle();
    return TextAttribute(
      style: wStyle.merge(style),
      strutStyle: wStructStyle.merge(strutStyle),
      textAlign: attribute.textAlign ?? textAlign,
      textDirection: attribute.textDirection ?? textDirection,
      locale: attribute.locale ?? locale,
      softWrap: attribute.softWrap ?? softWrap,
      overflow: attribute.overflow ?? overflow,
      textScaleFactor: attribute.textScaleFactor ?? textScaleFactor,
      maxLines: attribute.maxLines ?? maxLines,
      semanticsLabel: attribute.semanticsLabel ?? semanticsLabel,
      textWidthBasis: attribute.textWidthBasis ?? textWidthBasis,
    );
  }
}
