import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'gradient_dto.dart';

@immutable
class GradientAttribute
    extends ResolvableAttribute<GradientAttribute, Gradient> {
  final GradientDto value;
  const GradientAttribute(this.value);

  static GradientAttribute from(Gradient gradient) {
    return GradientAttribute(GradientDto.from(gradient));
  }

  static GradientAttribute? maybeFrom(Gradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  bool _canMerge(GradientAttribute other) {
    return value.runtimeType == other.value.runtimeType;
  }

  @override
  GradientAttribute merge(GradientAttribute? other) {
    if (other == null) return this;

    return _canMerge(other)
        ? GradientAttribute(value.merge(other.value))
        : this;
  }

  @override
  Gradient resolve(MixData mix) => value.resolve(mix);

  @override
  get props => [value];
}
