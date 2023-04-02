import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/shadow/shadow.dto.dart';
import '../../dtos/text_style.dto.dart';
import 'text_directives/text_directives.dart';

class TextUtility {
  const TextUtility._();

  // ignore: long-parameter-list
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
      return TextAttributes(style: TextStyleDto.from(as));
    }

    List<ShadowDto>? convertShadows() {
      List<Shadow> combinedShadows = [...?shadows, if (shadow != null) shadow];

      final shadowDtos = combinedShadows.map((e) => ShadowDto.from(e)).toList();

      if (shadowDtos.isEmpty) return null;

      return shadowDtos;
    }

    return TextAttributes(
      style: TextStyleDto(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        color: ColorDto.maybeFrom(color),
        backgroundColor: ColorDto.maybeFrom(backgroundColor),
        shadows: convertShadows(),
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: ColorDto.maybeFrom(decorationColor),
        decorationStyle: decorationStyle,
        debugLabel: debugLabel,
        locale: locale,
        height: height,
        foreground: foreground,
        background: background,
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
