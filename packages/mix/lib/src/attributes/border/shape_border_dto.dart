// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

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

  static ({
    BorderSideDto? side,
    BorderRadiusGeometryDto? borderRadius,
    BoxShape? boxShape,
  }) extract(ShapeBorderDto? dto) {
    return dto is OutlinedBorderDto
        ? (
            side: dto.side,
            borderRadius: dto._borderRadius,
            boxShape: dto._toBoxShape(),
          )
        : (side: null, borderRadius: null, boxShape: null);
  }

  BorderSideDto? get _side =>
      this is OutlinedBorderDto ? (this as OutlinedBorderDto).side : null;

  BeveledRectangleBorderDto toBeveled();
  RoundedRectangleBorderDto toRoundedRectangle();
  ContinuousRectangleBorderDto toContinuous();
  CircleBorderDto toCircle();
  StadiumBorderDto toStadiumBorder();
  StarBorderDto toStar();
  LinearBorderDto toLinear();
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

  static B _exhaustiveMerge<A extends OutlinedBorderDto,
      B extends OutlinedBorderDto>(A a, B b) {
    if (a.runtimeType == b.runtimeType) return a.merge(b) as B;

    return switch (b) {
      (BeveledRectangleBorderDto g) => a.toBeveled().merge(g) as B,
      (RoundedRectangleBorderDto g) => a.toRoundedRectangle().merge(g) as B,
      (ContinuousRectangleBorderDto g) => a.toContinuous().merge(g) as B,
      (CircleBorderDto g) => a.toCircle().merge(g) as B,
      (StadiumBorderDto g) => a.toStadiumBorder().merge(g) as B,
      (StarBorderDto g) => a.toStar().merge(g) as B,
      (LinearBorderDto g) => a.toLinear().merge(g) as B,
    };
  }

  BoxShape? _toBoxShape() {
    if (this is CircleBorderDto) {
      return BoxShape.circle;
    } else if (this is RoundedRectangleBorderDto) {
      return BoxShape.rectangle;
    }

    return null;
  }

  BorderRadiusGeometryDto? get _borderRadius;

  /// Tries to get borderRadius if available for [OutlineBorderDto]

  @override
  BeveledRectangleBorderDto toBeveled() {
    if (this is BeveledRectangleBorderDto) {
      return this as BeveledRectangleBorderDto;
    }

    return BeveledRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  @override
  ContinuousRectangleBorderDto toContinuous() {
    return ContinuousRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  @override
  RoundedRectangleBorderDto toRoundedRectangle() {
    if (this is RoundedRectangleBorderDto) {
      return this as RoundedRectangleBorderDto;
    }

    return RoundedRectangleBorderDto(
      borderRadius: _borderRadius,
      side: _side,
    );
  }

  @override
  CircleBorderDto toCircle() {
    if (this is CircleBorderDto) return this as CircleBorderDto;

    return CircleBorderDto(side: _side);
  }

  @override
  StadiumBorderDto toStadiumBorder() {
    if (this is StadiumBorderDto) return this as StadiumBorderDto;

    return StadiumBorderDto(side: _side);
  }

  @override
  LinearBorderDto toLinear() {
    if (this is LinearBorderDto) return this as LinearBorderDto;

    return LinearBorderDto(side: _side);
  }

  @override
  StarBorderDto toStar() {
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
  @MixableProperty(dto: MixableFieldDto(type: BorderRadiusGeometryDto))
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
    final self = this;
    if (self is BeveledRectangleBorder) return (self).toDto();
    if (self is CircleBorder) return (self).toDto();
    if (self is ContinuousRectangleBorder) return (self).toDto();
    if (self is LinearBorder) return (self).toDto();
    if (self is RoundedRectangleBorder) return (self).toDto();
    if (self is StadiumBorder) return (self).toDto();
    if (self is StarBorder) return (self).toDto();

    throw ArgumentError.value(
      this,
      'shapeBorder',
      'ShapeBorder type is not supported',
    );
  }
}

final class ShapeBorderUtility<T extends Attribute>
    extends MixUtility<T, ShapeBorderDto> {
  late final beveledRectangle = BeveledRectangleBorderUtility(build);

  late final circle = CircleBorderUtility(build);

  late final continuousRectangle = ContinuousRectangleBorderUtility(build);

  late final linear = LinearBorderUtility(build);

  late final roundedRectangle = RoundedRectangleBorderUtility(build);

  late final stadium = StadiumBorderUtility(build);

  late final star = StarBorderUtility(build);

  ShapeBorderUtility(super.build);
}
