import 'dart:ui';

import 'package:flutter/material.dart';

import '../../attributes/base/color.dto.dart';
import '../../attributes/base/double.dto.dart';
import '../../attributes/icon/icon_data.attribute.dart';
import '../../attributes/style_attribute.dart';
import '../../factory/mix_provider_data.dart';

class IconAttributes extends StyleAttribute<IconSpec> {
  final ColorDto? color;
  final DoubleDto? size;
  final IconDataAttribute? icon;

  const IconAttributes({this.color, this.size, this.icon});

  @override
  IconAttributes merge(IconAttributes? other) {
    if (other == null) return this;

    return IconAttributes(
      color: mergeAttr(color, other.color),
      size: mergeAttr(size, other.size),
      icon: icon ?? other.icon,
    );
  }

  @override
  IconSpec resolve(MixData mix) {
    return IconSpec(
      color: resolveDto(color, mix),
      size: resolveDto(size, mix),
      icon: resolveAttr(icon, mix),
    );
  }

  @override
  List<Object?> get props => [color, size, icon];
}

class IconSpec extends Spec<IconSpec> {
  final Color? color;
  final double? size;
  final IconData? icon;

  const IconSpec({
    required this.color,
    required this.size,
    required this.icon,
  });

  @override
  IconSpec lerp(IconSpec other, double t) {
    return IconSpec(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
      icon: snap(icon, other.icon, t),
    );
  }

  @override
  IconSpec copyWith({Color? color, double? size, IconData? icon}) {
    return IconSpec(
      color: color ?? this.color,
      size: size ?? this.size,
      icon: icon ?? this.icon,
    );
  }

  @override
  get props => [color, size, icon];
}
