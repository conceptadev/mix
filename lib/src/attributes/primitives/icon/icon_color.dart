import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class IconColorUtility {
  const IconColorUtility();
  IconColorAttribute call(Color iconColor) => IconColorAttribute(iconColor);
}

class IconColorAttribute extends Attribute<Color> with AnimatedMix<Color> {
  IconColorAttribute(this.iconColor);
  final Color iconColor;
  @override
  Color get value => iconColor;
}
