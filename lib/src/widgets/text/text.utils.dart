import 'dart:ui';

import 'package:flutter/material.dart';
import 'text.attributes.dart';

/// @nodoc
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

/// ## Widget:
/// - [TextMix](TextMix-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class TextUtility {
  const TextUtility._();

  /// Short Utils: style
  static TextAttributes style(TextStyle? style) {
    return TextAttributes(style: style);
  }

  /// Short Utils: strutStyle
  static TextAttributes strutStyle(StrutStyle? strutStyle) {
    return TextAttributes(strutStyle: strutStyle);
  }

  /// Short Utils: textAlign
  static TextAttributes textAlign(TextAlign? textAlign) {
    return TextAttributes(textAlign: textAlign);
  }

  /// Short Utils: locale
  static TextAttributes locale(Locale? locale) {
    return TextAttributes(locale: locale);
  }

  /// Short Utils: softWrap
  static TextAttributes softWrap(bool? softWrap) {
    return TextAttributes(softWrap: softWrap);
  }

  /// Short Utils: overflow
  static TextAttributes overflow(TextOverflow? overflow) {
    return TextAttributes(overflow: overflow);
  }

  /// Short Utils: textScaleFactor
  static TextAttributes textScaleFactor(double? textScaleFactor) {
    return TextAttributes(textScaleFactor: textScaleFactor);
  }

  /// Short Utils: maxLines
  static TextAttributes maxLines(int? maxLines) {
    return TextAttributes(maxLines: maxLines);
  }

  /// Short Utils: textWidthBasis
  static TextAttributes textWidthBasis(TextWidthBasis? textWidthBasis) {
    return TextAttributes(textWidthBasis: textWidthBasis);
  }
}

/// ## Widget:
/// - [TextMix](TextMix-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class TextStyleUtility {
  const TextStyleUtility._();

  /// Short Utils: textBackground
  static TextAttributes background(Paint? background) {
    return TextAttributes(
      style: TextStyle(background: background),
    );
  }

  /// Short Utils: textBgColor
  static TextAttributes backgroundColor(Color? backgroundColor) {
    return TextAttributes(
      style: TextStyle(backgroundColor: backgroundColor),
    );
  }

  /// Short Utils: textColor
  static TextAttributes color(Color? color) {
    return TextAttributes(
      style: TextStyle(color: color),
    );
  }

  /// Short Utils: debugLabel
  static TextAttributes debugLabel(String? debugLabel) {
    return TextAttributes(
      style: TextStyle(debugLabel: debugLabel),
    );
  }

  /// Short Utils: textDecoration
  static TextAttributes decoration(TextDecoration? decoration) {
    return TextAttributes(
      style: TextStyle(decoration: decoration),
    );
  }

  /// Short Utils: textDecorationColor
  static TextAttributes decorationColor(Color? decorationColor) {
    return TextAttributes(
      style: TextStyle(decorationColor: decorationColor),
    );
  }

  /// Short Utils: textDecorationStyle
  static TextAttributes decorationStyle(TextDecorationStyle? decorationStyle) {
    return TextAttributes(
      style: TextStyle(decorationStyle: decorationStyle),
    );
  }

  /// Short Utils: textDecorationThickness
  static TextAttributes decorationThickness(double? decorationThickness) {
    return TextAttributes(
      style: TextStyle(decorationThickness: decorationThickness),
    );
  }

  /// Short Utils: (none)
  static TextAttributes fontFamily(String? fontFamily) {
    return TextAttributes(
      style: TextStyle(fontFamily: fontFamily),
    );
  }

  /// Short Utils: fontFamilyFallback
  static TextAttributes fontFamilyFallback(List<String>? fontFamilyFallback) {
    return TextAttributes(
      style: TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  /// Short Utils: fontFeatures
  static TextAttributes fontFeatures(List<FontFeature>? fontFeatures) {
    return TextAttributes(
      style: TextStyle(fontFeatures: fontFeatures),
    );
  }

  /// Short Utils: fontSize
  static TextAttributes fontSize(double? fontSize) {
    return TextAttributes(
      style: TextStyle(fontSize: fontSize),
    );
  }

  /// Short Utils: fontStyle
  static TextAttributes fontStyle(FontStyle? fontStyle) {
    return TextAttributes(
      style: TextStyle(fontStyle: fontStyle),
    );
  }

  /// Short Utils: (fontWeight)
  static TextAttributes fontWeight(FontWeight? fontWeight) {
    return TextAttributes(
      style: TextStyle(fontWeight: fontWeight),
    );
  }

  /// Short Utils: textForeground
  static TextAttributes foreground(Paint? foreground) {
    return TextAttributes(
      style: TextStyle(foreground: foreground),
    );
  }

  /// Short Utils: textHeight
  static TextAttributes height(double? height) {
    return TextAttributes(
      style: TextStyle(height: height),
    );
  }

  /// Short Utils: inherit
  static TextAttributes inherit({inherit = true}) {
    return TextAttributes(
      style: TextStyle(inherit: inherit),
    );
  }

  /// Short Utils: letterSpacing
  static TextAttributes letterSpacing(double? letterSpacing) {
    return TextAttributes(
      style: TextStyle(letterSpacing: letterSpacing),
    );
  }

  /// Short Utils: (none - see under TextAttributes)
  static TextAttributes locale(Locale? locale) {
    return TextAttributes(
      style: TextStyle(locale: locale),
    );
  }

  /// Short Utils: textShadows
  static TextAttributes shadows(List<Shadow> shadows) {
    return TextAttributes(
      style: TextStyle(shadows: shadows),
    );
  }

  /// Short Utils: textBaseline
  static TextAttributes textBaseline(TextBaseline? textBaseline) {
    return TextAttributes(
      style: TextStyle(textBaseline: textBaseline),
    );
  }

  /// Short Utils: wordSpacing
  static TextAttributes wordSpacing(double? wordSpacing) {
    return TextAttributes(
      style: TextStyle(wordSpacing: wordSpacing),
    );
  }
}
