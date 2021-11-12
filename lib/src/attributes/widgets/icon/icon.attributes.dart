import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';

class IconAttributes extends Attribute {
  final Color? color;
  final TextDirection? textDirection;
  final double? size;
  const IconAttributes({
    this.color,
    this.size,
    this.textDirection,
  });

  merge(IconAttributes other) {
    return IconAttributes(
      color: other.color ?? color,
      size: other.size ?? size,
      textDirection: other.textDirection ?? textDirection,
    );
  }
}
