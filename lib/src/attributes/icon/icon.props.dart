import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/refs/refs.dart';

class IconProps {
  final Color? color;
  final double size;

  const IconProps({
    this.color,
    required this.size,
  });

  factory IconProps.fromContext(
    BuildContext context,
    IconAttributes? attributes,
  ) {
    final icon = attributes;
    final theme = IconTheme.of(context);
    var color = icon?.color;

    if (color is ColorRef) {
      color = color.resolve(context);
    }

    return IconProps(
      color: color ?? theme.color,
      size: icon?.size ?? theme.size ?? 24,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconProps && other.color == color && other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
