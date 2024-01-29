import 'package:flutter/material.dart';

import '../../../mix.dart';
import 'shape_border_dto.dart';

/// Utility for setting `ShapeBorder` values.
///
/// Useful for defining the shape of widgets.
/// Includes subclasses of `ShapeBorder` such as `RoundedRectangleBorder`.
///
/// Example:
///
/// ```dart
/// final shapeBorder = ShapeBorderUtility(builder);
/// final roundedRectangle = shapeBorder.roundedRectangle(10);
/// ```
///
/// See [ShapeBorder] for more information.
class ShapeBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, ShapeBorderDto, ShapeBorder> {
  const ShapeBorderUtility(super.builder)
      : super(valueToDto: ShapeBorderDto.from);

  RoundedRectanbleBorderUtility<T> get roundedRectangle =>
      RoundedRectanbleBorderUtility((roundedRectangle) {
        return builder(roundedRectangle);
      });

  CircleBorderUtility<T> get circle =>
      CircleBorderUtility((circle) => builder(circle));

  BeveledRectangleBorderUtility<T> get beveledRectangle =>
      BeveledRectangleBorderUtility((beveledRectangle) {
        return builder(beveledRectangle);
      });

  StadiumBorderUtility<T> get stadium =>
      StadiumBorderUtility((stadium) => builder(stadium));

  ContinuousRectangleBorderUtility<T> get continuousRectangle =>
      ContinuousRectangleBorderUtility((continuousRectangle) {
        return builder(continuousRectangle);
      });
}

class RoundedRectanbleBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, RoundedRectangleBorderDto, RoundedRectangleBorder> {
  const RoundedRectanbleBorderUtility(super.builder)
      : super(valueToDto: RoundedRectangleBorderDto.from);

  T _only({BorderSideDto? side, BorderRadiusGeometryDto? borderRadius}) {
    return builder(
      RoundedRectangleBorderDto(borderRadius: borderRadius, side: side),
    );
  }

  BorderSideUtility<T> get side =>
      BorderSideUtility((side) => _only(side: side));

  BorderRadiusGeometryUtility<T> get borderRadius =>
      BorderRadiusGeometryUtility(
        (borderRadius) => _only(borderRadius: borderRadius),
      );

  T call({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return _only(
      side: BorderSideDto.maybeFrom(side),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(borderRadius),
    );
  }
}

class CircleBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, CircleBorderDto, CircleBorder> {
  const CircleBorderUtility(super.builder)
      : super(valueToDto: CircleBorderDto.from);

  T _only({BorderSideDto? side, double? eccentricity}) {
    return builder(CircleBorderDto(side: side, eccentricity: eccentricity));
  }

  DoubleUtility<T> get eccentricity =>
      DoubleUtility((eccentricity) => _only(eccentricity: eccentricity));

  BorderSideUtility<T> get side =>
      BorderSideUtility((side) => _only(side: side));

  T call({BorderSide? side, double? eccentricity}) {
    return _only(
      side: BorderSideDto.maybeFrom(side),
      eccentricity: eccentricity,
    );
  }
}

class BeveledRectangleBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, BeveledRectangleBorderDto, BeveledRectangleBorder> {
  const BeveledRectangleBorderUtility(super.builder)
      : super(valueToDto: BeveledRectangleBorderDto.from);

  T _only({BorderSideDto? side, BorderRadiusGeometryDto? borderRadius}) {
    return builder(
      BeveledRectangleBorderDto(borderRadius: borderRadius, side: side),
    );
  }

  BorderSideUtility<T> get side =>
      BorderSideUtility((side) => _only(side: side));

  BorderRadiusGeometryUtility<T> get borderRadius =>
      BorderRadiusGeometryUtility(
        (borderRadius) => _only(borderRadius: borderRadius),
      );

  T call({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return _only(
      side: BorderSideDto.maybeFrom(side),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(borderRadius),
    );
  }
}

class StadiumBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, StadiumBorderDto, StadiumBorder> {
  const StadiumBorderUtility(super.builder)
      : super(valueToDto: StadiumBorderDto.from);

  T _only({BorderSideDto? side}) {
    return builder(StadiumBorderDto(side: side));
  }

  BorderSideUtility<T> get side =>
      BorderSideUtility((side) => _only(side: side));

  T call({BorderSide? side}) {
    return _only(side: BorderSideDto.maybeFrom(side));
  }
}

class ContinuousRectangleBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, ContinuousRectangleBorderDto,
        ContinuousRectangleBorder> {
  const ContinuousRectangleBorderUtility(super.builder)
      : super(valueToDto: ContinuousRectangleBorderDto.from);

  T _only({BorderSideDto? side, BorderRadiusGeometryDto? borderRadius}) {
    return builder(
      ContinuousRectangleBorderDto(borderRadius: borderRadius, side: side),
    );
  }

  BorderSideUtility<T> get side =>
      BorderSideUtility((side) => _only(side: side));

  BorderRadiusGeometryUtility<T> get borderRadius =>
      BorderRadiusGeometryUtility(
        (borderRadius) => _only(borderRadius: borderRadius),
      );

  T call({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return _only(
      side: BorderSideDto.maybeFrom(side),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(borderRadius),
    );
  }
}
