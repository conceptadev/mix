import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../base/double.dto.dart';
import '../decorator.dart';

const aspectRataion = _aspectRatio;

AspectRatioDecorator _aspectRatio(double aspectRatio) {
  return AspectRatioDecorator(aspectRatio: DoubleDto(aspectRatio));
}

class AspectRatioDecorator extends Decorator<double> {
  final DoubleDto _aspectRatio;
  const AspectRatioDecorator({required DoubleDto aspectRatio})
      : _aspectRatio = aspectRatio;

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(aspectRatio: other._aspectRatio);
  }

  @override
  double resolve(MixData mix) => _aspectRatio.resolve(mix);

  @override
  get props => [_aspectRatio];

  @override
  Widget build(Widget child, MixData mix) {
    final animation = mix.commonSpec.animation;
    final aspectRatio = resolve(mix);

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
