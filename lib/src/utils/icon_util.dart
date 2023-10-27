import 'package:flutter/material.dart';

import '../attributes/value_attributes.dart';
import '../core/dto/dtos.dart';
import '../core/style_attribute.dart';

const iconSize = _iconSize;
const iconColor = _iconColor;

@Deprecated('use iconSize, iconColor')
StyleAttribute icon() {
  throw UnimplementedError();
}

IconSizeAttribute _iconSize(double size) {
  return IconSizeAttribute(DoubleDto(size));
}

IconColorAttribute _iconColor(Color color) {
  return IconColorAttribute(ColorDto(color));
}
