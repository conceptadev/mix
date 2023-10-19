import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../decorator.dart';

RotateDecorator rotate(int quarterTurns) {
  return RotateDecorator(quarterTurns: quarterTurns);
}

RotateDecorator rotate90() => rotate(1);
RotateDecorator rotate180() => rotate(2);
RotateDecorator rotate270() => rotate(3);

class RotateDecorator extends Decorator<int> {
  final int quarterTurns;
  const RotateDecorator({super.key, required this.quarterTurns});

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(quarterTurns: other.quarterTurns);
  }

  @override
  int resolve(MixData mix) => quarterTurns;

  @override
  get props => [quarterTurns];
  @override
  Widget build(Widget child, MixData mix) {
    if (mix.animated) {
      final animation = mix.commonSpec.animation;

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

class RotateSpec {
  final int quarterTurns;
  const RotateSpec({required this.quarterTurns});
}
