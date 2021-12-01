import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/color.utils.dart';

class IconMixer {
  final Color? color;
  final double size;

  const IconMixer({
    this.color,
    required this.size,
  });

  factory IconMixer.fromContext(MixContext mixContext) {
    final icon = mixContext.iconAttribute;
    final theme = IconTheme.of(mixContext.context);
    return IconMixer(
      color: icon?.color?.create(mixContext.context) ?? theme.color,
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
