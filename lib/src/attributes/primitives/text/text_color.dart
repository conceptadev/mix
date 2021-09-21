import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class TextColorUtility {
  const TextColorUtility();
  TextColorAttribute call(Color textColor) => TextColorAttribute(textColor);
}

class TextColorAttribute extends Attribute<Color> {
  const TextColorAttribute(this.textColor);
  final Color textColor;
  @override
  Color get value => textColor;
}
