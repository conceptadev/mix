import 'package:flutter/material.dart';

import '../../../attributes/common/common.descriptor.dart';
import '../box.decorator.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [ScaleDecoratorUtility](ScaleDecoratorUtility-class.html)
///
/// {@category Decorators}
class ScaleDecorator extends BoxDecorator<ScaleDecorator> {
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
  Widget build(BuildContext context, Widget? child) {
    final common = CommonDescriptor.fromContext(context);
    if (common.animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: scale),
        duration: common.animationDuration,
        curve: common.animationCurve,
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
