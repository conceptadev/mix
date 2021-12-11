import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

ScaleDecorator scale(double scale) {
  return ScaleDecorator(scale);
}

class ScaleDecorator extends ParentDecorator<ScaleDecorator> {
  final double scale;
  const ScaleDecorator(this.scale) : super(const Key('ScaleDecorator'));

  @override
  ScaleDecorator merge(ScaleDecorator other) {
    return ScaleDecorator(other.scale);
  }

  @override
  Widget render(MixContext mixContext, Widget? child) {
    final shared = mixContext.sharedProps;
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
