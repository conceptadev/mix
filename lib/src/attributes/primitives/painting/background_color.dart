import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class BackgroundColorUtility {
  const BackgroundColorUtility();
  BackgroundColorAttribute call(Color color) => BackgroundColorAttribute(color);
}

class BackgroundColorAttribute extends Attribute<Color>
    with AnimatedMix<Color> {
  BackgroundColorAttribute(this.color);

  final Color color;

  @override
  Color get value => color;
}
