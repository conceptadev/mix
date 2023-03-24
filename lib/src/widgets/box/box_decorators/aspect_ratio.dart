import 'package:flutter/material.dart';

import '../../../attributes/common/common.props.dart';
import '../box.decorator.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [AspectRatioDecoratorUtility](AspectRatioDecoratorUtility-class.html)
///
/// {@category Decorators}
class AspectRatioDecorator extends BoxDecoratorAttribute<AspectRatioDecorator> {
  final double aspectRatio;
  const AspectRatioDecorator({
    required this.aspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(
      aspectRatio: other.aspectRatio,
    );
  }

  @override
  Widget build(BuildContext context, Widget child) {
    final commonProps = CommonProps.fromContext(context);

    if (commonProps.animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(end: aspectRatio),
        duration: commonProps.animationDuration,
        curve: commonProps.animationCurve,
        builder: (context, value, child) {
          return AspectRatio(
            key: key,
            aspectRatio: value,
            child: child,
          );
        },
        child: child,
      );
    } else {
      return AspectRatio(
        key: key,
        aspectRatio: aspectRatio,
        child: child,
      );
    }
  }
}
