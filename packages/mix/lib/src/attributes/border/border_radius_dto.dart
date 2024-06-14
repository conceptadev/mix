import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../core/factory/mix_data.dart';
import '../../theme/tokens/radius_token.dart';

/// Represents a [Dto] Data transfer object of [BorderRadiusGeometry]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a [BorderRadiusGeometry]
///
/// This Dto implements `BorderRadius` and `BorderRadiusDirectional` Flutter classes to allow for
/// better merging support, and cleaner API for the utilities
///
/// See also:
/// - [BorderRadiusGeometry], which is the Flutter counterpart of this class.
@immutable
class BorderRadiusGeometryDto extends Dto<BorderRadiusGeometry> {
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

  // Directional values
  final Radius? topStart;
  final Radius? topEnd;
  final Radius? bottomStart;
  final Radius? bottomEnd;

  const BorderRadiusGeometryDto({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
  });

  bool get isDirectional =>
      topStart != null ||
      topEnd != null ||
      bottomStart != null ||
      bottomEnd != null;

  @override
  BorderRadiusGeometryDto merge(BorderRadiusGeometryDto? other) {
    if (other == null) return this;

    return BorderRadiusGeometryDto(
      topLeft: other.topLeft ?? topLeft,
      topRight: other.topRight ?? topRight,
      bottomLeft: other.bottomLeft ?? bottomLeft,
      bottomRight: other.bottomRight ?? bottomRight,
      topStart: other.topStart ?? topStart,
      topEnd: other.topEnd ?? topEnd,
      bottomStart: other.bottomStart ?? bottomStart,
      bottomEnd: other.bottomEnd ?? bottomEnd,
    );
  }

  @override
  BorderRadiusGeometry resolve(MixData mix) {
    Radius getRadiusValue(Radius? radius) {
      if (radius == null) return Radius.zero;

      return radius is RadiusRef ? mix.tokens.radiiRef(radius) : radius;
    }

    return isDirectional
        ? BorderRadiusDirectional.only(
            topStart: getRadiusValue(topStart),
            topEnd: getRadiusValue(topEnd),
            bottomStart: getRadiusValue(bottomStart),
            bottomEnd: getRadiusValue(bottomEnd),
          )
        : BorderRadius.only(
            topLeft: getRadiusValue(topLeft),
            topRight: getRadiusValue(topRight),
            bottomLeft: getRadiusValue(bottomLeft),
            bottomRight: getRadiusValue(bottomRight),
          );
  }

  @override
  get props => [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
        topStart,
        topEnd,
        bottomStart,
        bottomEnd,
      ];
}

extension BorderRadiusExt on BorderRadius {
  BorderRadiusGeometryDto toDto() {
    return BorderRadiusGeometryDto(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}

extension BorderRadiusDirectionalExt on BorderRadiusDirectional {
  BorderRadiusGeometryDto toDto() {
    return BorderRadiusGeometryDto(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }
}

extension BorderRadiusGeometryExt on BorderRadiusGeometry {
  BorderRadiusGeometryDto toDto() {
    if (this is BorderRadius) {
      return (this as BorderRadius).toDto();
    }
    if (this is BorderRadiusDirectional) {
      return (this as BorderRadiusDirectional).toDto();
    }
    throw ArgumentError.value(
      this,
      'radius',
      'BorderRadiusGeometry type is not supported',
    );
  }
}
