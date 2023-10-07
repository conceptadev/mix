import 'package:flutter/material.dart';

import '../../../factory/exports.dart';
import '../../resolvable_attribute.dart';
import '../dtos/text_style.dto.dart';

class TextStyleAttribute extends ResolvableAttribute<TextStyle> {
  final List<TextStyleDto> _styles;

  const TextStyleAttribute._(List<TextStyleDto> styles) : _styles = styles;

  factory TextStyleAttribute.fromTextStyle(TextStyle style) {
    final styleDto = TextStyleDto.from(style);

    return TextStyleAttribute.from(styleDto);
  }

  TextStyleAttribute.from(TextStyleDto style) : _styles = [style];

  @override
  TextStyleAttribute merge(TextStyleAttribute? other) {
    if (other == null) return this;

    return TextStyleAttribute._([..._styles, ...other._styles]);
  }

  @override
  TextStyle resolve(MixData mix) {
    final resolvedStyles = _styles.map((e) => e.resolve(mix)).toList();

    return resolvedStyles.length == 1
        ? resolvedStyles.first
        : resolvedStyles.reduce((value, element) => value.merge(element));
  }

  @override
  get props => [_styles];
}
