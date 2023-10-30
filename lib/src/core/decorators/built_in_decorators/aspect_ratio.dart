import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../../dto/dtos.dart';
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
    final aspectRatio = resolve(mix);

    return AspectRatio(aspectRatio: aspectRatio, child: child);
  }
}
