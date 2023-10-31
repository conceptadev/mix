import 'dart:ui';

import '../attributes/data_attributes.dart';
import '../core/dto/shadow_dto.dart';
import '../core/dto/text_style_dto.dart';
import '../helpers/extensions/values_ext.dart';

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
  return TextStyleData(
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
  ).toAttribute();
}

TextStyleAttribute bold() {
  return textStyle(fontWeight: FontWeight.bold);
}

TextStyleAttribute italic() {
  return textStyle(fontStyle: FontStyle.italic);
}

ShadowData _shadowFromDto(Shadow shadow) {
  return ShadowData(
    blurRadius: shadow.blurRadius,
    color: shadow.color.toDto,
    offset: shadow.offset,
  );
}

List<ShadowData>? _shadowsFromDto(List<Shadow>? shadows) {
  if (shadows == null) return null;
  if (shadows.isEmpty) return [];

  return shadows.map(_shadowFromDto).toList();
}
