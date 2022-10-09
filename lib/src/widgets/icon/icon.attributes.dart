import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';

/// ## Widget
/// - [IconMix](IconMix-class.html)
///
/// {@category Attributes}
class IconAttributes extends InheritedAttribute {
  final Color? color;
  final double? size;
  const IconAttributes({
    this.color,
    this.size,
  });

  @override
  IconAttributes merge(IconAttributes? other) {
    if (other == null) return this;

    return IconAttributes(
      color: other.color ?? color,
      size: other.size ?? size,
    );
  }
}
