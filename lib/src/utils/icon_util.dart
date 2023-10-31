import 'package:flutter/material.dart';

import '../attributes/visual_attributes.dart';
import '../core/attribute.dart';
import '../core/dto/color_dto.dart';

const iconSize = _iconSize;
const iconColor = _iconColor;

@Deprecated('use iconSize, iconColor')
VisualAttribute icon() {
  throw UnimplementedError();
}

IconSizeAttribute _iconSize(double size) {
  return IconSizeAttribute(size);
}

IconColorAttribute _iconColor(Color color) {
  return IconColorAttribute(ColorDto(color));
}
