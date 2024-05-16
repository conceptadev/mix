import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'border_dto.dart';
import 'border_radius_dto.dart';
import 'border_radius_util.dart';
import 'border_util.dart';
import 'shape_border_dto.dart';

class ShapeBorderUtility<T extends Attribute>
    extends MixUtility<T, ShapeBorderDto> {
  late final roundedRectangle = RoundedRectanbleBorderUtility(builder);

  late final circle = CircleBorderUtility(builder);

  late final beveledRectangle = BeveledRectangleBorderUtility(builder);

  late final stadium = StadiumBorderUtility(builder);

  late final continuousRectangle = ContinuousRectangleBorderUtility(builder);

  ShapeBorderUtility(super.builder);
}

class RoundedRectanbleBorderUtility<T extends Attribute>
    extends DtoUtility<T, RoundedRectangleBorderDto, RoundedRectangleBorder> {
  late final side = BorderSideUtility((v) => only(side: v));

  late final borderRadius = BorderRadiusUtility(
    (v) => only(borderRadius: v),
  );

  RoundedRectanbleBorderUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T call({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return only(side: side?.toDto(), borderRadius: borderRadius?.toDto());
  }

  @override
  T only({BorderSideDto? side, BorderRadiusGeometryDto? borderRadius}) {
    return builder(
      RoundedRectangleBorderDto(borderRadius: borderRadius, side: side),
    );
  }
}

class CircleBorderUtility<T extends Attribute>
    extends DtoUtility<T, CircleBorderDto, CircleBorder> {
  late final eccentricity = DoubleUtility((v) => only(eccentricity: v));

  late final side = BorderSideUtility((v) => only(side: v));

  CircleBorderUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T call({BorderSide? side, double? eccentricity}) {
    return only(side: side?.toDto(), eccentricity: eccentricity);
  }

  @override
  T only({BorderSideDto? side, double? eccentricity}) {
    return builder(CircleBorderDto(side: side, eccentricity: eccentricity));
  }
}

class BeveledRectangleBorderUtility<T extends Attribute>
    extends DtoUtility<T, BeveledRectangleBorderDto, BeveledRectangleBorder> {
  late final side = BorderSideUtility((v) => only(side: v));

  late final borderRadius = BorderRadiusUtility(
    (v) => only(borderRadius: v),
  );

  BeveledRectangleBorderUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T call({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return only(side: side?.toDto(), borderRadius: borderRadius?.toDto());
  }

  @override
  T only({BorderSideDto? side, BorderRadiusGeometryDto? borderRadius}) {
    return builder(
      BeveledRectangleBorderDto(borderRadius: borderRadius, side: side),
    );
  }
}

class StadiumBorderUtility<T extends Attribute>
    extends DtoUtility<T, StadiumBorderDto, StadiumBorder> {
  late final side = BorderSideUtility((v) => only(side: v));

  StadiumBorderUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T call({BorderSide? side}) {
    return only(side: side?.toDto());
  }

  @override
  T only({BorderSideDto? side}) {
    return builder(StadiumBorderDto(side: side));
  }
}

class ContinuousRectangleBorderUtility<T extends Attribute> extends DtoUtility<
    T, ContinuousRectangleBorderDto, ContinuousRectangleBorder> {
  late final side = BorderSideUtility((v) => only(side: v));

  late final borderRadius = BorderRadiusUtility(
    (v) => only(borderRadius: v),
  );

  ContinuousRectangleBorderUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T call({BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return only(side: side?.toDto(), borderRadius: borderRadius?.toDto());
  }

  @override
  T only({BorderSideDto? side, BorderRadiusGeometryDto? borderRadius}) {
    return builder(
      ContinuousRectangleBorderDto(borderRadius: borderRadius, side: side),
    );
  }
}
