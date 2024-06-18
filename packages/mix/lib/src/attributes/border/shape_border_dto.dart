// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/material.dart';
import 'package:mix/annotations.dart';
import 'package:mix/mix.dart';

part 'shape_border_dto.g.dart';

@immutable
sealed class ShapeBorderDto<T extends ShapeBorder> extends Dto<T> {
  const ShapeBorderDto();

  static ShapeBorderDto? tryToMerge(ShapeBorderDto? a, ShapeBorderDto? b) {
    if (b == null) return a;
    if (a == null) return b;

    if (b is! OutlinedBorderDto || a is! OutlinedBorderDto) {
      // Not merge anything besides OutlinedBorderDto
      return b;
    }

    return OutlinedBorderDto.tryToMerge(a, b);
  }

  BorderRadiusGeometryDto? get _borderRadius;
  BorderSideDto? get _side =>
      this is OutlinedBorderDto ? (this as OutlinedBorderDto).side : null;

  BeveledRectangleBorderDto toBeveledRectangleBorder();
  RoundedRectangleBorderDto toRoundedRectangleBorder();
  ContinuousRectangleBorderDto toContinuousRectangleBorder();
  CircleBorderDto toCircleBorder();
  StadiumBorderDto toStadiumBorder();
  StarBorderDto toStarBorder();
  LinearBorderDto toLinearBorder();

  @override
  ShapeBorderDto<T> merge(covariant ShapeBorderDto<T>? other);

  @override
  T resolve(MixData mix);
}

@immutable
sealed class OutlinedBorderDto<T extends OutlinedBorder>
    extends ShapeBorderDto<T> {
  final BorderSideDto? side;

  const OutlinedBorderDto({this.side});

  static OutlinedBorderDto? tryToMerge(
    OutlinedBorderDto? a,
    OutlinedBorderDto? b,
  ) {
    if (b == null) return a;
    if (a == null) return b;

    return _exhaustiveMerge(a, b);
  }

  static OutlinedBorderDto _exhaustiveMerge(
    OutlinedBorderDto a,
    OutlinedBorderDto b,
  ) {
    if (a.runtimeType == b.runtimeType) return a.merge(b);

    switch (b.runtimeType) {
      case BeveledRectangleBorderDto:
        return a
            .toBeveledRectangleBorder()
            .merge(b as BeveledRectangleBorderDto);
      case RoundedRectangleBorderDto:
        return a
            .toRoundedRectangleBorder()
            .merge(b as RoundedRectangleBorderDto);
      case ContinuousRectangleBorderDto:
        return a
            .toContinuousRectangleBorder()
            .merge(b as ContinuousRectangleBorderDto);
      case CircleBorderDto:
        return a.toCircleBorder().merge(b as CircleBorderDto);
      case StadiumBorderDto:
        return a.toStadiumBorder().merge(b as StadiumBorderDto);
      case StarBorderDto:
        return a.toStarBorder().merge(b as StarBorderDto);
      case LinearBorderDto:
        return a.toLinearBorder().merge(b as LinearBorderDto);
      default:
        throw ArgumentError('Unknown OutlinedBorderDto type: ${b.runtimeType}');
    }
  }

  /// Tries to get borderRadius if available for [OutlineBorderDto]

  @override
  BeveledRectangleBorderDto toBeveledRectangleBorder() {
    if (this is BeveledRectangleBorderDto) {
      return this as BeveledRectangleBorderDto;
    }

    return BeveledRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  @override
  ContinuousRectangleBorderDto toContinuousRectangleBorder() {
    return ContinuousRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  @override
  RoundedRectangleBorderDto toRoundedRectangleBorder() {
    if (this is RoundedRectangleBorderDto) {
      return this as RoundedRectangleBorderDto;
    }

    return RoundedRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  @override
  CircleBorderDto toCircleBorder() {
    if (this is CircleBorderDto) return this as CircleBorderDto;

    return CircleBorderDto(side: _side);
  }

  @override
  StadiumBorderDto toStadiumBorder() {
    if (this is StadiumBorderDto) return this as StadiumBorderDto;

    return StadiumBorderDto(side: _side);
  }

  @override
  LinearBorderDto toLinearBorder() {
    if (this is LinearBorderDto) return this as LinearBorderDto;

    return LinearBorderDto(side: _side);
  }

  @override
  StarBorderDto toStarBorder() {
    if (this is StarBorderDto) return this as StarBorderDto;

    return StarBorderDto(side: _side);
  }

  @override
  OutlinedBorderDto<T> merge(covariant OutlinedBorderDto<T>? other);

  @override
  T resolve(MixData mix);
}

@MixableDto()
final class RoundedRectangleBorderDto
    extends OutlinedBorderDto<RoundedRectangleBorder>
    with _$RoundedRectangleBorderDto {
  @MixableField(dto: MixableFieldDto(type: BorderRadiusGeometryDto))
  final BorderRadiusGeometryDto? borderRadius;
  const RoundedRectangleBorderDto({this.borderRadius, super.side});
  @override
  BorderRadiusGeometryDto? get _borderRadius => borderRadius;
  @override
  RoundedRectangleBorder get defaultValue => const RoundedRectangleBorder();
}

@MixableDto()
final class BeveledRectangleBorderDto
    extends OutlinedBorderDto<BeveledRectangleBorder>
    with _$BeveledRectangleBorderDto {
  final BorderRadiusGeometryDto? borderRadius;
  const BeveledRectangleBorderDto({this.borderRadius, super.side});
  @override
  BorderRadiusGeometryDto? get _borderRadius => borderRadius;
  @override
  BeveledRectangleBorder get defaultValue => const BeveledRectangleBorder();
}

@MixableDto()
final class ContinuousRectangleBorderDto
    extends OutlinedBorderDto<ContinuousRectangleBorder>
    with _$ContinuousRectangleBorderDto {
  final BorderRadiusGeometryDto? borderRadius;
  const ContinuousRectangleBorderDto({this.borderRadius, super.side});

  @override
  BorderRadiusGeometryDto? get _borderRadius => borderRadius;

  @override
  ContinuousRectangleBorder get defaultValue =>
      const ContinuousRectangleBorder();
}

@MixableDto()
final class CircleBorderDto extends OutlinedBorderDto<CircleBorder>
    with _$CircleBorderDto {
  final double? eccentricity;

  const CircleBorderDto({super.side, this.eccentricity});
  @override
  BorderRadiusGeometryDto? get _borderRadius => null;
  @override
  CircleBorder get defaultValue => const CircleBorder();
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

  const StarBorderDto({
    super.side,
    this.points,
    this.innerRadiusRatio,
    this.pointRounding,
    this.valleyRounding,
    this.rotation,
    this.squash,
  });
  @override
  BorderRadiusGeometryDto? get _borderRadius => null;
  @override
  StarBorder get defaultValue => const StarBorder();
}

@MixableDto()
final class LinearBorderDto extends OutlinedBorderDto<LinearBorder>
    with _$LinearBorderDto {
  final LinearBorderEdgeDto? start;
  final LinearBorderEdgeDto? end;
  final LinearBorderEdgeDto? top;
  final LinearBorderEdgeDto? bottom;

  const LinearBorderDto({
    super.side,
    this.start,
    this.end,
    this.top,
    this.bottom,
  });
  @override
  BorderRadiusGeometryDto? get _borderRadius => null;
  @override
  LinearBorder get defaultValue => const LinearBorder();
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
  BorderRadiusGeometryDto? get _borderRadius => null;
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
