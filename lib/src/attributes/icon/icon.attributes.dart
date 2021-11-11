import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/icon/icon.props.dart';

class IconAttributes extends AttributeWithBuilder<IconProps> {
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

  @override
  build() {
    return IconProps(
      color: color,
      size: size ?? 24.0,
      textDirection: textDirection,
    );
  }
}
