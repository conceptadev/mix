import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class IconColorUtility {
  const IconColorUtility();
  IconColorAttribute call(Color iconColor) => IconColorAttribute(iconColor);
}

class IconColorAttribute extends Attribute<Color> {
  const IconColorAttribute(this.iconColor);
  final Color iconColor;
  @override
  Color get value => iconColor;
}
