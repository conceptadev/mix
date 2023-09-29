import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class ScaleDecorator extends WidgetDecorator<ScaleDecorator> {
  final double scale;
  const ScaleDecorator(this.scale, {super.key});

  @override
  get props => [scale];
  @override
  ScaleDecorator merge(ScaleDecorator other) {
    return ScaleDecorator(other.scale);
  }

  @override
  Widget build(MixData mix, Widget child) {
    final common = CommonDescriptor.fromContext(mix);

    return common.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1, end: scale),
            duration: common.animationDuration,
            curve: common.animationCurve,
            builder: (context, value, child) {
              return Transform.scale(key: key, scale: value, child: child);
            },
            child: child,
          )
        : Transform.scale(key: key, scale: scale, child: child);
  }
}
