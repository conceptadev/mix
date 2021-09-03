import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class BackgroundColorUtility {
  const BackgroundColorUtility();
  BackgroundColorAttribute call(Color color) => BackgroundColorAttribute(color);
}

class BackgroundColorAttribute extends Attribute<Color> {
  const BackgroundColorAttribute(this.color);
  final Color color;
  @override
  Color get value => color;
}
