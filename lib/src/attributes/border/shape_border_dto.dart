import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../factory/mix_provider_data.dart';
import 'border_dto.dart';
import 'border_radius_dto.dart';

@immutable
abstract class ShapeBorderDto<Value extends ShapeBorder> extends Dto<Value> {
  const ShapeBorderDto();

  @override
  ShapeBorderDto<Value> merge(covariant ShapeBorderDto<Value>? other);

  @override
  Value resolve(MixData mix);
}

@immutable
abstract class OutlinedBorderDto<Value extends OutlinedBorder>
    extends ShapeBorderDto<Value> {
  final BorderSideDto? side;

  const OutlinedBorderDto({this.side});

  @override
  OutlinedBorderDto<Value> merge(covariant OutlinedBorderDto<Value>? other);

  @override
  Value resolve(MixData mix);

  @override
  get props => [side];
}

@immutable
abstract class BorderRadiusOutlinedBorderDto<Value extends OutlinedBorder>
    extends OutlinedBorderDto<Value> {
  final BorderRadiusGeometryDto? borderRadius;

  const BorderRadiusOutlinedBorderDto({this.borderRadius, super.side});

  @override
  BorderRadiusOutlinedBorderDto<Value> merge(
    covariant BorderRadiusOutlinedBorderDto<Value>? other,
  );

  @override
  get props => [borderRadius, side];
}

@immutable
class RoundedRectangleBorderDto
    extends BorderRadiusOutlinedBorderDto<RoundedRectangleBorder> {
  const RoundedRectangleBorderDto({super.borderRadius, super.side});

  @override
  RoundedRectangleBorderDto merge(RoundedRectangleBorderDto? other) {
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
}

@immutable
class CircleBorderDto extends OutlinedBorderDto<CircleBorder> {
  final double? eccentricity;

  const CircleBorderDto({super.side, this.eccentricity});

  @override
  CircleBorderDto merge(CircleBorderDto? other) {
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
    extends BorderRadiusOutlinedBorderDto<BeveledRectangleBorder> {
  const BeveledRectangleBorderDto({super.borderRadius, super.side});

  @override
  BeveledRectangleBorderDto merge(BeveledRectangleBorderDto? other) {
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
}

class ContinuousRectangleBorderDto
    extends BorderRadiusOutlinedBorderDto<ContinuousRectangleBorder> {
  const ContinuousRectangleBorderDto({super.borderRadius, super.side});

  @override
  ContinuousRectangleBorderDto merge(ContinuousRectangleBorderDto? other) {
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
}

class StadiumBorderDto extends OutlinedBorderDto<StadiumBorder> {
  const StadiumBorderDto({super.side});

  @override
  StadiumBorderDto merge(StadiumBorderDto? other) {
    if (other == null) return this;

    return StadiumBorderDto(side: side?.merge(other.side) ?? other.side);
  }

  @override
  StadiumBorder resolve(MixData mix) {
    return StadiumBorder(side: side?.resolve(mix) ?? BorderSide.none);
  }
}

/// Merges [ShapeBorderDto] instances based on their runtime types.
class ShapeBorderMergeDtoStrategy extends DtoMergeStrategy<ShapeBorderDto> {
  /// Creates a new instance with the given [a] and [b].
  const ShapeBorderMergeDtoStrategy(super.a, super.b);

  /// Merges two [ShapeBorderDto] instances.
  ///
  /// If both [a] and [b] are [OutlinedBorderDto], merges them using [_mergeOutlinedBorder].
  ///
  /// If [a] and [b] have incompatible types, logs a warning and returns [a] without merging.
  @override
  ShapeBorderDto mergeStrategy(ShapeBorderDto a, ShapeBorderDto b) {
    if (a is BorderRadiusOutlinedBorderDto &&
        b is BorderRadiusOutlinedBorderDto) {
      if (b is RoundedRectangleBorderDto) {
        return RoundedRectangleBorderDto(
          borderRadius: a.borderRadius,
          side: a.side,
        ).merge(b);
      }

      if (b is BeveledRectangleBorderDto) {
        return BeveledRectangleBorderDto(
          borderRadius: a.borderRadius,
          side: a.side,
        ).merge(b);
      }

      if (b is ContinuousRectangleBorderDto) {
        return ContinuousRectangleBorderDto(
          borderRadius: a.borderRadius,
          side: a.side,
        ).merge(b);
      }
    } else if (a is OutlinedBorderDto && b is OutlinedBorderDto) {
      if (b is CircleBorderDto) {
        // no need to add remainnig value as a is not a CircleBorderDto
        return CircleBorderDto(side: a.side).merge(b);
      } else if (b is StadiumBorderDto) {
        return StadiumBorderDto(side: a.side).merge(b);
      }
    }

    throw MergeStrategyException(a, b);
  }
}

extension RoundedRectangleBorderExt on RoundedRectangleBorder {
  RoundedRectangleBorderDto toDto() {
    return RoundedRectangleBorderDto(
      borderRadius: borderRadius.toDto(),
      side: side.toDto(),
    );
  }
}

extension BeveledRectangleBorderExt on BeveledRectangleBorder {
  BeveledRectangleBorderDto toDto() {
    return BeveledRectangleBorderDto(
      borderRadius: borderRadius.toDto(),
      side: side.toDto(),
    );
  }
}

extension ContinuousRectangleBorderExt on ContinuousRectangleBorder {
  ContinuousRectangleBorderDto toDto() {
    return ContinuousRectangleBorderDto(
      borderRadius: borderRadius.toDto(),
      side: side.toDto(),
    );
  }
}

extension CircleBorderExt on CircleBorder {
  CircleBorderDto toDto() {
    return CircleBorderDto(side: side.toDto(), eccentricity: eccentricity);
  }
}

extension StadiumBorderExt on StadiumBorder {
  StadiumBorderDto toDto() {
    return StadiumBorderDto(side: side.toDto());
  }
}

extension ShapeBorderExt on ShapeBorder {
  ShapeBorderDto toDto() {
    if (this is RoundedRectangleBorder) {
      return (this as RoundedRectangleBorder).toDto();
    } else if (this is BeveledRectangleBorder) {
      return (this as BeveledRectangleBorder).toDto();
    } else if (this is ContinuousRectangleBorder) {
      return (this as ContinuousRectangleBorder).toDto();
    } else if (this is CircleBorder) {
      return (this as CircleBorder).toDto();
    } else if (this is StadiumBorder) {
      return (this as StadiumBorder).toDto();
    }

    throw ArgumentError.value(
      this,
      'shapeBorder',
      'ShapeBorder type is not supported',
    );
  }
}
