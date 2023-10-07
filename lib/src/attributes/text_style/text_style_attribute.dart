import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../../theme/exports.dart';
import '../box_shadow/shadow.dto.dart';
import '../color/color_dto.dart';
import '../resolvable_attribute.dart';
import 'text_style_dto.dart';

class TextStyleAttribute extends ResolvableAttribute<TextStyle> {
  final List<TextStyleDto> styles;

  const TextStyleAttribute(this.styles);

  factory TextStyleAttribute.from(TextStyle style) {
    final color = style.color;
    final backgroundColor = style.backgroundColor;
    final decorationColor = style.decorationColor;

    if (style is TextStyleToken) {
      return TextStyleAttribute([TextStyleDto(styleToken: style)]);
    }

    final styleDto = TextStyleDto(
      background: style.background,
      backgroundColor:
          backgroundColor == null ? null : ColorDto.from(backgroundColor),
      color: color == null ? null : ColorDto.from(color),
      debugLabel: style.debugLabel,
      decoration: style.decoration,
      decorationColor:
          decorationColor == null ? null : ColorDto.from(decorationColor),
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      fontFamily: style.fontFamily,
      fontFamilyFallback: style.fontFamilyFallback,
      fontFeatures: style.fontFeatures,
      fontSize: style.fontSize,
      fontStyle: style.fontStyle,
      fontWeight: style.fontWeight,
      foreground: style.foreground,
      height: style.height,
      inherit: style.inherit,
      letterSpacing: style.letterSpacing,
      locale: style.locale,
      shadows: style.shadows?.map(ShadowDto.from).toList(),
      textBaseline: style.textBaseline,
      wordSpacing: style.wordSpacing,
    );

    return TextStyleAttribute([styleDto]);
  }

  @override
  TextStyleAttribute merge(TextStyleAttribute? other) {
    if (other == null) return this;

    return TextStyleAttribute([...styles, ...other.styles]);
  }

  @override
  TextStyle resolve(MixData mix) {
    final resolvedStyles = styles.map((e) => e.resolve(mix)).toList();

    return resolvedStyles.length == 1
        ? resolvedStyles.first
        : resolvedStyles.reduce((value, element) => value.merge(element));
  }

  @override
  get props => [styles];
}
