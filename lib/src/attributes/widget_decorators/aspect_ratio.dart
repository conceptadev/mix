import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

AspectRatioDecorator aspectRatio(double aspectRatio) {
  return AspectRatioDecorator(aspectRatio: aspectRatio);
}

class AspectRatioDecorator extends ParentWidgetDecorator<AspectRatioDecorator> {
  final double aspectRatio;
  const AspectRatioDecorator({required this.aspectRatio});

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(
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
