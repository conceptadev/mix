import 'package:flutter/material.dart';
import 'package:mix/src/attributes/icon/icon.attributes.dart';

class IconUtils {
  const IconUtils._();

  static IconAttributes icon({double? size, Color? color}) {
    return IconAttributes(
      size: size,
      color: color,
    );
  }

  static IconAttributes iconSize(double size) {
    return IconAttributes(
      size: size,
    );
  }

  static IconAttributes iconColor(Color color) {
    return IconAttributes(
      color: color,
    );
  }
}
