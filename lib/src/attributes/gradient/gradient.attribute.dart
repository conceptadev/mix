import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

class GradientAttribute extends StyleAttribute<Gradient> {
  final Gradient _gradient;
  const GradientAttribute({required Gradient gradient}) : _gradient = gradient;

  @override
  GradientAttribute merge(GradientAttribute? other) {
    if (other == null) return this;

    return GradientAttribute(gradient: other._gradient);
  }

  @override
  Gradient resolve(MixData mix) {
    return _gradient;
  }

  @override
  get props => [_gradient];
}
