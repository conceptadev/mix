import 'dart:ui';

import 'package:flutter/material.dart';

import '../../box_shadow/shadow.attribute.dart';
import '../../color/color.dto.dart';
import '../../helpers/list.attribute.dart';
import '../attributes/text_style.attribute.dart';

TextStyleAttribute textStyle({
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
  ListAtttribute<ShadowAttribute>? convertShadows() {
    List<Shadow> combinedShadows = [...?shadows];

    if (shadow != null) combinedShadows.add(shadow);

    final shadowDtos = combinedShadows.map(ShadowAttribute.from).toList();

    if (shadowDtos.isEmpty) return null;

    return ListAtttribute(shadowDtos);
  }

  TextStyleAttribute textStyle = TextStyleAttribute(
    background: background,
    backgroundColor: backgroundColor == null ? null : ColorDto(backgroundColor),
    color: color == null ? null : ColorDto(color),
    debugLabel: debugLabel,
    decoration: decoration,
    decorationColor: decorationColor == null ? null : ColorDto(decorationColor),
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
    textStyle = TextStyleAttribute.from(as).merge(textStyle);
  }

  return textStyle;
}

TextStyleAttribute bold() {
  return textStyle(fontWeight: FontWeight.bold);
}

TextStyleAttribute italic() {
  return textStyle(fontStyle: FontStyle.italic);
}
