import 'package:flutter/material.dart';

import '../../attributes/exports.dart';
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
      final animation = mix.of<AnimationAttribute, AnimationDto>(
        const AnimationDto.defaults(),
      );

      return AnimatedRotation(
        key: mergeKey,
        turns: quarterTurns / 4,
        curve: animation.curve,
        duration: animation.duration,
        child: child,
      );
    }

    return RotatedBox(key: mergeKey, quarterTurns: quarterTurns, child: child);
  }
}
