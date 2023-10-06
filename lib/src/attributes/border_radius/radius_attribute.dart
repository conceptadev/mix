// ignore_for_file: prefer-correct-identifier-length

import 'package:flutter/material.dart';

import '../../dtos/dto.dart';
import '../../factory/mix_provider_data.dart';

class RadiusAttribute extends ResolvableAttribute<Radius> {
  /// The radius value on the horizontal axis.
  final double _x;

  /// The radius value on the vertical axis.
  final double _y;

  const RadiusAttribute.circular(double radius)
      : _x = radius,
        _y = radius;

  const RadiusAttribute.zero() : this.elliptical(0, 0);

  /// Constructs an elliptical radius with the given radii.
  const RadiusAttribute.elliptical(double x, double y)
      : _x = x,
        _y = y;

  factory RadiusAttribute.from(Radius radius) {
    return radius.x == radius.y
        ? RadiusAttribute.circular(radius.x)
        : RadiusAttribute.elliptical(radius.x, radius.y);
  }

  static RadiusAttribute? maybeFrom(Radius? radius) {
    if (radius == null) return null;

    return RadiusAttribute.from(radius);
  }

  @override
  RadiusAttribute merge(covariant RadiusAttribute? other) {
    if (other == null) return this;

    return RadiusAttribute.elliptical(other._x, other._y);
  }

  @override
  Radius resolve(MixData mix) {
    final resolvedX = _x;

    final resolvedY = _y;

    return resolvedX == 0 && resolvedY == 0
        ? Radius.zero
        : Radius.elliptical(resolvedX, resolvedY);
  }

  @override
  get props => [_x, _y];
}
