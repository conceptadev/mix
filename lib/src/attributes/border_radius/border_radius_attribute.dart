import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../resolvable_attribute.dart';
import 'radius_attribute.dart';

class BorderRadiusAttribute extends ResolvableAttribute<BorderRadiusGeometry> {
  final RadiusAttribute? _topLeft;
  final RadiusAttribute? _topRight;
  final RadiusAttribute? _bottomLeft;
  final RadiusAttribute? _bottomRight;
  final RadiusAttribute? _topStart;
  final RadiusAttribute? _topEnd;
  final RadiusAttribute? _bottomStart;
  final RadiusAttribute? _bottomEnd;

  const BorderRadiusAttribute._({
    RadiusAttribute? topLeft,
    RadiusAttribute? topRight,
    RadiusAttribute? bottomLeft,
    RadiusAttribute? bottomRight,
    RadiusAttribute? topStart,
    RadiusAttribute? topEnd,
    RadiusAttribute? bottomStart,
    RadiusAttribute? bottomEnd,
  })  : _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight,
        _topStart = topStart,
        _topEnd = topEnd,
        _bottomStart = bottomStart,
        _bottomEnd = bottomEnd;

  factory BorderRadiusAttribute.circular(double radius) {
    return BorderRadiusAttribute.all(RadiusAttribute.circular(radius));
  }

  const BorderRadiusAttribute.vertical({
    RadiusAttribute? bottom,
    RadiusAttribute? top,
  })  : _topLeft = top,
        _topRight = top,
        _bottomLeft = bottom,
        _bottomRight = bottom,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  const BorderRadiusAttribute.horizontal({
    RadiusAttribute? left,
    RadiusAttribute? right,
  })  : _topLeft = left,
        _topRight = right,
        _bottomLeft = left,
        _bottomRight = right,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  const BorderRadiusAttribute.only({
    RadiusAttribute? bottomLeft,
    RadiusAttribute? bottomRight,
    RadiusAttribute? topLeft,
    RadiusAttribute? topRight,
  })  : _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight,
        _topStart = null,
        _topEnd = null,
        _bottomStart = null,
        _bottomEnd = null;

  const BorderRadiusAttribute.directionalOnly({
    RadiusAttribute? bottomStart,
    RadiusAttribute? bottomEnd,
    RadiusAttribute? topStart,
    RadiusAttribute? topEnd,
  })  : _topLeft = null,
        _topRight = null,
        _bottomLeft = null,
        _bottomRight = null,
        _topStart = topStart,
        _topEnd = topEnd,
        _bottomStart = bottomStart,
        _bottomEnd = bottomEnd;

  const BorderRadiusAttribute.all(RadiusAttribute radius)
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
        bottomLeft: RadiusAttribute.from(borderRadius.bottomLeft),
        bottomRight: RadiusAttribute.from(borderRadius.bottomRight),
        topLeft: RadiusAttribute.from(borderRadius.topLeft),
        topRight: RadiusAttribute.from(borderRadius.topRight),
      );
    }

    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusAttribute.directionalOnly(
        bottomStart: RadiusAttribute.from(borderRadius.bottomStart),
        bottomEnd: RadiusAttribute.from(borderRadius.bottomEnd),
        topStart: RadiusAttribute.from(borderRadius.topStart),
        topEnd: RadiusAttribute.from(borderRadius.topEnd),
      );
    }

    throw UnsupportedError(
      'Cannot create a border radius attribute from a border radius of type ${borderRadius.runtimeType}',
    );
  }

  @visibleForTesting
  RadiusAttribute? get topLeft => _topLeft;

  @visibleForTesting
  RadiusAttribute? get topRight => _topRight;

  @visibleForTesting
  RadiusAttribute? get bottomLeft => _bottomLeft;

  @visibleForTesting
  RadiusAttribute? get bottomRight => _bottomRight;

  @visibleForTesting
  RadiusAttribute? get topStart => _topStart;

  @visibleForTesting
  RadiusAttribute? get topEnd => _topEnd;

  @visibleForTesting
  RadiusAttribute? get bottomStart => _bottomStart;

  @visibleForTesting
  RadiusAttribute? get bottomEnd => _bottomEnd;

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
