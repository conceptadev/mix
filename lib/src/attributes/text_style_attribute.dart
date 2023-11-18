import 'dart:ui';

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../theme/tokens/text_style_token.dart';
import 'attribute.dart';
import 'color_attribute.dart';
import 'scalar_attribute.dart';
import 'shadow_attribute.dart';

@immutable
class TextStyleAttribute extends VisualAttribute<TextStyle> {
  final FontFamilyAttribute? fontFamily;
  final FontWeightAttribute? fontWeight;
  final FontStyleAttribute? fontStyle;
  final FontSizeAttribute? fontSize;
  final LetterSpacingAttribute? letterSpacing;
  final WordSpacingAttribute? wordSpacing;
  final TextBaselineAttribute? textBaseline;
  final ScalarColorAttribute? color;
  final ScalarColorAttribute? backgroundColor;
  final List<ShadowAttribute>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecorationAttribute? decoration;
  final ScalarColorAttribute? decorationColor;
  final TextDecorationStyleAttribute? decorationStyle;

  final double? height;
  final PaintAttribute? foreground;
  final PaintAttribute? background;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;

  final TextStyleToken? token;

  const TextStyleAttribute({
    this.background,
    this.backgroundColor,
    this.color,
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
    this.shadows,
    this.token,
    this.textBaseline,
    this.wordSpacing,
  });

  bool isRef() => token != null;

  @override
  TextStyleAttribute merge(TextStyleAttribute? other) {
    if (other == null) return this;

    final haveRefs = token == null || other.token == null;

    assert(
      haveRefs,
      'Cannot merge two different refs',
    );

    return TextStyleAttribute(
      background: other.background ?? background,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      color: other.color ?? color,
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
      shadows: mergeMergeableList(shadows, other.shadows),
      token: other.token ?? token,
      textBaseline: other.textBaseline ?? textBaseline,
      wordSpacing: other.wordSpacing ?? wordSpacing,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    // ignore: avoid-non-null-assertion
    final textStyle = token == null ? null : mix.tokens.textStyleToken(token!);

    return textStyle ??
        TextStyle(
          color: color?.resolve(mix),
          backgroundColor: backgroundColor?.resolve(mix),
          fontSize: fontSize?.resolve(mix),
          wordSpacing: wordSpacing?.resolve(mix),
          textBaseline: textBaseline?.resolve(mix),
          fontWeight: fontWeight?.resolve(mix),
          fontStyle: fontStyle?.resolve(mix),
          letterSpacing: letterSpacing?.resolve(mix),
          shadows: shadows?.map((e) => e.resolve(mix)).toList(),
          fontFeatures: fontFeatures,
          decorationColor: decorationColor?.resolve(mix),
          decorationThickness: decorationThickness,
          fontFamilyFallback: fontFamilyFallback,
          decorationStyle: decorationStyle?.resolve(mix),
          decoration: decoration?.resolve(mix),
          fontFamily: fontFamily?.resolve(mix),
          height: height,
          foreground: foreground?.resolve(mix),
          background: background?.resolve(mix),
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
        height,
        background,
        foreground,
        decorationThickness,
        fontFamilyFallback,
        token,
      ];
}
