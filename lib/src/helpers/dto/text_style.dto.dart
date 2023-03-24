import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'color.dto.dart';
import 'double.dto.dart';
import 'dto.dart';

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
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorDto? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final String? debugLabel;

  const TextStyleDto({
    this.fontFamily,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.color,
    this.backgroundColor,
    this.shadows,
    this.fontFeatures,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.debugLabel,
  });

  factory TextStyleDto.from(TextStyle style) {
    final fontSize = style.fontSize;
    final letterSpacing = style.letterSpacing;
    final wordSpacing = style.wordSpacing;
    final color = style.color;
    final backgroundColor = style.backgroundColor;
    final decorationColor = style.decorationColor;

    return TextStyleDto(
      fontFamily: style.fontFamily,
      fontWeight: style.fontWeight,
      fontStyle: style.fontStyle,
      fontSize: fontSize != null ? DoubleDto(fontSize) : null,
      letterSpacing: letterSpacing != null ? DoubleDto(letterSpacing) : null,
      wordSpacing: wordSpacing != null ? DoubleDto(wordSpacing) : null,
      textBaseline: style.textBaseline,
      color: color != null ? ColorDto(color) : null,
      backgroundColor:
          backgroundColor != null ? ColorDto(backgroundColor) : null,
      decorationColor:
          decorationColor != null ? ColorDto(decorationColor) : null,
      shadows: style.shadows,
      fontFeatures: style.fontFeatures,
      decoration: style.decoration,
      decorationStyle: style.decorationStyle,
      debugLabel: style.debugLabel,
    );
  }

  @override
  TextStyle resolve(BuildContext context) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize?.resolve(context),
      letterSpacing: letterSpacing?.resolve(context),
      wordSpacing: wordSpacing?.resolve(context),
      textBaseline: textBaseline,
      color: color?.resolve(context),
      backgroundColor: backgroundColor?.resolve(context),
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor?.resolve(context),
      decorationStyle: decorationStyle,
      debugLabel: debugLabel,
    );
  }

  TextStyleDto merge(TextStyleDto other) {
    return TextStyleDto(
      fontFamily: other.fontFamily ?? fontFamily,
      fontWeight: other.fontWeight ?? fontWeight,
      fontStyle: other.fontStyle ?? fontStyle,
      fontSize: other.fontSize ?? fontSize,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      wordSpacing: other.wordSpacing ?? wordSpacing,
      textBaseline: other.textBaseline ?? textBaseline,
      color: other.color ?? color,
      backgroundColor: other.backgroundColor ?? backgroundColor,
      shadows: other.shadows ?? shadows,
      fontFeatures: other.fontFeatures ?? fontFeatures,
      decoration: other.decoration ?? decoration,
      decorationColor: other.decorationColor ?? decorationColor,
      decorationStyle: other.decorationStyle ?? decorationStyle,
      debugLabel: other.debugLabel ?? debugLabel,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleDto &&
        other.fontFamily == fontFamily &&
        other.fontWeight == fontWeight &&
        other.fontStyle == fontStyle &&
        other.fontSize == fontSize &&
        other.letterSpacing == letterSpacing &&
        other.wordSpacing == wordSpacing &&
        other.textBaseline == textBaseline &&
        other.color == color &&
        other.backgroundColor == backgroundColor &&
        listEquals(other.shadows, shadows) &&
        listEquals(other.fontFeatures, fontFeatures) &&
        other.decoration == decoration &&
        other.decorationColor == decorationColor &&
        other.decorationStyle == decorationStyle &&
        other.debugLabel == debugLabel;
  }

  @override
  int get hashCode =>
      fontFamily.hashCode ^
      fontWeight.hashCode ^
      fontStyle.hashCode ^
      fontSize.hashCode ^
      letterSpacing.hashCode ^
      wordSpacing.hashCode ^
      textBaseline.hashCode ^
      color.hashCode ^
      backgroundColor.hashCode ^
      shadows.hashCode ^
      fontFeatures.hashCode ^
      decoration.hashCode ^
      decorationColor.hashCode ^
      decorationStyle.hashCode ^
      debugLabel.hashCode;

  @override
  String toString() {
    return 'TextStyleDto(fontFamily: $fontFamily, fontWeight: $fontWeight, fontStyle: $fontStyle, fontSize: $fontSize, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, textBaseline: $textBaseline, color: $color, backgroundColor: $backgroundColor, shadows: $shadows, fontFeatures: $fontFeatures, decoration: $decoration, decorationColor: $decorationColor, decorationStyle: $decorationStyle, debugLabel: $debugLabel)';
  }

  TextStyleDto copyWith({
    String? fontFamily,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    DoubleDto? fontSize,
    DoubleDto? letterSpacing,
    DoubleDto? wordSpacing,
    TextBaseline? textBaseline,
    ColorDto? color,
    ColorDto? backgroundColor,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    String? debugLabel,
  }) {
    return TextStyleDto(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      color: color,
      backgroundColor: backgroundColor,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      debugLabel: debugLabel,
    );
  }
}

// This class allows to create a list TextStyleDtos
// that will only be merged and resolved when the resolve method is called.
class TextStyleMergeableDto extends MergeableDto<TextStyle, TextStyleDto> {
  const TextStyleMergeableDto(List<TextStyleDto> textStyles)
      : super(textStyles);

  factory TextStyleMergeableDto.from(TextStyle style) {
    return TextStyleMergeableDto([TextStyleDto.from(style)]);
  }

  static maybeFrom(TextStyle? style) {
    if (style == null) return null;

    return TextStyleMergeableDto.from(style);
  }

  @override
  TextStyle resolve(BuildContext context) {
    var mergedStyle = const TextStyle();

    for (var style in values) {
      mergedStyle = mergedStyle.merge(style.resolve(context));
    }

    return mergedStyle;
  }

  TextStyleMergeableDto copyWith({
    List<TextStyleDto>? dtos,
  }) {
    return TextStyleMergeableDto(
      [...values, ...?dtos],
    );
  }

  TextStyleMergeableDto merge(TextStyleMergeableDto? other) {
    if (other == null) return this;

    return copyWith(
      dtos: other.values,
    );
  }
}
