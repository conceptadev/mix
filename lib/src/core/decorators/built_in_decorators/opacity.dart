import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../dto/double.dto.dart';
import '../decorator.dart';

OpacityDecorator opacity(double opacity) {
  return OpacityDecorator(DoubleDto(opacity));
}

class OpacityDecorator extends Decorator<double> {
  final DoubleDto value;
  const OpacityDecorator(this.value);

  @override
  OpacityDecorator merge(OpacityDecorator? other) {
    return OpacityDecorator(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) {
    return value.resolve(mix);
  }

  @override
  get props => [value];

  @override
  Widget build(child, mix) {
    final animationCurve = mix.commonSpec.animationCurve;
    final animationDuration = mix.commonSpec.animationDuration;

    final opacity = resolve(mix);

    return mix.animated
        ? AnimatedOpacity(
            opacity: opacity,
            curve: animationCurve,
            duration: animationDuration,
            child: child,
          )
        : Opacity(opacity: opacity, child: child);
  }
}
