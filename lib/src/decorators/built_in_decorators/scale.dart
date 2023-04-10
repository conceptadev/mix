import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class ScaleDecorator extends WidgetDecorator<ScaleDecorator> {
  final double scale;
  const ScaleDecorator(
    this.scale, {
    super.key,
  });

  @override
  ScaleDecorator merge(ScaleDecorator other) {
    return ScaleDecorator(other.scale);
  }

  @override
  Widget build(MixData mix, Widget child) {
    final common = CommonDescriptor.fromContext(mix);
    if (common.animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: scale),
        duration: common.animationDuration,
        curve: common.animationCurve,
        builder: (context, value, child) {
          return Transform.scale(
            key: key,
            scale: value,
            child: child,
          );
        },
        child: child,
      );
    } else {
      return Transform.scale(
        key: key,
        scale: scale,
        child: child,
      );
    }
  }

  @override
  get props => [scale];
}
