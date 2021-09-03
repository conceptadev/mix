import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class TextStyleUtility {
  const TextStyleUtility();
  TextStyleAttribute call(TextStyle textStyle) => TextStyleAttribute(textStyle);
}

class TextStyleAttribute extends TextMixAttribute<TextStyle> {
  const TextStyleAttribute(this.textStyle);
  final TextStyle textStyle;

  @override
  TextStyle get value => textStyle;
}
