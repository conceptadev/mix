import 'package:flutter/material.dart';

import '../dto.dart';
import 'border_radius.dto.dart';
import 'border_radius_directional.dto.dart';
import 'radius_dto.dart';

abstract class BorderRadiusGeometryDto<T extends BorderRadiusGeometry>
    extends Dto<T> {
  const BorderRadiusGeometryDto();

  RadiusDto? get topLeft => null;
  RadiusDto? get topRight => null;
  RadiusDto? get bottomLeft => null;
  RadiusDto? get bottomRight => null;
  RadiusDto? get topStart => null;
  RadiusDto? get topEnd => null;
  RadiusDto? get bottomStart => null;
  RadiusDto? get bottomEnd => null;

  static Dto from<T extends BorderRadiusGeometry,
      Dto extends BorderRadiusGeometryDto<T>>(T borderRadius) {
    if (borderRadius is BorderRadius) {
      return BorderRadiusDto.from(borderRadius) as Dto;
    }
    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusDirectionalDto.from(borderRadius) as Dto;
    }
    throw UnsupportedError(
      "${borderRadius.runtimeType} is not supported, use BorderRadius or BorderRadiusDirectional",
    );
  }

  static Dto? maybeFrom<T extends BorderRadiusGeometry,
      Dto extends BorderRadiusGeometryDto<T>>(T? borderRadius) {
    if (borderRadius == null) {
      return null;
    }

    return BorderRadiusGeometryDto.from(borderRadius);
  }

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
        topLeft: other.topLeft ?? topLeft,
        topRight: other.topRight ?? topRight,
        bottomLeft: other.bottomLeft ?? bottomLeft,
        bottomRight: other.bottomRight ?? bottomRight,
      );
    }

    if (other is BorderRadiusDirectionalDto) {
      return BorderRadiusDirectionalDto.only(
        topStart: other.topStart ?? topStart,
        topEnd: other.topEnd ?? topEnd,
        bottomStart: other.bottomStart ?? bottomStart,
        bottomEnd: other.bottomEnd ?? bottomEnd,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is unsupported, use BorderRadiusDto or BorderRadiusDirectionalDto",
    );
  }
}
