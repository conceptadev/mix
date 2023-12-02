// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import 'text_style_dto.dart';

@immutable
class TextStyleAttribute
    extends DtoAttribute<TextStyleAttribute, TextStyleDto, TextStyle> {
  const TextStyleAttribute(TextStyleDto value) : super(value);

  @override
  TextStyleAttribute merge(TextStyleAttribute? other) {
    return TextStyleAttribute(value.merge(other?.value));
  }
}
