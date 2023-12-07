import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';

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
class BorderRadiusGeometryDto extends Dto<BorderRadiusGeometry>
    with Mergeable<BorderRadiusGeometryDto> {
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

  static BorderRadiusGeometryDto from(BorderRadiusGeometry radius) {
    if (radius is BorderRadius) {
      return BorderRadiusGeometryDto(
        topLeft: radius.topLeft,
        topRight: radius.topRight,
        bottomLeft: radius.bottomLeft,
        bottomRight: radius.bottomRight,
      );
    }

    if (radius is BorderRadiusDirectional) {
      return BorderRadiusGeometryDto(
        topStart: radius.topStart,
        topEnd: radius.topEnd,
        bottomStart: radius.bottomStart,
        bottomEnd: radius.bottomEnd,
      );
    }

    throw ArgumentError.value(
      radius,
      'radius',
      'BorderRadiusGeometry type is not supported',
    );
  }

  static BorderRadiusGeometryDto? maybeFrom(BorderRadiusGeometry? radius) {
    return radius == null ? null : from(radius);
  }

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
    const defaultRadius = Radius.zero;

    return isDirectional
        ? BorderRadiusDirectional.only(
            topStart: topStart ?? defaultRadius,
            topEnd: topEnd ?? defaultRadius,
            bottomStart: bottomStart ?? defaultRadius,
            bottomEnd: bottomEnd ?? defaultRadius,
          )
        : BorderRadius.only(
            topLeft: topLeft ?? defaultRadius,
            topRight: topRight ?? defaultRadius,
            bottomLeft: bottomLeft ?? defaultRadius,
            bottomRight: bottomRight ?? defaultRadius,
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
