import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mixer.dart';

OpacityWidgetAttribute opacity(double opacity) {
  return OpacityWidgetAttribute(opacity: opacity);
}

class OpacityWidgetAttribute
    extends ParentWidgetDecorator<OpacityWidgetAttribute> {
  final double opacity;
  const OpacityWidgetAttribute({
    required this.opacity,
  });

  @override
  OpacityWidgetAttribute merge(OpacityWidgetAttribute other) {
    return OpacityWidgetAttribute(opacity: other.opacity);
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
