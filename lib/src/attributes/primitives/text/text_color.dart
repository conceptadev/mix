import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class TextColorUtility {
  const TextColorUtility();
  TextColorAttribute call(Color textColor) => TextColorAttribute(textColor);
}

class TextColorAttribute extends Attribute<Color> with AnimatedMix<Color> {
  TextColorAttribute(this.textColor);
  final Color textColor;
  @override
  Color get value => textColor;
}
