import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

/// @nodoc
OpacityDecorator opacity(double opacity) {
  return OpacityDecorator(opacity: opacity);
}

/// Short Utils:
/// - opacity(double opacity)
///
/// {@category Decorators}
class OpacityDecorator extends ParentDecorator<OpacityDecorator> {
  final double opacity;
  const OpacityDecorator({
    required this.opacity,
  }) : super(const Key('OpacityDecorator'));

  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final shared = mixContext.sharedProps;
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
