import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

class RadiusDto extends Dto<Radius> {
  static const zero = RadiusDto.circular(0.0);

  /// The radius value on the horizontal axis.
  final double? _x;

  /// The radius value on the vertical axis.
  final double? _y;

  const RadiusDto._({double? x, double? y})
      : _x = x,
        _y = y;

  const RadiusDto.circular(double radius)
      : _x = radius,
        _y = radius;

  /// Constructs an elliptical radius with the given radii.
  const RadiusDto.elliptical(double x, double y)
      : _x = x,
        _y = y;

  factory RadiusDto.from(Radius radius) {
    return radius.x == radius.y
        ? RadiusDto.circular(radius.x)
        : RadiusDto.elliptical(radius.x, radius.y);
  }

  static RadiusDto? maybeFrom(Radius? radius) {
    if (radius == null) return null;

    return RadiusDto.from(radius);
  }

  @visibleForTesting
  double? get x => _x;

  @visibleForTesting
  double? get y => _y;

  @override
  RadiusDto merge(covariant RadiusDto? other) {
    if (other == null) return this;

    return RadiusDto._(x: other._x ?? _x, y: other._y ?? _y);
  }

  @override
  Radius resolve(MixData mix) {
    const defaultRadius = Radius.zero;
    final resolvedX = _x ?? defaultRadius.x;

    final resolvedY = _y ?? defaultRadius.y;

    return Radius.elliptical(resolvedX, resolvedY);
  }

  @override
  get props => [_x, _y];
}
