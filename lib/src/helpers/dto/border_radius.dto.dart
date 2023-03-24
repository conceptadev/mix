import 'package:flutter/material.dart';

import 'dto.dart';
import 'radius_dto.dart';

abstract class BorderRadiusGeometryDto<T extends BorderRadiusGeometry>
    extends Dto<T> {
  const BorderRadiusGeometryDto();

  static from(BorderRadiusGeometry borderRadius) {
    if (borderRadius is BorderRadius) {
      return BorderRadiusDto.from(borderRadius);
    }
    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusDirectionalDto.from(borderRadius);
    }
    throw UnsupportedError(
      "${borderRadius.runtimeType} is not supported, use BorderRadius or BorderRadiusDirectional",
    );
  }

  static maybeFrom(BorderRadiusGeometry? borderRadius) {
    if (borderRadius == null) {
      return null;
    }

    return BorderRadiusGeometryDto.from(borderRadius);
  }

  RadiusDto? get _topLeft;
  RadiusDto? get _topRight;
  RadiusDto? get _bottomLeft;
  RadiusDto? get _bottomRight;
  RadiusDto? get _topStart;
  RadiusDto? get _topEnd;
  RadiusDto? get _bottomStart;
  RadiusDto? get _bottomEnd;

  bool get _isDirectional =>
      (_topStart != null ||
          _topEnd != null ||
          _bottomStart != null ||
          _bottomEnd != null) &&
      (_topLeft == null &&
          _topRight == null &&
          _bottomLeft == null &&
          _bottomRight == null);

  BorderRadiusGeometryDto merge(BorderRadiusGeometryDto? other) {
    if (other == null || other == this) return this;

    if (other is BorderRadiusDto) {
      return BorderRadiusDto._(
        topLeft: other.topLeft ?? _topLeft,
        topRight: other.topRight ?? _topRight,
        bottomLeft: other.bottomLeft ?? _bottomLeft,
        bottomRight: other.bottomRight ?? _bottomRight,
      );
    }

    if (other is BorderRadiusDirectionalDto) {
      return BorderRadiusDirectionalDto._(
        topStart: other.topStart ?? _topStart,
        topEnd: other.topEnd ?? _topEnd,
        bottomStart: other.bottomStart ?? _bottomStart,
        bottomEnd: other.bottomEnd ?? _bottomEnd,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is unsupported, use BorderRadiusDto or BorderRadiusDirectionalDto",
    );
  }
}

class BorderRadiusDto extends BorderRadiusGeometryDto<BorderRadius> {
  final RadiusDto? topLeft;
  final RadiusDto? topRight;
  final RadiusDto? bottomLeft;
  final RadiusDto? bottomRight;

  const BorderRadiusDto._({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  const BorderRadiusDto.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  factory BorderRadiusDto.from(BorderRadius borderRadius) {
    return BorderRadiusDto._(
      topLeft: RadiusDto.from(borderRadius.topLeft),
      topRight: RadiusDto.from(borderRadius.topRight),
      bottomLeft: RadiusDto.from(borderRadius.bottomLeft),
      bottomRight: RadiusDto.from(borderRadius.bottomRight),
    );
  }

  /// A border radius with all zero radii.
  static const BorderRadiusDto zero = BorderRadiusDto.all(RadiusDto.zero());

  const BorderRadiusDto.all(RadiusDto radius)
      : this.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  const BorderRadiusDto.vertical({
    RadiusDto? top,
    RadiusDto? bottom,
  }) : this.only(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  const BorderRadiusDto.horizontal({
    RadiusDto? left,
    RadiusDto? right,
  }) : this.only(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  @override
  RadiusDto? get _bottomEnd => null;

  @override
  RadiusDto? get _bottomLeft => bottomLeft;

  @override
  RadiusDto? get _bottomRight => bottomRight;

  @override
  RadiusDto? get _bottomStart => null;

  @override
  RadiusDto? get _topEnd => null;

  @override
  RadiusDto? get _topLeft => topLeft;

  @override
  RadiusDto? get _topRight => topRight;

  @override
  RadiusDto? get _topStart => null;

  @override
  BorderRadius resolve(BuildContext context) {
    return BorderRadius.only(
      topLeft: topLeft?.resolve(context) ?? Radius.zero,
      topRight: topRight?.resolve(context) ?? Radius.zero,
      bottomLeft: bottomLeft?.resolve(context) ?? Radius.zero,
      bottomRight: bottomRight?.resolve(context) ?? Radius.zero,
    );
  }

  BorderRadiusDto copyWith({
    RadiusDto? topLeft,
    RadiusDto? topRight,
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
  }) {
    return BorderRadiusDto._(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderRadiusDto &&
        other.topLeft == topLeft &&
        other.topRight == topRight &&
        other.bottomLeft == bottomLeft &&
        other.bottomRight == bottomRight;
  }

  @override
  int get hashCode {
    return topLeft.hashCode ^
        topRight.hashCode ^
        bottomLeft.hashCode ^
        bottomRight.hashCode;
  }
}

class BorderRadiusDirectionalDto
    extends BorderRadiusGeometryDto<BorderRadiusDirectional> {
  final RadiusDto? topStart;
  final RadiusDto? topEnd;
  final RadiusDto? bottomStart;
  final RadiusDto? bottomEnd;

  factory BorderRadiusDirectionalDto.from(
    BorderRadiusDirectional borderRadiusDirectional,
  ) {
    return BorderRadiusDirectionalDto._(
      topStart: RadiusDto.from(borderRadiusDirectional.topStart),
      topEnd: RadiusDto.from(borderRadiusDirectional.topEnd),
      bottomStart: RadiusDto.from(borderRadiusDirectional.bottomStart),
      bottomEnd: RadiusDto.from(borderRadiusDirectional.bottomEnd),
    );
  }

  static maybeFrom(BorderRadiusDirectional? borderRadiusDirectional) {
    if (borderRadiusDirectional == null) return null;

    return BorderRadiusDirectionalDto.from(borderRadiusDirectional);
  }

  const BorderRadiusDirectionalDto._({
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
  });

  const BorderRadiusDirectionalDto.only({
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
  });

  const BorderRadiusDirectionalDto.all(RadiusDto radius)
      : this.only(
          topStart: radius,
          topEnd: radius,
          bottomStart: radius,
          bottomEnd: radius,
        );

  const BorderRadiusDirectionalDto.horizontal({
    RadiusDto? start,
    RadiusDto? end,
  }) : this.only(
          topStart: start,
          topEnd: end,
          bottomStart: start,
          bottomEnd: end,
        );

  @override
  RadiusDto? get _bottomEnd => bottomEnd;

  @override
  RadiusDto? get _bottomLeft => null;

  @override
  RadiusDto? get _bottomRight => null;

  @override
  RadiusDto? get _bottomStart => bottomStart;

  @override
  RadiusDto? get _topEnd => topEnd;

  @override
  RadiusDto? get _topLeft => null;

  @override
  RadiusDto? get _topRight => null;

  @override
  RadiusDto? get _topStart => topStart;

  @override
  BorderRadiusDirectional resolve(BuildContext context) {
    return BorderRadiusDirectional.only(
      topStart: topStart?.resolve(context) ?? Radius.zero,
      topEnd: topEnd?.resolve(context) ?? Radius.zero,
      bottomStart: bottomStart?.resolve(context) ?? Radius.zero,
      bottomEnd: bottomEnd?.resolve(context) ?? Radius.zero,
    );
  }

  BorderRadiusDirectionalDto copyWith({
    RadiusDto? topStart,
    RadiusDto? topEnd,
    RadiusDto? bottomStart,
    RadiusDto? bottomEnd,
  }) {
    return BorderRadiusDirectionalDto._(
      topStart: topStart ?? this.topStart,
      topEnd: topEnd ?? this.topEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      bottomEnd: bottomEnd ?? this.bottomEnd,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderRadiusDirectionalDto &&
        other.topStart == topStart &&
        other.topEnd == topEnd &&
        other.bottomStart == bottomStart &&
        other.bottomEnd == bottomEnd;
  }

  @override
  int get hashCode {
    return topStart.hashCode ^
        topEnd.hashCode ^
        bottomStart.hashCode ^
        bottomEnd.hashCode;
  }
}
