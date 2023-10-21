import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../dto/double.dto.dart';
import '../decorator.dart';

const scale = _scale;

ScaleDecorator _scale(double scale) {
  return ScaleDecorator(DoubleDto(scale));
}

class ScaleDecorator extends Decorator<double> {
  final DoubleDto _scale;
  const ScaleDecorator(this._scale);

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
    final animationCurve = mix.commonSpec.animationCurve;
    final animationDuration = mix.commonSpec.animationDuration;

    final scale = resolve(mix);

    return mix.animated
        ? TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 1, end: scale),
            duration: animationDuration,
            curve: animationCurve,
            builder: (context, value, childWidget) {
              return Transform.scale(scale: value, child: childWidget);
            },
            child: child,
          )
        : Transform.scale(scale: scale, child: child);
  }
}
