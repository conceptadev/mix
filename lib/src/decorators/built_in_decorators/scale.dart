import 'package:flutter/material.dart';

import '../../attributes/exports.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class ScaleDecorator extends Decorator {
  final double scale;
  const ScaleDecorator(this.scale, {super.key});

  @override
  ScaleDecorator merge(ScaleDecorator other) {
    return ScaleDecorator(other.scale);
  }

  @override
  get props => [scale];
  @override
  Widget build(Widget child, MixData mix) {
    final animation = mix.mustGet<AnimationAttribute, AnimationDto>(
      const AnimationDto.defaults(),
    );

    return mix.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1, end: scale),
            duration: animation.duration,
            curve: animation.curve,
            builder: (context, value, childWidget) {
              return Transform.scale(
                key: mergeKey,
                scale: value,
                child: childWidget,
              );
            },
            child: child,
          )
        : Transform.scale(key: mergeKey, scale: scale, child: child);
  }
}
