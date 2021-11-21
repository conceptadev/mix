import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class IconMixer {
  final Color? color;
  final double? size;

  const IconMixer({
    this.color,
    this.size,
  });

  factory IconMixer.fromContext(MixContext mixContext) {
    final icon = mixContext.mix.iconAttribute;
    return IconMixer(
      color: icon?.color,
      size: icon?.size,
    );
  }
}
