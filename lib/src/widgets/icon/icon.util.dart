import 'package:flutter/material.dart';

import '../../attributes/base/color.attribute.dart';
import 'icon.attribute.dart';

IconAttributes icon({Color? color, double? size}) {
  return IconAttributes(
    color: color == null ? null : ColorAttribute(color),
    size: size,
  );
}

@Deprecated('Use icon() instead')
IconAttributes iconSize(double size) {
  return IconAttributes(size: size);
}

@Deprecated('Use icon() instead')
IconAttributes iconColor(Color color) {
  return IconAttributes(color: ColorAttribute(color));
}
