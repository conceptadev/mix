import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/text_style_attribute.dart';
import '../core/dto/shadow_dto.dart';
import '../helpers/extensions/helper_ext.dart';

TextStyleDto textStyle({
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

  /// If as is provided, it will be merged with the other attributes.
  /// Other properties will override the as properties.
  TextStyle? as,
}) {
  List<ShadowDto>? convertShadows() {
    List<Shadow> combinedShadows = [...?shadows];

    if (shadow != null) combinedShadows.add(shadow);

    final shadowDtos = combinedShadows.map(ShadowDto.from).toList();

    if (shadowDtos.isEmpty) return null;

    return shadowDtos;
  }

  TextStyleDto textStyle = TextStyleDto(
    background: background,
    backgroundColor: backgroundColor?.toDto,
    color: color?.toDto,
    debugLabel: debugLabel,
    decoration: decoration,
    decorationColor: decorationColor?.toDto,
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
  );

  if (as != null) {
    textStyle = TextStyleDto.from(as).merge(textStyle);
  }

  return textStyle;
}

TextStyleDto bold() {
  return textStyle(fontWeight: FontWeight.bold);
}

TextStyleDto italic() {
  return textStyle(fontStyle: FontStyle.italic);
}
