import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../internal/iterable_ext.dart';

final class TextStyleDataRef extends TextStyleData {
  final TextStyleRef ref;
  const TextStyleDataRef({required this.ref});

  @override
  get props => [ref];
}

base class TextStyleData extends Dto<TextStyle> {
  final String? fontFamily;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
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
  final double? height;
  final Paint? foreground;
  final Paint? background;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;

  const TextStyleData({
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
    this.textBaseline,
    this.wordSpacing,
  });

  @override
  TextStyleData merge(TextStyleData? other) {
    if (this is TextStyleDataRef && other is TextStyleDataRef) {
      throw Exception("Can't merge TextStyleRef");
    }
    return TextStyleData(
      color: color?.merge(other?.color) ?? other?.color,
      backgroundColor: backgroundColor?.merge(other?.backgroundColor) ??
          other?.backgroundColor,
      shadows: shadows?.merge(other?.shadows) ?? other?.shadows,
      fontSize: other?.fontSize ?? fontSize,
      fontWeight: other?.fontWeight ?? fontWeight,
      fontStyle: other?.fontStyle ?? fontStyle,
      letterSpacing: other?.letterSpacing ?? letterSpacing,
      wordSpacing: other?.wordSpacing ?? wordSpacing,
      textBaseline: other?.textBaseline ?? textBaseline,
      debugLabel: other?.debugLabel ?? debugLabel,
      height: other?.height ?? height,
      locale: other?.locale ?? locale,
      decoration: other?.decoration ?? decoration,
      decorationColor: other?.decorationColor ?? decorationColor,
      decorationStyle: other?.decorationStyle ?? decorationStyle,
      decorationThickness: other?.decorationThickness ?? decorationThickness,
      fontFeatures: [...?fontFeatures, ...?other?.fontFeatures],
      fontFamily: other?.fontFamily ?? fontFamily,
      fontFamilyFallback: [
        ...?fontFamilyFallback,
        ...?other?.fontFamilyFallback
      ],
      foreground: other?.foreground ?? foreground,
      background: other?.background ?? background,
    );
  }

  @override
  TextStyle resolve(MixData mix) {
    final self = this;
    return self is TextStyleDataRef
        ? mix.tokens.textStyleRef(self.ref)
        : TextStyle(
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
      ];
}

@immutable
class TextStyleDto extends Dto<TextStyle> {
  final List<TextStyleData> value;
  const TextStyleDto._(this.value);

  factory TextStyleDto({
    ColorDto? color,
    ColorDto? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    String? debugLabel,
    double? wordSpacing,
    TextBaseline? textBaseline,
    List<ShadowDto>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    Locale? locale,
    double? height,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
  }) {
    return TextStyleDto._([
      TextStyleData(
        background: background,
        backgroundColor: backgroundColor,
        color: color,
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      )
    ]);
  }

  factory TextStyleDto.ref(TextStyleToken token) {
    return TextStyleDto._([TextStyleDataRef(ref: token())]);
  }

  /// This method resolves the [TextStyleDto] to a TextStyle.
  /// It maps over the values list and checks if each TextStyleDto is a token reference.
  /// If it is, it resolves the token reference and converts it to a [TextStyleData].
  /// If it's not a token reference, it leaves the [TextStyleData] as is.
  /// Then it reduces the list of [TextStyleData] objects to a single [TextStyleData] by merging them.
  /// Finally, it resolves the resulting [TextStyleData] to a TextStyle.
  @override
  TextStyle resolve(MixData mix) {
    final result = value
        .map((e) => e is TextStyleDataRef ? e.resolve(mix)._toData() : e)
        .reduce((value, element) {
      final singleresult = value.merge(element);
      return singleresult;
    }).resolve(mix);

    return result;
  }

  @override
  TextStyleDto merge(TextStyleDto? other) {
    return other == null ? this : TextStyleDto._([...value, ...other.value]);
  }

  @override
  get props => [value];
}

extension TextStyleExt on TextStyle {
  TextStyleDto toDto() => TextStyleDto._([_toData()]);
  TextStyleData _toData() => TextStyleData(
        color: color?.toDto(),
        backgroundColor: backgroundColor?.toDto(),
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
        shadows: shadows?.map((e) => e.toDto()).toList(),
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor?.toDto(),
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
      );
}
