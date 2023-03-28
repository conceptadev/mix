import 'package:flutter/material.dart';

import 'border_radius_geometry.dto.dart';
import 'radius_dto.dart';

class BorderRadiusDirectionalDto
    extends BorderRadiusGeometryDto<BorderRadiusDirectional> {
  final RadiusDto? _topStart;
  final RadiusDto? _topEnd;
  final RadiusDto? _bottomStart;
  final RadiusDto? _bottomEnd;

  factory BorderRadiusDirectionalDto.from(
    BorderRadiusDirectional borderRadiusDirectional,
  ) {
    return BorderRadiusDirectionalDto.only(
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

  const BorderRadiusDirectionalDto.only({
    RadiusDto? topStart,
    RadiusDto? topEnd,
    RadiusDto? bottomStart,
    RadiusDto? bottomEnd,
  })  : _topStart = topStart,
        _topEnd = topEnd,
        _bottomStart = bottomStart,
        _bottomEnd = bottomEnd;

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
  RadiusDto? get bottomEnd => _bottomEnd;

  @override
  RadiusDto? get bottomLeft => null;

  @override
  RadiusDto? get bottomRight => null;

  @override
  RadiusDto? get bottomStart => _bottomStart;

  @override
  RadiusDto? get topEnd => _topEnd;

  @override
  RadiusDto? get topLeft => null;

  @override
  RadiusDto? get topRight => null;

  @override
  RadiusDto? get topStart => _topStart;

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
    return BorderRadiusDirectionalDto.only(
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
