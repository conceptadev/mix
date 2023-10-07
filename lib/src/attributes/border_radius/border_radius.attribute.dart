import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../resolvable_attribute.dart';
import 'radius.dto.dart';

class BorderRadiusAttribute extends ResolvableAttribute<BorderRadiusGeometry> {
  final RadiusDto? _topLeft;
  final RadiusDto? _topRight;
  final RadiusDto? _bottomLeft;
  final RadiusDto? _bottomRight;
  final RadiusDto? _topStart;
  final RadiusDto? _topEnd;
  final RadiusDto? _bottomStart;
  final RadiusDto? _bottomEnd;

  const BorderRadiusAttribute._({
    RadiusDto? topLeft,
    RadiusDto? topRight,
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
    RadiusDto? topStart,
    RadiusDto? topEnd,
    RadiusDto? bottomStart,
    RadiusDto? bottomEnd,
  })  : _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight,
        _topStart = topStart,
        _topEnd = topEnd,
        _bottomStart = bottomStart,
        _bottomEnd = bottomEnd;

  factory BorderRadiusAttribute.circular(double radius) {
    return BorderRadiusAttribute.all(RadiusDto.circular(radius));
  }

  const BorderRadiusAttribute.vertical({RadiusDto? bottom, RadiusDto? top})
      : _topLeft = top,
        _topRight = top,
        _bottomLeft = bottom,
        _bottomRight = bottom,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  const BorderRadiusAttribute.horizontal({
    RadiusDto? left,
    RadiusDto? right,
  })  : _topLeft = left,
        _topRight = right,
        _bottomLeft = left,
        _bottomRight = right,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  const BorderRadiusAttribute.only({
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
    RadiusDto? topLeft,
    RadiusDto? topRight,
  })  : _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  const BorderRadiusAttribute.directionalOnly({
    RadiusDto? bottomStart,
    RadiusDto? bottomEnd,
    RadiusDto? topStart,
    RadiusDto? topEnd,
  })  : _topLeft = null,
        _topRight = null,
        _bottomLeft = null,
        _bottomRight = null,
        _topStart = topStart,
        _topEnd = topEnd,
        _bottomStart = bottomStart,
        _bottomEnd = bottomEnd;

  const BorderRadiusAttribute.all(RadiusDto radius)
      : _topLeft = radius,
        _topRight = radius,
        _bottomLeft = radius,
        _bottomRight = radius,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  factory BorderRadiusAttribute.from(BorderRadiusGeometry borderRadius) {
    if (borderRadius is BorderRadius) {
      return BorderRadiusAttribute.only(
        bottomLeft: RadiusDto.from(borderRadius.bottomLeft),
        bottomRight: RadiusDto.from(borderRadius.bottomRight),
        topLeft: RadiusDto.from(borderRadius.topLeft),
        topRight: RadiusDto.from(borderRadius.topRight),
      );
    }

    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusAttribute.directionalOnly(
        bottomStart: RadiusDto.from(borderRadius.bottomStart),
        bottomEnd: RadiusDto.from(borderRadius.bottomEnd),
        topStart: RadiusDto.from(borderRadius.topStart),
        topEnd: RadiusDto.from(borderRadius.topEnd),
      );
    }

    throw UnsupportedError(
      'Cannot create a border radius attribute from a border radius of type ${borderRadius.runtimeType}',
    );
  }

  @visibleForTesting
  RadiusDto? get topLeft => _topLeft;

  @visibleForTesting
  RadiusDto? get topRight => _topRight;

  @visibleForTesting
  RadiusDto? get bottomLeft => _bottomLeft;

  @visibleForTesting
  RadiusDto? get bottomRight => _bottomRight;

  @visibleForTesting
  RadiusDto? get topStart => _topStart;

  @visibleForTesting
  RadiusDto? get topEnd => _topEnd;

  @visibleForTesting
  RadiusDto? get bottomStart => _bottomStart;

  @visibleForTesting
  RadiusDto? get bottomEnd => _bottomEnd;

  bool get _isDirectional =>
      _topStart != null ||
      _topEnd != null ||
      _bottomStart != null ||
      _bottomEnd != null;

  @override
  BorderRadiusAttribute merge(BorderRadiusAttribute? other) {
    if (other == null) return this;

    if (_isDirectional != other._isDirectional) {
      throw UnsupportedError(
        'Cannot merge directional and non-directional border radiuses',
      );
    }

    return BorderRadiusAttribute._(
      topLeft: other._topLeft ?? _topLeft,
      topRight: other._topRight ?? _topRight,
      bottomLeft: other._bottomLeft ?? _bottomLeft,
      bottomRight: other._bottomRight ?? _bottomRight,
      topStart: other._topStart ?? _topStart,
      topEnd: other._topEnd ?? _topEnd,
      bottomStart: other._bottomStart ?? _bottomStart,
      bottomEnd: other._bottomEnd ?? _bottomEnd,
    );
  }

  @override
  BorderRadiusGeometry resolve(MixData mix) {
    return _isDirectional
        ? BorderRadiusDirectional.only(
            topStart: _topStart?.resolve(mix) ?? Radius.zero,
            topEnd: _topEnd?.resolve(mix) ?? Radius.zero,
            bottomStart: _bottomStart?.resolve(mix) ?? Radius.zero,
            bottomEnd: _bottomEnd?.resolve(mix) ?? Radius.zero,
          )
        : BorderRadius.only(
            topLeft: _topLeft?.resolve(mix) ?? Radius.zero,
            topRight: _topRight?.resolve(mix) ?? Radius.zero,
            bottomLeft: _bottomLeft?.resolve(mix) ?? Radius.zero,
            bottomRight: _bottomRight?.resolve(mix) ?? Radius.zero,
          );
  }

  @override
  get props => [
        _topLeft,
        _topRight,
        _bottomLeft,
        _bottomRight,
        _topStart,
        _topEnd,
        _bottomStart,
        _bottomEnd,
      ];
}
