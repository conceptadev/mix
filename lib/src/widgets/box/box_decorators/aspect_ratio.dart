import 'package:flutter/material.dart';

import '../../../attributes/common/common.props.dart';
import '../../../decorators/decorator_attribute.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [AspectRatioDecoratorUtility](AspectRatioDecoratorUtility-class.html)
///
/// {@category Decorators}
class AspectRatioDecorator
    extends BoxParentDecoratorAttribute<AspectRatioDecorator> {
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
  Widget builder(BuildContext context, Widget child) {
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
