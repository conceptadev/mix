// ignore_for_file: long-parameter-list

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../attributes/text_style/text_style_attribute.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/shadow/shadow.dto.dart';
import '../../widgets/exports.dart';
import 'text_directives/text_directives.dart';

class TextUtility {
  const TextUtility._();

  static TextAttributes textStyle({
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? fontSize,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    Color? color,
    Color? backgroundColor,
    Shadow? shadow,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    Paint? foreground,
    Paint? background,
    String? debugLabel,
    Locale? locale,
    double? height,
    // If asStyle is provided, all other parameters will be ignored.
    TextStyle? as,
  }) {
    if (as != null) {
      assert(
        fontFamily == null &&
            fontWeight == null &&
            fontStyle == null &&
            fontSize == null &&
            letterSpacing == null &&
            wordSpacing == null &&
            textBaseline == null &&
            color == null &&
            backgroundColor == null &&
            shadow == null &&
            shadows == null &&
            fontFeatures == null &&
            decoration == null &&
            decorationColor == null &&
            decorationStyle == null &&
            foreground == null &&
            background == null &&
            debugLabel == null &&
            locale == null &&
            height == null,
        'If asStyle is provided, all other parameters will be ignored.',
      );

      return TextAttributes(style: TextStyleAttribute.from(as));
    }

    List<ShadowRef>? convertShadows() {
      List<Shadow> combinedShadows = [...?shadows, if (shadow != null) shadow];

      final shadowDtos = combinedShadows.map((e) => ShadowRef.from(e)).toList();

      if (shadowDtos.isEmpty) return null;

      return shadowDtos;
    }

    return TextAttributes(
      style: TextStyleAttribute(
        background: background,
        backgroundColor: ColorDto.maybeFrom(backgroundColor),
        color: ColorDto.maybeFrom(color),
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: ColorDto.maybeFrom(decorationColor),
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
        shadows: convertShadows(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      ),
    );
  }

  static TextAttributes strutStyle(StrutStyle strutStyle) {
    return TextAttributes(strutStyle: strutStyle);
  }

  static TextAttributes textAlign(TextAlign textAlign) {
    return TextAttributes(textAlign: textAlign);
  }

  static TextAttributes locale(Locale locale) {
    return TextAttributes(locale: locale);
  }

  static TextAttributes softWrap(bool softWrap) {
    return TextAttributes(softWrap: softWrap);
  }

  static TextAttributes overflow(TextOverflow overflow) {
    return TextAttributes(overflow: overflow);
  }

  static TextAttributes textScaleFactor(double textScaleFactor) {
    return TextAttributes(textScaleFactor: textScaleFactor);
  }

  static TextAttributes maxLines(int maxLines) {
    return TextAttributes(maxLines: maxLines);
  }

  static TextAttributes textWidthBasis(TextWidthBasis textWidthBasis) {
    return TextAttributes(textWidthBasis: textWidthBasis);
  }

  static TextAttributes directives(List<TextDirective> directives) {
    return TextAttributes(directives: directives);
  }

  static TextAttributes directive(TextDirective directive) {
    return TextAttributes(directives: [directive]);
  }
}

class TextFriendlyUtility {
  const TextFriendlyUtility._();

  static TextAttributes bold() {
    return TextUtility.textStyle(fontWeight: FontWeight.bold);
  }

  static TextAttributes italic() {
    return TextUtility.textStyle(fontStyle: FontStyle.italic);
  }
}
