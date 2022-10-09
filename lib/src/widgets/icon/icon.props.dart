import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class IconProps {
  final Color? color;
  final double size;

  const IconProps({
    this.color,
    required this.size,
  });

  factory IconProps.fromContext(MixContext mixContext) {
    final iconAttributes = mixContext.fromType<IconAttributes>();

    final context = mixContext.context;

    IconProps props;

    if (iconAttributes == null) {
      props = const IconProps(
        size: 24,
      );
    } else {
      final theme = IconTheme.of(context);
      var color = iconAttributes.color;

      if (color is ColorToken) {
        color = color.resolve(context);
      }

      props = IconProps(
        color: color ?? theme.color,
        size: iconAttributes.size ?? theme.size ?? 24,
      );
    }

    return props;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconProps && other.color == color && other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
