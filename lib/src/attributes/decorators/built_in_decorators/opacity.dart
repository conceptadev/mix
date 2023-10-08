import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../decorator.dart';

OpacityDecorator opacity(double opacity) {
  return OpacityDecorator(opacity: opacity);
}

class OpacityDecorator extends Decorator {
  final double opacity;
  const OpacityDecorator({super.key, required this.opacity});

  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  get props => [opacity];
  @override
  Widget build(Widget child, MixData mix) {
    final animation =
        mix.resolveAttributeOfType<AnimationAttribute, AnimationDto>();

    return mix.animated
        ? AnimatedOpacity(
            key: mergeKey,
            opacity: opacity,
            curve: animation.curve,
            duration: animation.duration,
            child: child,
          )
        : Opacity(key: mergeKey, opacity: opacity, child: child);
  }
}
