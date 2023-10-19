import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../base/double.dto.dart';
import '../decorator.dart';

const scale = _scale;

ScaleDecorator _scale(double scale) {
  return ScaleDecorator(DoubleDto(scale));
}

class ScaleDecorator extends Decorator<double> {
  final DoubleDto _scale;
  const ScaleDecorator(this._scale, {super.key});

  @override
  ScaleDecorator merge(ScaleDecorator? other) {
    return ScaleDecorator(other?._scale ?? _scale);
  }

  @override
  double resolve(MixData mix) => _scale.resolve(mix);

  @override
  get props => [_scale];

  @override
  Widget build(Widget child, MixData mix) {
    final animation = mix.commonSpec.animation;
    final scale = resolve(mix);

    return mix.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1, end: scale),
            duration: animation.duration,
            curve: animation.curve,
            builder: (context, value, childWidget) {
              return Transform.scale(
                key: mergeKey,
                scale: value,
                child: childWidget,
              );
            },
            child: child,
          )
        : Transform.scale(key: mergeKey, scale: scale, child: child);
  }
}
