import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class ScaleDecorator extends WidgetDecorator<ScaleDecorator> {
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
    final common = CommonDescriptor.fromContext(mix);

    return common.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1, end: scale),
            duration: common.animationDuration,
            curve: common.animationCurve,
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
