import 'dart:ui';

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/refs.dart';
import '../utils/helper_util.dart';
import 'attribute.dart';
import 'color_attribute.dart';
import 'shadow_attribute.dart';

@immutable
class TextStyleAttribute extends VisualAttribute<TextStyle> {
  final String? fontFamily;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final ColorAttribute? color;
  final ColorAttribute? backgroundColor;
  final List<ShadowAttribute>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorAttribute? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final Locale? locale;
  final String? debugLabel;
  final double? height;
  final Paint? foreground;
  final Paint? background;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;

  final TextStyleToken? ref;

  const TextStyleAttribute({
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

  bool isRef() => ref != null;

  @override
  TextStyleAttribute merge(TextStyleAttribute? other) {
    if (other == null) return this;

    final haveRefs = ref == null || other.ref == null;

    assert(
      haveRefs,
      'Cannot merge two different refs',
    );

    return TextStyleAttribute(
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
    // ignore: avoid-non-null-assertion
    final textStyle = ref == null ? null : mix.resolver.textStyleToken(ref!);

    return textStyle ??
        TextStyle(
          color: color?.resolve(mix),
          backgroundColor: backgroundColor?.resolve(mix),
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows?.map((e) => e.resolve(mix)).toList(),
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor?.resolve(mix),
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
        );
  }

  @override
  get props => [
        fontFamily,
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
