import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import 'dtos.dart';

class RadiusDto extends Dto<Radius> {
  static const zero = RadiusDto(x: DoubleDto(0), y: DoubleDto(0));

  /// The radius value on the horizontal axis.
  final DoubleDto? x;

  /// The radius value on the vertical axis.
  final DoubleDto? y;

  const RadiusDto({required this.x, required this.y});

  const RadiusDto.circular(DoubleDto radius)
      : x = radius,
        y = radius;

  const RadiusDto.elliptical(this.x, this.y);

  @override
  RadiusDto merge(covariant RadiusDto? other) {
    if (other == null) return this;

    return RadiusDto(x: other.x ?? x, y: other.y ?? y);
  }

  @override
  Radius resolve(MixData mix) {
    const defaultRadius = Radius.zero;
    final resolvedX = x?.resolve(mix) ?? defaultRadius.x;

    final resolvedY = y?.resolve(mix) ?? defaultRadius.y;

    return Radius.elliptical(resolvedX, resolvedY);
  }

  @override
  get props => [x, y];
}
