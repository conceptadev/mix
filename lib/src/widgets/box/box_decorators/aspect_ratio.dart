import 'package:flutter/material.dart';

import '../../../attributes/common/common.descriptor.dart';
import '../box.decorator.dart';

class AspectRatioDecorator extends BoxDecorator<AspectRatioDecorator> {
  final double aspectRatio;
  const AspectRatioDecorator({
    required this.aspectRatio,
    super.key,
  });

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(
      aspectRatio: other.aspectRatio,
    );
  }

  @override
  Widget build(BuildContext context, Widget child) {
    final commonProps = CommonDescriptor.fromContext(context);

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

  @override
  get props => [aspectRatio];
}
