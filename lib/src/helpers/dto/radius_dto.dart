import 'package:flutter/material.dart';

import 'double.dto.dart';
import 'dto.dart';

class RadiusDto extends Dto<Radius> {
  /// The radius value on the horizontal axis.
  final DoubleDto _x;

  /// The radius value on the vertical axis.
  final DoubleDto _y;

  const RadiusDto.circular(DoubleDto radius) : this.elliptical(radius, radius);

  const RadiusDto.zero()
      : this.elliptical(
          const DoubleDto(0),
          const DoubleDto(0),
        );

  /// Constructs an elliptical radius with the given radii.
  const RadiusDto.elliptical(DoubleDto x, DoubleDto y)
      : _x = x,
        _y = y;

  factory RadiusDto.from(Radius radius) {
    if (radius.x == radius.y) {
      return RadiusDto.circular(
        DoubleDto.from(radius.x),
      );
    }

    return RadiusDto.elliptical(
      DoubleDto.from(radius.x),
      DoubleDto.from(radius.y),
    );
  }

  static RadiusDto? fromNullable(Radius? radius) {
    if (radius == null) return null;

    return RadiusDto.from(radius);
  }

  @override
  Radius resolve(BuildContext context) {
    final resolvedX = _x.resolve(context);
    final resolvedY = _y.resolve(context);

    if (resolvedX == 0 && resolvedY == 0) {
      return Radius.zero;
    }

    return Radius.elliptical(resolvedX, resolvedY);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadiusDto && other._x == _x && other._y == _y;
  }

  @override
  int get hashCode => _x.hashCode ^ _y.hashCode;
}
