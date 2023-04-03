import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../dto.dart';

class RadiusDto extends Dto<Radius> {
  /// The radius value on the horizontal axis.
  final double _x;

  /// The radius value on the vertical axis.
  final double _y;

  const RadiusDto.circular(double radius) : this.elliptical(radius, radius);

  const RadiusDto.zero()
      : this.elliptical(
          0,
          0,
        );

  /// Constructs an elliptical radius with the given radii.
  const RadiusDto.elliptical(double x, double y)
      : _x = x,
        _y = y;

  factory RadiusDto.from(Radius radius) {
    if (radius.x == radius.y) {
      return RadiusDto.circular(
        radius.x,
      );
    }

    return RadiusDto.elliptical(
      radius.x,
      radius.y,
    );
  }

  static RadiusDto? maybeFrom(Radius? radius) {
    if (radius == null) return null;

    return RadiusDto.from(radius);
  }

  @override
  Radius resolve(MixData mix) {
    final resolvedX = _x;
    final resolvedY = _y;

    if (resolvedX == 0 && resolvedY == 0) {
      return Radius.zero;
    }

    return Radius.elliptical(resolvedX, resolvedY);
  }

  @override
  get props => [_x, _y];
}
