import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class GradientAttribute extends StyleAttribute<Gradient> {
  final Gradient _gradient;
  const GradientAttribute(Gradient gradient) : _gradient = gradient;

  @override
  GradientAttribute merge(GradientAttribute? other) {
    if (other == null) return this;

    return GradientAttribute(other._gradient);
  }

  @override
  Gradient resolve(MixData mix) {
    return _gradient;
  }

  @override
  get props => [_gradient];
}
