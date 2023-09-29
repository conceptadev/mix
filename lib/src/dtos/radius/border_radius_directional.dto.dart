// ignore_for_file: no-equal-arguments

import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
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
      bottomEnd: RadiusDto.from(borderRadiusDirectional.bottomEnd),
      bottomStart: RadiusDto.from(borderRadiusDirectional.bottomStart),
      topEnd: RadiusDto.from(borderRadiusDirectional.topEnd),
      topStart: RadiusDto.from(borderRadiusDirectional.topStart),
    );
  }

  const BorderRadiusDirectionalDto.only({
    RadiusDto? bottomEnd,
    RadiusDto? bottomStart,
    RadiusDto? topEnd,
    RadiusDto? topStart,
  })  : _topStart = topStart,
        _topEnd = topEnd,
        _bottomStart = bottomStart,
        _bottomEnd = bottomEnd;

  const BorderRadiusDirectionalDto.all(RadiusDto radius)
      : this.only(
          bottomEnd: radius,
          bottomStart: radius,
          topEnd: radius,
          topStart: radius,
        );

  const BorderRadiusDirectionalDto.horizontal({
    RadiusDto? end,
    RadiusDto? start,
  }) : this.only(
          bottomEnd: end,
          bottomStart: start,
          topEnd: end,
          topStart: start,
        );

  const BorderRadiusDirectionalDto.vertical({
    RadiusDto? bottom,
    RadiusDto? top,
  }) : this.only(
          bottomEnd: bottom,
          bottomStart: bottom,
          topEnd: top,
          topStart: top,
        );

  static maybeFrom(BorderRadiusDirectional? borderRadiusDirectional) {
    if (borderRadiusDirectional == null) return null;

    return BorderRadiusDirectionalDto.from(borderRadiusDirectional);
  }

  BorderRadiusDirectionalDto copyWith({
    RadiusDto? bottomEnd,
    RadiusDto? bottomStart,
    RadiusDto? topEnd,
    RadiusDto? topStart,
  }) {
    return BorderRadiusDirectionalDto.only(
      bottomEnd: bottomEnd ?? this.bottomEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      topEnd: topEnd ?? this.topEnd,
      topStart: topStart ?? this.topStart,
    );
  }

  @override
  BorderRadiusDirectional resolve(MixData mix) {
    return BorderRadiusDirectional.only(
      topStart: topStart?.resolve(mix) ?? Radius.zero,
      topEnd: topEnd?.resolve(mix) ?? Radius.zero,
      bottomStart: bottomStart?.resolve(mix) ?? Radius.zero,
      bottomEnd: bottomEnd?.resolve(mix) ?? Radius.zero,
    );
  }

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
  List<Object?> get props => [topStart, topEnd, bottomStart, bottomEnd];
}
