import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/icon_attribute.dart';
import '../attributes/text_direction_attribute.dart';
import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class IconSpec extends MixExtension<IconSpec> {
  final Color? color;
  final double? size;
  final IconData? icon;
  final TextDirection? textDirection;

  const IconSpec({
    required this.color,
    required this.size,
    required this.icon,
    required this.textDirection,
  });

  static IconSpec resolve(MixData mix) {
    return IconSpec(
      color: mix.get<IconColorAttribute, Color>(),
      size: mix.get<IconSizeAttribute, double>(),
      icon: mix.get<IconDataAttribute, IconData>(),
      textDirection: mix.get<TextDirectionAttribute, TextDirection>(),
    );
  }

  @override
  IconSpec lerp(IconSpec other, double t) {
    return IconSpec(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
      icon: snap(icon, other.icon, t),
      textDirection: snap(textDirection, other.textDirection, t),
    );
  }

  @override
  IconSpec copyWith({
    Color? color,
    double? size,
    IconData? icon,
    TextDirection? textDirection,
  }) {
    return IconSpec(
      color: color ?? this.color,
      size: size ?? this.size,
      icon: icon ?? this.icon,
      textDirection: textDirection ?? this.textDirection,
    );
  }

  @override
  get props => [color, size, icon, textDirection];
}
