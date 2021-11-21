import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mixer.dart';

ScaleWidgetAttribute scale(double scale) {
  return ScaleWidgetAttribute(scale);
}

class ScaleWidgetAttribute extends WidgetAttribute<ScaleWidgetAttribute> {
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
      return AnimatedScale(
        scale: scale,
        duration: shared.animationDuration,
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
