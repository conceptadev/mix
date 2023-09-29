import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'border_radius_geometry.dto.dart';
import 'radius_dto.dart';

class BorderRadiusDto extends BorderRadiusGeometryDto<BorderRadius> {
  /// A border radius with all zero radii.
  static const zero = BorderRadiusDto.all(RadiusDto.zero());

  final RadiusDto? _topLeft;
  final RadiusDto? _topRight;
  final RadiusDto? _bottomLeft;
  final RadiusDto? _bottomRight;

  const BorderRadiusDto.all(RadiusDto radius)
      : _topLeft = radius,
        _topRight = radius,
        _bottomLeft = radius,
        _bottomRight = radius;

  const BorderRadiusDto.vertical({RadiusDto? bottom, RadiusDto? top})
      : _bottomLeft = bottom,
        _bottomRight = bottom,
        _topLeft = top,
        _topRight = top;

  const BorderRadiusDto.horizontal({RadiusDto? left, RadiusDto? right})
      : _bottomLeft = left,
        _bottomRight = right,
        _topLeft = left,
        _topRight = right;

  const BorderRadiusDto.only({
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
    RadiusDto? topLeft,
    RadiusDto? topRight,
  })  : _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight;

  factory BorderRadiusDto.from(BorderRadius borderRadius) {
    return BorderRadiusDto.only(
      bottomLeft: RadiusDto.from(borderRadius.bottomLeft),
      bottomRight: RadiusDto.from(borderRadius.bottomRight),
      topLeft: RadiusDto.from(borderRadius.topLeft),
      topRight: RadiusDto.from(borderRadius.topRight),
    );
  }

  BorderRadiusDto copyWith({
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
    RadiusDto? topLeft,
    RadiusDto? topRight,
  }) {
    return BorderRadiusDto.only(
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
    );
  }

  @override
  BorderRadius resolve(MixData mix) {
    return BorderRadius.only(
      topLeft: topLeft?.resolve(mix) ?? Radius.zero,
      topRight: topRight?.resolve(mix) ?? Radius.zero,
      bottomLeft: bottomLeft?.resolve(mix) ?? Radius.zero,
      bottomRight: bottomRight?.resolve(mix) ?? Radius.zero,
    );
  }

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
  get props => [topLeft, topRight, bottomLeft, bottomRight];
}
