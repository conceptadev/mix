import 'package:flutter/material.dart';

import 'dto.dart';

abstract class BorderRadiusGeometryDto<T extends BorderRadiusGeometry>
    extends Dto<T> {
  const BorderRadiusGeometryDto();

  double? get _topLeft;
  double? get _topRight;
  double? get _bottomLeft;
  double? get _bottomRight;
  double? get _topStart;
  double? get _topEnd;
  double? get _bottomStart;
  double? get _bottomEnd;

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
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;

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

  /// A border radius with all zero radii.
  static const BorderRadiusDto zero = BorderRadiusDto.all(0);

  const BorderRadiusDto.all(double radius)
      : this.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  const BorderRadiusDto.vertical({
    double? top,
    double? bottom,
  }) : this.only(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  const BorderRadiusDto.horizontal({
    double? left,
    double? right,
  }) : this.only(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  @override
  double? get _bottomEnd => null;

  @override
  double? get _bottomLeft => bottomLeft;

  @override
  double? get _bottomRight => bottomRight;

  @override
  double? get _bottomStart => null;

  @override
  double? get _topEnd => null;

  @override
  double? get _topLeft => topLeft;

  @override
  double? get _topRight => topRight;

  @override
  double? get _topStart => null;

  @override
  BorderRadius resolve(BuildContext context) {
    return BorderRadius.only(
      topLeft: _createRadius(topLeft),
      topRight: _createRadius(topRight),
      bottomLeft: _createRadius(bottomLeft),
      bottomRight: _createRadius(bottomRight),
    );
  }

  BorderRadiusDto copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
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
  final double? topStart;
  final double? topEnd;
  final double? bottomStart;
  final double? bottomEnd;

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

  const BorderRadiusDirectionalDto.all(double radius)
      : this.only(
          topStart: radius,
          topEnd: radius,
          bottomStart: radius,
          bottomEnd: radius,
        );

  const BorderRadiusDirectionalDto.horizontal({
    double? start,
    double? end,
  }) : this.only(
          topStart: start,
          topEnd: end,
          bottomStart: start,
          bottomEnd: end,
        );

  @override
  double? get _bottomEnd => bottomEnd;

  @override
  double? get _bottomLeft => null;

  @override
  double? get _bottomRight => null;

  @override
  double? get _bottomStart => bottomStart;

  @override
  double? get _topEnd => topEnd;

  @override
  double? get _topLeft => null;

  @override
  double? get _topRight => null;

  @override
  double? get _topStart => topStart;

  @override
  BorderRadiusDirectional resolve(BuildContext context) {
    return BorderRadiusDirectional.only(
      topStart: _createRadius(topStart),
      topEnd: _createRadius(topEnd),
      bottomStart: _createRadius(bottomStart),
      bottomEnd: _createRadius(bottomEnd),
    );
  }

  BorderRadiusDirectionalDto copyWith({
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
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

Radius _createRadius(double? radii) {
  return radii == null ? Radius.zero : Radius.circular(radii);
}
