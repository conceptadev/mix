import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mixer.dart';

AspectRationWidgetAttribute aspectRatio(double aspectRatio) {
  return AspectRationWidgetAttribute(aspectRatio: aspectRatio);
}

class AspectRationWidgetAttribute
    extends ParentWidgetDecorator<AspectRationWidgetAttribute> {
  final double aspectRatio;
  const AspectRationWidgetAttribute({required this.aspectRatio});

  @override
  AspectRationWidgetAttribute merge(AspectRationWidgetAttribute other) {
    return AspectRationWidgetAttribute(
      aspectRatio: other.aspectRatio,
    );
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final shared = mixContext.sharedMixer;
    if (shared.animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(end: aspectRatio),
        duration: shared.animationDuration,
        curve: shared.animationCurve,
        builder: (context, value, child) {
          return AspectRatio(
            aspectRatio: value,
            child: child,
          );
        },
        child: child,
      );
    } else {
      return AspectRatio(
        aspectRatio: aspectRatio,
        child: child,
      );
    }
  }
}
