// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/material.dart';
import 'package:mix/annotations.dart';
import 'package:mix/mix.dart';

part 'shape_border_dto.g.dart';

@immutable
sealed class ShapeBorderDto<T extends ShapeBorder> extends Dto<T> {
  const ShapeBorderDto();

  S _exhaustiveMerge<F extends ShapeBorderDto, S extends ShapeBorderDto>(
    F a,
    S b,
  ) {
    if (a.runtimeType == b.runtimeType) return a.merge(b) as S;

    return switch (b) {
      (BeveledRectangleBorderDto g) =>
        g.toBeveledRectangleBorder().merge(g) as S,
      (RoundedRectangleBorderDto g) =>
        g.toRoundedRectangleBorder().merge(g) as S,
      (ContinuousRectangleBorderDto g) =>
        g.toContinuousRectangleBorder().merge(g) as S,
      (CircleBorderDto g) => g.toCircleBorder().merge(g) as S,
      (StadiumBorderDto g) => g.toStadiumBorder().merge(g) as S,
      (StarBorderDto g) => g.toStarBorder().merge(g) as S,
      (LinearBorderDto g) => g.toLinearBorder().merge(g) as S,
    };
  }

  BorderRadiusGeometryDto? get _borderRadius => this is _WithBorderRadius
      ? (this as _WithBorderRadius).borderRadius
      : null;

  BorderSideDto? get _side =>
      this is OutlinedBorderDto ? (this as OutlinedBorderDto).side : null;

  ShapeBorderDto tryToMerge(ShapeBorderDto? other) {
    if (other == null) return this;

    return runtimeType == other.runtimeType
        ? merge(other)
        : _exhaustiveMerge(this, other);
  }

  @override
  ShapeBorderDto merge(covariant ShapeBorderDto? other);

  @override
  T resolve(MixData mix);
}

mixin _WithBorderRadius<T extends OutlinedBorder> on OutlinedBorderDto<T> {
  BorderRadiusGeometryDto? get borderRadius;
}

@immutable
sealed class OutlinedBorderDto<Value extends OutlinedBorder>
    extends ShapeBorderDto<Value> {
  final BorderSideDto? side;

  const OutlinedBorderDto({this.side});

  /// Tries to get borderRadius if available for [OutlineBorderDto]

  BeveledRectangleBorderDto toBeveledRectangleBorder() {
    if (this is BeveledRectangleBorderDto) {
      return this as BeveledRectangleBorderDto;
    }

    return BeveledRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  ContinuousRectangleBorderDto toContinuousRectangleBorder() {
    return ContinuousRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  RoundedRectangleBorderDto toRoundedRectangleBorder() {
    if (this is RoundedRectangleBorderDto) {
      return this as RoundedRectangleBorderDto;
    }

    return RoundedRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  CircleBorderDto toCircleBorder() {
    if (this is CircleBorderDto) return this as CircleBorderDto;

    return CircleBorderDto(side: _side);
  }

  StadiumBorderDto toStadiumBorder() {
    if (this is StadiumBorderDto) return this as StadiumBorderDto;

    return StadiumBorderDto(side: _side);
  }

  LinearBorderDto toLinearBorder() {
    if (this is LinearBorderDto) return this as LinearBorderDto;

    return LinearBorderDto(side: _side);
  }

  StarBorderDto toStarBorder() {
    if (this is StarBorderDto) return this as StarBorderDto;

    return StarBorderDto(side: _side);
  }

  @override
  OutlinedBorderDto<Value> merge(covariant OutlinedBorderDto<Value>? other);

  @override
  Value resolve(MixData mix);
}

@MixableDto()
final class RoundedRectangleBorderDto
    extends OutlinedBorderDto<RoundedRectangleBorder>
    with _$RoundedRectangleBorderDto, _WithBorderRadius {
  @override
  RoundedRectangleBorder get defaultValue => const RoundedRectangleBorder();
  @MixableField(dto: MixableFieldDto(type: BorderRadiusGeometryDto))
  @override
  final BorderRadiusGeometryDto? borderRadius;
  const RoundedRectangleBorderDto({this.borderRadius, super.side});
}

@MixableDto()
final class BeveledRectangleBorderDto
    extends OutlinedBorderDto<BeveledRectangleBorder>
    with _$BeveledRectangleBorderDto, _WithBorderRadius {
  @override
  BeveledRectangleBorder get defaultValue => const BeveledRectangleBorder();
  @override
  final BorderRadiusGeometryDto? borderRadius;
  const BeveledRectangleBorderDto({this.borderRadius, super.side});
}

@MixableDto()
final class ContinuousRectangleBorderDto
    extends OutlinedBorderDto<ContinuousRectangleBorder>
    with _$ContinuousRectangleBorderDto, _WithBorderRadius {
  @override
  ContinuousRectangleBorder get defaultValue =>
      const ContinuousRectangleBorder();
  @override
  final BorderRadiusGeometryDto? borderRadius;
  const ContinuousRectangleBorderDto({this.borderRadius, super.side});
}

@MixableDto()
final class CircleBorderDto extends OutlinedBorderDto<CircleBorder>
    with _$CircleBorderDto {
  final double? eccentricity;

  @override
  CircleBorder get defaultValue => const CircleBorder();

  const CircleBorderDto({super.side, this.eccentricity});
}

@MixableDto()
final class StarBorderDto extends OutlinedBorderDto<StarBorder>
    with _$StarBorderDto {
  final double? points;
  final double? innerRadiusRatio;
  final double? pointRounding;
  final double? valleyRounding;
  final double? rotation;
  final double? squash;

  @override
  StarBorder get defaultValue => const StarBorder();

  const StarBorderDto({
    super.side,
    this.points,
    this.innerRadiusRatio,
    this.pointRounding,
    this.valleyRounding,
    this.rotation,
    this.squash,
  });
}

@MixableDto()
final class LinearBorderDto extends OutlinedBorderDto<LinearBorder>
    with _$LinearBorderDto {
  final LinearBorderEdgeDto? start;
  final LinearBorderEdgeDto? end;
  final LinearBorderEdgeDto? top;
  final LinearBorderEdgeDto? bottom;

  @override
  LinearBorder get defaultValue => const LinearBorder();

  const LinearBorderDto({
    super.side,
    this.start,
    this.end,
    this.top,
    this.bottom,
  });
}

@MixableDto()
final class LinearBorderEdgeDto extends Dto<LinearBorderEdge>
    with _$LinearBorderEdgeDto {
  final double? size;
  final double? alignment;

  const LinearBorderEdgeDto({this.size, this.alignment});

  @override
  LinearBorderEdge get defaultValue => const LinearBorderEdge();
}

@MixableDto()
final class StadiumBorderDto extends OutlinedBorderDto<StadiumBorder>
    with _$StadiumBorderDto {
  const StadiumBorderDto({super.side});

  @override
  StadiumBorder get defaultValue => const StadiumBorder();
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

final class ShapeBorderUtility<T extends Attribute>
    extends MixUtility<T, ShapeBorderDto> {
  late final roundedRectangle = RoundedRectangleBorderUtility(builder);

  late final circle = CircleBorderUtility(builder);

  late final beveledRectangle = BeveledRectangleBorderUtility(builder);

  late final stadium = StadiumBorderUtility(builder);

  late final continuousRectangle = ContinuousRectangleBorderUtility(builder);

  ShapeBorderUtility(super.builder);
}
