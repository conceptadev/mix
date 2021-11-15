import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class IconAttributes extends Attribute {
  final Color? color;
  final double? size;
  const IconAttributes({
    this.color,
    this.size,
  });

  IconAttributes merge(IconAttributes? other) {
    if (other == null) return this;

    return IconAttributes(
      color: other.color ?? color,
      size: other.size ?? size,
    );
  }
}
