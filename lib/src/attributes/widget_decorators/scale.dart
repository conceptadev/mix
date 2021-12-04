import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

ScaleWidgetAttribute scale(double scale) {
  return ScaleWidgetAttribute(scale);
}

class ScaleWidgetAttribute extends ParentWidgetDecorator<ScaleWidgetAttribute> {
  final double scale;
  const ScaleWidgetAttribute(this.scale);

  @override
  ScaleWidgetAttribute merge(ScaleWidgetAttribute other) {
    return ScaleWidgetAttribute(other.scale);
  }

  @override
  Widget render(MixContext mixContext, Widget? child) {
    final shared = mixContext.sharedMixer;
    if (shared.animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: scale),
        duration: shared.animationDuration,
        curve: shared.animationCurve,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: child,
      );
    } else {
      return Transform.scale(
        scale: scale,
        child: child,
      );
    }
  }
}
