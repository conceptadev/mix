import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../decorator.dart';

OpacityDecorator opacity(double opacity) {
  return OpacityDecorator(opacity);
}

class OpacityDecorator extends Decorator<double> {
  final double value;
  const OpacityDecorator(this.value);

  @override
  OpacityDecorator merge(OpacityDecorator? other) {
    return OpacityDecorator(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, mix) {
    final opacity = resolve(mix);

    return Opacity(opacity: opacity, child: child);
  }
}
