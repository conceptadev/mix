import 'package:flutter/material.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class GradientAttribute extends StyleAttribute<Gradient> {
  final Gradient _gradient;
  const GradientAttribute(Gradient gradient) : _gradient = gradient;

  @visibleForTesting
  Gradient get value => _gradient;

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
