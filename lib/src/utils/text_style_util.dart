import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/dto/shadow_dto.dart';
import '../core/dto/text_style_dto.dart';
import '../helpers/extensions/values_ext.dart';

TextStyleDto textStyle({
  String? fontFamily,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? fontSize,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  List<Shadow>? shadows,
  Color? color,
  Color? backgroundColor,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  Paint? foreground,
  Paint? background,
  String? debugLabel,
  Locale? locale,
  double? height,
}) {
  return TextStyleDto(
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
    shadows: _shadowsFromDto(shadows),
    textBaseline: textBaseline,
    wordSpacing: wordSpacing,
  );
}

TextStyleDto bold() {
  return textStyle(fontWeight: FontWeight.bold);
}

TextStyleDto italic() {
  return textStyle(fontStyle: FontStyle.italic);
}

TextStyleDto _textStyleFromDto(TextStyle style) {
  return TextStyleDto(
    background: style.background,
    backgroundColor: style.backgroundColor?.toDto,
    color: style.color?.toDto,
    debugLabel: style.debugLabel,
    decoration: style.decoration,
    decorationColor: style.decorationColor?.toDto,
    decorationStyle: style.decorationStyle,
    fontFamily: style.fontFamily,
    fontFeatures: style.fontFeatures,
    fontSize: style.fontSize,
    fontStyle: style.fontStyle,
    fontWeight: style.fontWeight,
    foreground: style.foreground,
    height: style.height,
    letterSpacing: style.letterSpacing,
    locale: style.locale,
    shadows: style.shadows?.map(_shadowFromDto).toList(),
    textBaseline: style.textBaseline,
    wordSpacing: style.wordSpacing,
  );
}

ShadowDto _shadowFromDto(Shadow shadow) {
  return ShadowDto(
    blurRadius: shadow.blurRadius,
    color: shadow.color.toDto,
    offset: shadow.offset,
  );
}

List<ShadowDto>? _shadowsFromDto(List<Shadow>? shadows) {
  if (shadows == null) return null;
  if (shadows.isEmpty) return [];

  return shadows.map(_shadowFromDto).toList();
}
