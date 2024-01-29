import 'package:flutter/material.dart';

import '../../../mix.dart';

@immutable
abstract class ShapeBorderDto<Value extends ShapeBorder> extends Dto<Value>
    with Mergeable<ShapeBorderDto> {
  const ShapeBorderDto();

  static ShapeBorderDto from(ShapeBorder shapeBorder) {
    if (shapeBorder is RoundedRectangleBorder) {
      return RoundedRectangleBorderDto.from(shapeBorder);
    } else if (shapeBorder is CircleBorder) {
      return CircleBorderDto.from(shapeBorder);
    } else if (shapeBorder is BeveledRectangleBorder) {
      return BeveledRectangleBorderDto.from(shapeBorder);
    } else if (shapeBorder is ContinuousRectangleBorder) {
      return ContinuousRectangleBorderDto.from(shapeBorder);
    } else if (shapeBorder is StadiumBorder) {
      return StadiumBorderDto.from(shapeBorder);
    }

    throw ArgumentError.value(
      shapeBorder,
      'shapeBorder',
      'Unsupported ShapeBorder of type ${shapeBorder.runtimeType}',
    );
  }

  static ShapeBorderDto? maybeFrom(ShapeBorder? shapeBorder) {
    return shapeBorder == null ? null : from(shapeBorder);
  }

  ShapeBorderDto<Value> _merge(covariant ShapeBorderDto<Value>? other);

  @override
  ShapeBorderDto merge(covariant ShapeBorderDto? other) {
    if (other == null) return this;

    if (runtimeType == other.runtimeType) {
      return _merge(other as ShapeBorderDto<Value>);
    }

    // TODO: Submit warning here about merging different types of ShapeBorder.

    return other;
  }

  @override
  Value resolve(MixData mix);
}

@immutable
abstract class OutlinedBorderDto<Value extends OutlinedBorder>
    extends ShapeBorderDto<Value> {
  final BorderSideDto? side;

  const OutlinedBorderDto({this.side});

  static OutlinedBorderDto from(OutlinedBorder border) {
    if (border is RoundedRectangleBorder) {
      return RoundedRectangleBorderDto.from(border);
    } else if (border is CircleBorder) {
      return CircleBorderDto.from(border);
    } else if (border is BeveledRectangleBorder) {
      return BeveledRectangleBorderDto.from(border);
    } else if (border is ContinuousRectangleBorder) {
      return ContinuousRectangleBorderDto.from(border);
    } else if (border is StadiumBorder) {
      return StadiumBorderDto.from(border);
    }

    throw ArgumentError.value(
      border,
      'border',
      'Unsupported OutlinedBorder type',
    );
  }

  @override
  Value resolve(MixData mix);
}

@immutable
class RoundedRectangleBorderDto
    extends OutlinedBorderDto<RoundedRectangleBorder> {
  final BorderRadiusGeometryDto? borderRadius;

  const RoundedRectangleBorderDto({this.borderRadius, super.side});

  static RoundedRectangleBorderDto from(RoundedRectangleBorder border) {
    return RoundedRectangleBorderDto(
      borderRadius: BorderRadiusGeometryDto.from(border.borderRadius),
      side: BorderSideDto.from(border.side),
    );
  }

  @override
  RoundedRectangleBorderDto _merge(RoundedRectangleBorderDto? other) {
    if (other == null) return this;

    return RoundedRectangleBorderDto(
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      side: side?.merge(other.side) ?? other.side,
    );
  }

  @override
  RoundedRectangleBorder resolve(MixData mix) {
    return RoundedRectangleBorder(
      side: side?.resolve(mix) ?? BorderSide.none,
      borderRadius: borderRadius?.resolve(mix) ?? BorderRadius.zero,
    );
  }

  @override
  get props => [borderRadius, side];
}

@immutable
class CircleBorderDto extends OutlinedBorderDto<CircleBorder> {
  final double? eccentricity;

  const CircleBorderDto({super.side, this.eccentricity});

  static CircleBorderDto from(CircleBorder border) {
    return CircleBorderDto(
      side: BorderSideDto.from(border.side),
      eccentricity: border.eccentricity,
    );
  }

  @override
  CircleBorderDto _merge(CircleBorderDto? other) {
    if (other == null) return this;

    return CircleBorderDto(
      side: side?.merge(other.side) ?? other.side,
      eccentricity: other.eccentricity ?? eccentricity,
    );
  }

  @override
  CircleBorder resolve(MixData mix) {
    return CircleBorder(
      side: side?.resolve(mix) ?? BorderSide.none,
      eccentricity: eccentricity ?? 0.0,
    );
  }

  @override
  get props => [eccentricity, side];
}

@immutable
class BeveledRectangleBorderDto
    extends OutlinedBorderDto<BeveledRectangleBorder> {
  final BorderRadiusGeometryDto? borderRadius;

  const BeveledRectangleBorderDto({this.borderRadius, super.side});

  static BeveledRectangleBorderDto from(BeveledRectangleBorder border) {
    return BeveledRectangleBorderDto(
      borderRadius: BorderRadiusGeometryDto.from(border.borderRadius),
      side: BorderSideDto.from(border.side),
    );
  }

  @override
  BeveledRectangleBorderDto _merge(BeveledRectangleBorderDto? other) {
    if (other == null) return this;

    return BeveledRectangleBorderDto(
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      side: side?.merge(other.side) ?? other.side,
    );
  }

  @override
  BeveledRectangleBorder resolve(MixData mix) {
    return BeveledRectangleBorder(
      side: side?.resolve(mix) ?? BorderSide.none,
      borderRadius: borderRadius?.resolve(mix) ?? BorderRadius.zero,
    );
  }

  @override
  get props => [borderRadius, side];
}

class ContinuousRectangleBorderDto
    extends OutlinedBorderDto<ContinuousRectangleBorder> {
  final BorderRadiusGeometryDto? borderRadius;

  const ContinuousRectangleBorderDto({this.borderRadius, super.side});

  static ContinuousRectangleBorderDto from(ContinuousRectangleBorder border) {
    return ContinuousRectangleBorderDto(
      borderRadius: BorderRadiusGeometryDto.from(border.borderRadius),
      side: BorderSideDto.from(border.side),
    );
  }

  @override
  ContinuousRectangleBorderDto _merge(ContinuousRectangleBorderDto? other) {
    if (other == null) return this;

    return ContinuousRectangleBorderDto(
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      side: side?.merge(other.side) ?? other.side,
    );
  }

  @override
  ContinuousRectangleBorder resolve(MixData mix) {
    return ContinuousRectangleBorder(
      side: side?.resolve(mix) ?? BorderSide.none,
      borderRadius: borderRadius?.resolve(mix) ?? BorderRadius.zero,
    );
  }

  @override
  get props => [borderRadius, side];
}

class StadiumBorderDto extends OutlinedBorderDto<StadiumBorder> {
  const StadiumBorderDto({super.side});

  static StadiumBorderDto from(StadiumBorder border) {
    return StadiumBorderDto(side: BorderSideDto.from(border.side));
  }

  @override
  StadiumBorderDto _merge(StadiumBorderDto? other) {
    if (other == null) return this;

    return StadiumBorderDto(side: side?.merge(other.side) ?? other.side);
  }

  @override
  StadiumBorder resolve(MixData mix) {
    return StadiumBorder(side: side?.resolve(mix) ?? BorderSide.none);
  }

  @override
  get props => [side];
}
