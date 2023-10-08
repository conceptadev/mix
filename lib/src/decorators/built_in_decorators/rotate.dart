import 'package:flutter/material.dart';

import '../../attributes/animation/animation.attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class RotateDecorator extends Decorator {
  final int quarterTurns;
  const RotateDecorator({super.key, required this.quarterTurns});

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(quarterTurns: other.quarterTurns);
  }

  @override
  get props => [quarterTurns];
  @override
  Widget build(Widget child, MixData mix) {
    if (mix.animated) {
      final animation = mix.resolveAttributeOfType<AnimationAttribute,
          AnimationAttributeResolved>();

      return AnimatedRotation(
        key: mergeKey,
        turns: quarterTurns / 4,
        curve: animation?.curve ?? Curves.linear,
        duration: animation?.duration ?? const Duration(milliseconds: 300),
        child: child,
      );
    }

    return RotatedBox(key: mergeKey, quarterTurns: quarterTurns, child: child);
  }
}
