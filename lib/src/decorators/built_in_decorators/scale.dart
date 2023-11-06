import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

const scale = _scale;

ScaleDecorator _scale(double scale) {
  return ScaleDecorator(scale);
}

class ScaleDecorator extends ParentDecorator<double> {
  final double _scale;
  const ScaleDecorator(this._scale);

  @override
  ScaleDecorator merge(ScaleDecorator? other) {
    return ScaleDecorator(other?._scale ?? _scale);
  }

  @override
  double resolve(MixData mix) => _scale;

  @override
  get props => [_scale];

  @override
  Widget build(child, value) {
    return Transform.scale(scale: value, child: child);
  }
}
