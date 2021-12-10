import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

OpacityDecorator opacity(double opacity) {
  return OpacityDecorator(opacity: opacity);
}

class OpacityDecorator extends ParentWidgetDecorator<OpacityDecorator> {
  final double opacity;
  const OpacityDecorator({
    required this.opacity,
  });

  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final shared = mixContext.sharedMixer;
    if (shared.animated) {
      return AnimatedOpacity(
        duration: shared.animationDuration,
        curve: shared.animationCurve,
        opacity: opacity,
        child: child,
      );
    } else {
      return Opacity(
        opacity: opacity,
        child: child,
      );
    }
  }
}
