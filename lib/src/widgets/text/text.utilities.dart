// ignore_for_file: long-parameter-list

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/shadow/shadow.dto.dart';
import '../../dtos/text_style.dto.dart';
import 'text_directives/text_directives.dart';

class TextUtility {
  const TextUtility._();

  static StyledTextAttributes textStyle({
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

      return StyledTextAttributes(style: TextStyleDto.from(as));
    }

    List<ShadowDto>? convertShadows() {
      List<Shadow> combinedShadows = [...?shadows, if (shadow != null) shadow];

      final shadowDtos = combinedShadows.map((e) => ShadowDto.from(e)).toList();

      if (shadowDtos.isEmpty) return null;

      return shadowDtos;
    }

    return StyledTextAttributes(
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

  static StyledTextAttributes strutStyle(StrutStyle strutStyle) {
    return StyledTextAttributes(strutStyle: strutStyle);
  }

  static StyledTextAttributes textAlign(TextAlign textAlign) {
    return StyledTextAttributes(textAlign: textAlign);
  }

  static StyledTextAttributes locale(Locale locale) {
    return StyledTextAttributes(locale: locale);
  }

  static StyledTextAttributes softWrap(bool softWrap) {
    return StyledTextAttributes(softWrap: softWrap);
  }

  static StyledTextAttributes overflow(TextOverflow overflow) {
    return StyledTextAttributes(overflow: overflow);
  }

  static StyledTextAttributes textScaleFactor(double textScaleFactor) {
    return StyledTextAttributes(textScaleFactor: textScaleFactor);
  }

  static StyledTextAttributes maxLines(int maxLines) {
    return StyledTextAttributes(maxLines: maxLines);
  }

  static StyledTextAttributes textWidthBasis(TextWidthBasis textWidthBasis) {
    return StyledTextAttributes(textWidthBasis: textWidthBasis);
  }

  static StyledTextAttributes directives(List<TextDirective> directives) {
    return StyledTextAttributes(directives: directives);
  }

  static StyledTextAttributes directive(TextDirective directive) {
    return StyledTextAttributes(directives: [directive]);
  }
}

class TextFriendlyUtility {
  const TextFriendlyUtility._();

  static StyledTextAttributes bold() {
    return TextUtility.textStyle(fontWeight: FontWeight.bold);
  }

  static StyledTextAttributes italic() {
    return TextUtility.textStyle(fontStyle: FontStyle.italic);
  }
}
