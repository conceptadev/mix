import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class RotateDecorator extends WidgetDecorator<RotateDecorator> {
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
    final common = CommonDescriptor.fromContext(mix);

    if (common.animated) {
      return AnimatedRotation(
        key: key,
        turns: quarterTurns / 4,
        curve: common.animationCurve,
        duration: common.animationDuration,
        child: child,
      );
    }

    return RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
  }
}
