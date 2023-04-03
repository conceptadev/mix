import 'package:flutter/material.dart';

import '../../dtos/color.dto.dart';
import 'icon.attributes.dart';

class IconUtility {
  const IconUtility._();

  static IconAttributes icon({double? size, Color? color}) {
    return IconAttributes(
      size: size,
      color: color != null ? ColorDto(color) : null,
    );
  }

  static IconAttributes iconSize(double size) {
    return IconAttributes(
      size: size,
    );
  }

  static IconAttributes iconColor(Color color) {
    return IconAttributes(
      color: ColorDto(color),
    );
  }
}
