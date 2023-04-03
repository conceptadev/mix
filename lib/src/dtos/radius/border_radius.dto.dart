import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'border_radius_geometry.dto.dart';
import 'radius_dto.dart';

class BorderRadiusDto extends BorderRadiusGeometryDto<BorderRadius> {
  final RadiusDto? _topLeft;
  final RadiusDto? _topRight;
  final RadiusDto? _bottomLeft;
  final RadiusDto? _bottomRight;

  const BorderRadiusDto.only({
    RadiusDto? topLeft,
    RadiusDto? topRight,
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
  })  : _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight;

  factory BorderRadiusDto.from(BorderRadius borderRadius) {
    return BorderRadiusDto.only(
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
  RadiusDto? get bottomLeft => _bottomLeft;

  @override
  RadiusDto? get bottomRight => _bottomRight;

  @override
  RadiusDto? get topLeft => _topLeft;

  @override
  RadiusDto? get topRight => _topRight;

  @override
  RadiusDto? get bottomStart => null;

  @override
  RadiusDto? get bottomEnd => null;

  @override
  RadiusDto? get topEnd => null;

  @override
  RadiusDto? get topStart => null;

  @override
  BorderRadius resolve(MixData mix) {
    return BorderRadius.only(
      topLeft: topLeft?.resolve(mix) ?? Radius.zero,
      topRight: topRight?.resolve(mix) ?? Radius.zero,
      bottomLeft: bottomLeft?.resolve(mix) ?? Radius.zero,
      bottomRight: bottomRight?.resolve(mix) ?? Radius.zero,
    );
  }

  BorderRadiusDto copyWith({
    RadiusDto? topLeft,
    RadiusDto? topRight,
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
  }) {
    return BorderRadiusDto.only(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  @override
  get props => [topLeft, topRight, bottomLeft, bottomRight];
}
