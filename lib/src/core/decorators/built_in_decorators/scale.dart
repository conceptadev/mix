import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../dto/dtos.dart';
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
    final scale = resolve(mix);

    return Transform.scale(scale: scale, child: child);
  }
}
