import 'package:flutter/material.dart';

import '../dto.dart';
import 'border_radius.dto.dart';
import 'border_radius_directional.dto.dart';
import 'radius_dto.dart';

abstract class BorderRadiusGeometryDto<T extends BorderRadiusGeometry>
    extends ResolvableAttribute<T> {
  const BorderRadiusGeometryDto();

  static D from<T extends BorderRadiusGeometry,
      D extends BorderRadiusGeometryDto<T>>(T borderRadius) {
    if (borderRadius is BorderRadius) {
      return BorderRadiusDto.from(borderRadius) as D;
    }
    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusDirectionalDto.from(borderRadius) as D;
    }
    throw UnsupportedError(
      "${borderRadius.runtimeType} is not supported, use BorderRadius or BorderRadiusDirectional",
    );
  }

  static D? maybeFrom<T extends BorderRadiusGeometry,
      D extends BorderRadiusGeometryDto<T>>(T? borderRadius) {
    return borderRadius == null ? null : from(borderRadius);
  }

  RadiusDto? get topLeft => null;
  RadiusDto? get topRight => null;
  RadiusDto? get bottomLeft => null;
  RadiusDto? get bottomRight => null;
  RadiusDto? get topStart => null;
  RadiusDto? get topEnd => null;
  RadiusDto? get bottomStart => null;
  RadiusDto? get bottomEnd => null;

  bool get isDirectional =>
      (topStart != null ||
          topEnd != null ||
          bottomStart != null ||
          bottomEnd != null) &&
      (topLeft == null &&
          topRight == null &&
          bottomLeft == null &&
          bottomRight == null);

  BorderRadiusGeometryDto merge(BorderRadiusGeometryDto? other) {
    if (other == null || other == this) return this;

    if (other is BorderRadiusDto) {
      return BorderRadiusDto.only(
        bottomLeft: other.bottomLeft ?? bottomLeft,
        bottomRight: other.bottomRight ?? bottomRight,
        topLeft: other.topLeft ?? topLeft,
        topRight: other.topRight ?? topRight,
      );
    }

    if (other is BorderRadiusDirectionalDto) {
      return BorderRadiusDirectionalDto.only(
        bottomEnd: other.bottomEnd ?? bottomEnd,
        bottomStart: other.bottomStart ?? bottomStart,
        topEnd: other.topEnd ?? topEnd,
        topStart: other.topStart ?? topStart,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is unsupported, use BorderRadiusDto or BorderRadiusDirectionalDto",
    );
  }
}
