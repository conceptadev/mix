import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

OpacityDecorator opacity(double opacity) {
  return OpacityDecorator(opacity);
}

class OpacityDecorator extends ParentDecorator<double> {
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
  Widget build(child, value) {
    return Opacity(opacity: value, child: child);
  }
}
