import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/theme/refs/refs.dart';

class IconMixer {
  final Color? color;
  final double size;

  const IconMixer({
    this.color,
    required this.size,
  });

  factory IconMixer.fromContext(
    BuildContext context,
    IconAttributes? attributes,
  ) {
    final icon = attributes;
    final theme = IconTheme.of(context);
    var color = icon?.color;

    if (color is ColorRef) {
      color = color.create(context);
    }

    return IconMixer(
      color: color ?? theme.color,
      size: icon?.size ?? theme.size ?? 24,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconMixer && other.color == color && other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
