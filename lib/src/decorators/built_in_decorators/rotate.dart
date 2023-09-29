import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class RotateDecorator extends WidgetDecorator<RotateDecorator> {
  final int quarterTurns;
  const RotateDecorator({required this.quarterTurns, super.key});

  @override
  get props => [quarterTurns];
  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(quarterTurns: other.quarterTurns);
  }

  @override
  Widget build(MixData mix, Widget child) {
    final common = CommonDescriptor.fromContext(mix);

    if (common.animated) {
      return AnimatedRotation(
        key: key,
        child: child,
        turns: quarterTurns / 4,
        curve: common.animationCurve,
        duration: common.animationDuration,
      );
    }

    return RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
  }
}
