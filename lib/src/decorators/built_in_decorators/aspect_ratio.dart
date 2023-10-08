import 'package:flutter/material.dart';

import '../../attributes/animation/animation.attribute.dart';
import '../../attributes/animation/animation.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class AspectRatioDecorator extends Decorator {
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
    final animation = mix.resolveAttributeOfType<AnimationAttribute,
        AnimationAttributeResolved>();

    return mix.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(end: aspectRatio),
            duration: animation.duration,
            curve: animation.curve,
            builder: (context, value, builderWidget) {
              return AspectRatio(
                key: mergeKey,
                aspectRatio: value,
                child: builderWidget,
              );
            },
            child: child,
          )
        : AspectRatio(key: mergeKey, aspectRatio: aspectRatio, child: child);
  }
}
