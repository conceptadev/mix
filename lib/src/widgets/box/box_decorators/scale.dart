import 'package:flutter/material.dart';

import '../../../decorators/decorator_attribute.dart';
import '../../../mixer/mix_context.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [ScaleDecoratorUtility](ScaleDecoratorUtility-class.html)
///
/// {@category Decorators}
class ScaleDecorator extends BoxParentDecoratorAttribute<ScaleDecorator> {
  final double scale;
  const ScaleDecorator(
    this.scale, {
    Key? key,
  }) : super(key: key);

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
}
