// ignore_for_file: long-parameter-list

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/shadow_attribute.dart';
import '../attributes/strut_style_attribute.dart';
import '../attributes/text_style_attribute.dart';
import '../directives/text_directive.dart';
import '../helpers/extensions/values_ext.dart';

StrutStyleAttribute strutStyle(StrutStyle strutStyle) {
  return strutStyle.toAttribute();
}

TextDirectiveAttribute textDirective(TextDirective directive) =>
    TextDirectiveAttribute([directive]);

TextStyleAttribute textStyle({
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
  return TextStyleAttribute(
    background: background,
    backgroundColor: backgroundColor?.toAttribute(),
    color: color?.toAttribute(),
    debugLabel: debugLabel,
    decoration: decoration,
    decorationColor: decorationColor?.toAttribute(),
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

TextStyleAttribute bold() => textStyle(fontWeight: FontWeight.bold);

TextStyleAttribute italic() => textStyle(fontStyle: FontStyle.italic);

ShadowAttribute _shadowFromDto(Shadow shadow) {
  return ShadowAttribute(
    blurRadius: shadow.blurRadius,
    color: shadow.color.toAttribute(),
    offset: shadow.offset,
  );
}

List<ShadowAttribute>? _shadowsFromDto(List<Shadow>? shadows) {
  if (shadows == null) return null;
  if (shadows.isEmpty) return [];

  return shadows.map(_shadowFromDto).toList();
}
