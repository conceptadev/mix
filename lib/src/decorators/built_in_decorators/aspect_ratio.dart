import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class AspectRatioDecorator extends WidgetDecorator<AspectRatioDecorator> {
  final double aspectRatio;
  const AspectRatioDecorator({required this.aspectRatio, super.key});

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(aspectRatio: other.aspectRatio);
  }

  @override
  get props => [aspectRatio];
  @override
  Widget build(Widget child, MixData mix) {
    final common = CommonDescriptor.fromContext(mix);

    return common.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(end: aspectRatio),
            duration: common.animationDuration,
            curve: common.animationCurve,
            builder: (context, value, builderWidget) {
              return AspectRatio(
                key: key,
                aspectRatio: value,
                child: builderWidget,
              );
            },
            child: child,
          )
        : AspectRatio(key: key, aspectRatio: aspectRatio, child: child);
  }
}
