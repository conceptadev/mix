import 'dart:ui';

import 'package:flutter/material.dart';

import '../../helpers/dto/double.dto.dart';
import '../../helpers/dto/text_style.dto.dart';
import 'text.attributes.dart';

class TextFriendlyUtility {
  const TextFriendlyUtility._();

  // ignore: long-parameter-list
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

    return TextUtility.style(
      TextStyle(
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

  /// Short Utils: style
  static TextAttributes style(TextStyle? style) {
    if (style == null) return const TextAttributes();

    return TextAttributes(style: TextStyleDto.from(style));
  }

  /// Short Utils: strutStyle
  static TextAttributes strutStyle(StrutStyle strutStyle) {
    return TextAttributes(strutStyle: strutStyle);
  }

  /// Short Utils: textAlign
  static TextAttributes textAlign(TextAlign textAlign) {
    return TextAttributes(textAlign: textAlign);
  }

  /// Short Utils: locale
  static TextAttributes locale(Locale locale) {
    return TextAttributes(locale: locale);
  }

  /// Short Utils: softWrap
  static TextAttributes softWrap(bool softWrap) {
    return TextAttributes(softWrap: softWrap);
  }

  /// Short Utils: overflow
  static TextAttributes overflow(TextOverflow overflow) {
    return TextAttributes(overflow: overflow);
  }

  /// Short Utils: textScaleFactor
  static TextAttributes textScaleFactor(double textScaleFactor) {
    return TextAttributes(
      textScaleFactor: DoubleDto.from(textScaleFactor),
    );
  }

  /// Short Utils: maxLines
  static TextAttributes maxLines(int maxLines) {
    return TextAttributes(maxLines: maxLines);
  }

  /// Short Utils: textWidthBasis
  static TextAttributes textWidthBasis(TextWidthBasis textWidthBasis) {
    return TextAttributes(textWidthBasis: textWidthBasis);
  }
}

class TextStyleUtility {
  const TextStyleUtility._();

  /// Short Utils: textBackground
  static TextAttributes background(Paint? background) {
    return TextUtility.style(
      TextStyle(background: background),
    );
  }

  /// Short Utils: textBgColor
  static TextAttributes backgroundColor(Color? backgroundColor) {
    return TextUtility.style(
      TextStyle(backgroundColor: backgroundColor),
    );
  }

  /// Short Utils: textColor
  static TextAttributes color(Color? color) {
    return TextUtility.style(
      TextStyle(color: color),
    );
  }

  /// Short Utils: debugLabel
  static TextAttributes debugLabel(String? debugLabel) {
    return TextUtility.style(
      TextStyle(debugLabel: debugLabel),
    );
  }

  /// Short Utils: textDecoration
  static TextAttributes decoration(TextDecoration? decoration) {
    return TextUtility.style(
      TextStyle(decoration: decoration),
    );
  }

  /// Short Utils: textDecorationColor
  static TextAttributes decorationColor(Color? decorationColor) {
    return TextUtility.style(
      TextStyle(decorationColor: decorationColor),
    );
  }

  /// Short Utils: textDecorationStyle
  static TextAttributes decorationStyle(TextDecorationStyle? decorationStyle) {
    return TextUtility.style(
      TextStyle(decorationStyle: decorationStyle),
    );
  }

  /// Short Utils: textDecorationThickness
  static TextAttributes decorationThickness(double? decorationThickness) {
    return TextUtility.style(
      TextStyle(decorationThickness: decorationThickness),
    );
  }

  /// Short Utils: (none)
  static TextAttributes fontFamily(String? fontFamily) {
    return TextUtility.style(
      TextStyle(fontFamily: fontFamily),
    );
  }

  /// Short Utils: fontFamilyFallback
  static TextAttributes fontFamilyFallback(List<String>? fontFamilyFallback) {
    return TextUtility.style(
      TextStyle(fontFamilyFallback: fontFamilyFallback),
    );
  }

  /// Short Utils: fontFeatures
  static TextAttributes fontFeatures(List<FontFeature>? fontFeatures) {
    return TextUtility.style(
      TextStyle(fontFeatures: fontFeatures),
    );
  }

  /// Short Utils: fontSize
  static TextAttributes fontSize(double? fontSize) {
    return TextUtility.style(
      TextStyle(fontSize: fontSize),
    );
  }

  /// Short Utils: fontStyle
  static TextAttributes fontStyle(FontStyle? fontStyle) {
    return TextUtility.style(
      TextStyle(fontStyle: fontStyle),
    );
  }

  /// Short Utils: (fontWeight)
  static TextAttributes fontWeight(FontWeight? fontWeight) {
    return TextUtility.style(
      TextStyle(fontWeight: fontWeight),
    );
  }

  /// Short Utils: textForeground
  static TextAttributes foreground(Paint? foreground) {
    return TextUtility.style(
      TextStyle(foreground: foreground),
    );
  }

  /// Short Utils: textHeight
  static TextAttributes height(double? height) {
    return TextUtility.style(
      TextStyle(height: height),
    );
  }

  /// Short Utils: inherit
  static TextAttributes inherit({inherit = true}) {
    return TextUtility.style(
      TextStyle(inherit: inherit),
    );
  }

  /// Short Utils: letterSpacing
  static TextAttributes letterSpacing(double? letterSpacing) {
    return TextUtility.style(
      TextStyle(letterSpacing: letterSpacing),
    );
  }

  /// Short Utils: (none - see under TextAttributes)
  static TextAttributes locale(Locale? locale) {
    return TextUtility.style(
      TextStyle(locale: locale),
    );
  }

  /// Short Utils: textShadows
  static TextAttributes shadows(List<Shadow> shadows) {
    return TextUtility.style(
      TextStyle(shadows: shadows),
    );
  }

  /// Short Utils: textBaseline
  static TextAttributes textBaseline(TextBaseline? textBaseline) {
    return TextUtility.style(
      TextStyle(textBaseline: textBaseline),
    );
  }

  /// Short Utils: wordSpacing
  static TextAttributes wordSpacing(double? wordSpacing) {
    return TextUtility.style(
      TextStyle(wordSpacing: wordSpacing),
    );
  }
}
