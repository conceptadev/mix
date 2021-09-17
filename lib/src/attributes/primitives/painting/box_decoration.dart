import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class BoxDecorationAttribute extends Attribute<Decoration> with AnimatedMix<Decoration> {
  BoxDecorationAttribute(this.decoration);

  final BoxDecoration decoration;
  @override
  Decoration get value {
    return decoration;
  }

  BoxDecoration copyWith(BoxDecoration other) {
    return decoration.copyWith(
      color: other.color,
      border: other.border,
      borderRadius: other.borderRadius,
      boxShadow: other.boxShadow,
      image: other.image,
      backgroundBlendMode: other.backgroundBlendMode,
      shape: other.shape,
      gradient: other.gradient,
    );
  }
}
