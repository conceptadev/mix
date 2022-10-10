import 'package:flutter/material.dart';
import 'package:mix/src/decorators/decorator_attributes.dart';
import 'package:mix/src/mixer/mix_context.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [AspectRatioDecoratorUtility](AspectRatioDecoratorUtility-class.html)
///
/// {@category Decorators}
class AspectRatioDecorator
    extends ParentDecoratorAttribute<AspectRatioDecorator> {
  final double aspectRatio;
  const AspectRatioDecorator({required this.aspectRatio})
      : super(const Key('AspectRatioDecorator'));

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(
      aspectRatio: other.aspectRatio,
    );
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final sharedProps = mixContext.sharedProps;

    if (sharedProps.animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(end: aspectRatio),
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
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
