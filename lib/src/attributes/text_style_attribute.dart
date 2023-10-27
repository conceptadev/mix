import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/dto/dtos.dart';
import '../core/dto/shadow_dto.dart';
import '../factory/exports.dart';
import '../theme/tokens/text_style_ref.dart';
import '../utils/helper_util.dart';

class TextStyleDto extends Dto<TextStyle> {
  final String? fontFamily;
  final FontWeight? fontWeight;

  final FontStyle? fontStyle;
  final DoubleDto? fontSize;
  final DoubleDto? letterSpacing;
  final DoubleDto? wordSpacing;
  final TextBaseline? textBaseline;
  final ColorDto? color;
  final ColorDto? backgroundColor;
  final List<ShadowDto>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorDto? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final Locale? locale;
  final String? debugLabel;
  final DoubleDto? height;
  final Paint? foreground;
  final Paint? background;
  final DoubleDto? decorationThickness;
  final List<String>? fontFamilyFallback;

  final TextStyleRef? ref;

  const TextStyleDto({
    this.background,
    this.backgroundColor,
    this.color,
    this.debugLabel,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontFeatures,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.foreground,
    this.height,
    this.letterSpacing,
    this.locale,
    this.shadows,
    this.ref,
    this.textBaseline,
    this.wordSpacing,
  });

  @override
  TextStyleDto merge(TextStyleDto? other) {
    if (other == null) return this;

    return TextStyleDto(
      background: other.background ?? background,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      color: other.color ?? color,
      debugLabel: other.debugLabel ?? debugLabel,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      decorationThickness: other.decorationThickness ?? decorationThickness,
      fontFamily: other.fontFamily ?? fontFamily,
      fontFamilyFallback: [
        ...?fontFamilyFallback,
        ...?other.fontFamilyFallback,
      ],
      fontFeatures: other.fontFeatures ?? fontFeatures,
      fontSize: other.fontSize ?? fontSize,
      fontStyle: other.fontStyle ?? fontStyle,
      fontWeight: other.fontWeight ?? fontWeight,
      foreground: other.foreground ?? foreground,
      height: other.height ?? height,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      locale: other.locale ?? locale,
      shadows: mergeMergeableList(shadows, other.shadows),
      ref: other.ref ?? ref,
      textBaseline: other.textBaseline ?? textBaseline,
      wordSpacing: other.wordSpacing ?? wordSpacing,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    TextStyleDto? styleRef;

    // Load as DTO for consistent merging behavior.
    final textStyle = ref?.resolve(mix);
    if (textStyle != null) {
      return textStyle;
    }

    return TextStyle(
      color: styleRef.color?.resolve(mix),
      backgroundColor: styleRef.backgroundColor?.resolve(mix),
      fontSize: styleRef.fontSize,
      fontWeight: styleRef.fontWeight,
      fontStyle: styleRef.fontStyle,
      letterSpacing: styleRef.letterSpacing,
      wordSpacing: styleRef.wordSpacing,
      textBaseline: styleRef.textBaseline,
      height: styleRef.height,
      locale: styleRef.locale,
      foreground: styleRef.foreground,
      background: styleRef.background,
      shadows: styleRef.shadows?.map((e) => e.resolve(mix)).toList(),
      fontFeatures: styleRef.fontFeatures,
      decoration: styleRef.decoration,
      decorationColor: styleRef.decorationColor?.resolve(mix),
      decorationStyle: styleRef.decorationStyle,
      decorationThickness: styleRef.decorationThickness,
      debugLabel: styleRef.debugLabel,
      fontFamily: styleRef.fontFamily,
      fontFamilyFallback: styleRef.fontFamilyFallback,
    );
  }

  @override
  get props => [
        fontFamily,
        inherit,
        fontWeight,
        fontStyle,
        fontSize,
        letterSpacing,
        wordSpacing,
        textBaseline,
        color,
        backgroundColor,
        shadows,
        fontFeatures,
        decoration,
        decorationColor,
        decorationStyle,
        debugLabel,
        locale,
        height,
        background,
        foreground,
        decorationThickness,
        fontFamilyFallback,
        ref,
      ];
}
