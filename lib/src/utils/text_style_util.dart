import 'dart:ui';

import '../attributes/shadow_attribute.dart';
import '../attributes/text_style_attribute.dart';
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
  return TextStyleAttribute(
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

TextStyleAttribute bold() {
  return textStyle(fontWeight: FontWeight.bold);
}

TextStyleAttribute italic() {
  return textStyle(fontStyle: FontStyle.italic);
}

ShadowAttribute _shadowFromDto(Shadow shadow) {
  return ShadowAttribute(
    blurRadius: shadow.blurRadius,
    color: shadow.color.toDto,
    offset: shadow.offset,
  );
}

List<ShadowAttribute>? _shadowsFromDto(List<Shadow>? shadows) {
  if (shadows == null) return null;
  if (shadows.isEmpty) return [];

  return shadows.map(_shadowFromDto).toList();
}
