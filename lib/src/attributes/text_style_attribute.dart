import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/dto/text_style_dto.dart';
import '../factory/exports.dart';

class TextStyleAttribute extends StyleAttribute<TextStyle> {
  final List<TextStyleDto> value;

  const TextStyleAttribute(this.value);

  @override
  TextStyleAttribute merge(TextStyleAttribute? other) {
    return TextStyleAttribute([...value, ...other?.value ?? []]);
  }

  @override
  TextStyle resolve(MixData mix) {
    return value.fold(const TextStyle(), (previousStyle, style) {
      return previousStyle.merge(style.resolve(mix));
    });
  }

  @override
  get props => [value];
}
