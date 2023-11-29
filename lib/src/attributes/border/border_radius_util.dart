// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../scalars/scalar_util.dart';
import 'border_radius_attribute.dart';

class BorderRadiusGeometryUtility<T>
    extends MixUtility<T, BorderRadiusGeometryAttribute> {
  static const selfBuilder =
      BorderRadiusGeometryUtility(MixUtility.selfBuilder);
  const BorderRadiusGeometryUtility(super.builder);

  T _bottomLeft(Radius radius) => only(bottomLeft: radius);

  T _bottomRight(Radius radius) => only(bottomRight: radius);

  T _topLeft(Radius radius) => only(topLeft: radius);

  T _topRight(Radius radius) => only(topRight: radius);

  T _top(Radius radius) => only(topLeft: radius, topRight: radius);

  T _bottom(Radius radius) => only(bottomLeft: radius, bottomRight: radius);

  T _left(Radius radius) => only(topLeft: radius, bottomLeft: radius);

  T _right(Radius radius) => only(topRight: radius, bottomRight: radius);

  T _all(Radius radius) => only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      );

  T _directional(BorderRadiusDirectionalAttribute borderRadiusDirectional) {
    return as(borderRadiusDirectional);
  }

  BorderRadiusDirectionalUtility<T> get directional =>
      BorderRadiusDirectionalUtility(_directional);

  /// Applied radius only to bottomLeft corner.
  RadiusUtility<T> get bottomLeft => RadiusUtility(_bottomLeft);

  /// Applied radius only to bottomRight corner.
  RadiusUtility<T> get bottomRight => RadiusUtility(_bottomRight);

  /// Applied radius only to topLeft corner.
  RadiusUtility<T> get topLeft => RadiusUtility(_topLeft);

  /// Applied radius only to topRight corner.
  RadiusUtility<T> get topRight => RadiusUtility(_topRight);

  /// Applies radius to all corners.
  RadiusUtility<T> get all => RadiusUtility(_all);

  /// Applies radius to topRight and topLeft corners.
  RadiusUtility<T> get top => RadiusUtility(_top);

  /// Applies radius to bottomRight and bottomLeft corners.
  RadiusUtility<T> get bottom => RadiusUtility(_bottom);

  /// Applies radius to topLeft and bottomLeft corners.
  RadiusUtility<T> get left => RadiusUtility(_left);

  /// Applies radius to topRight and bottomRight corners.
  RadiusUtility<T> get right => RadiusUtility(_right);

  /// Applies a Radius.zero to all corners
  T zero() => _all(Radius.zero);

  // Only specific corners
  T only({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    final borderRadius = BorderRadiusAttribute.only(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );

    return as(borderRadius);
  }

  T call(double p1, [double? p2, double? p3, double? p4]) {
    double topLeft = p1;
    double topRight = p1;
    double bottomLeft = p1;
    double bottomRight = p1;

    if (p2 != null) {
      bottomRight = p2;
      bottomLeft = p2;
    }

    if (p3 != null) {
      topLeft = p1;
      topRight = p2!;
      bottomLeft = p2;
      bottomRight = p3;
    }

    if (p4 != null) {
      topLeft = p1;
      topRight = p2!;
      bottomLeft = p3!;
      bottomRight = p4;
    }

    final borderRadius = BorderRadiusAttribute.only(
      topLeft: topLeft.toRadius(),
      topRight: topRight.toRadius(),
      bottomLeft: bottomLeft.toRadius(),
      bottomRight: bottomRight.toRadius(),
    );

    return as(borderRadius);
  }
}

class BorderRadiusDirectionalUtility<T>
    extends MixUtility<T, BorderRadiusDirectionalAttribute> {
  const BorderRadiusDirectionalUtility(super.builder);

  BorderRadiusDirectionalAttribute _bottomStart(Radius radius) =>
      only(bottomStart: radius);

  BorderRadiusDirectionalAttribute _bottomEnd(Radius radius) =>
      only(bottomEnd: radius);

  BorderRadiusDirectionalAttribute _topStart(Radius radius) =>
      only(topStart: radius);

  BorderRadiusDirectionalAttribute _topEnd(Radius radius) =>
      only(topEnd: radius);

  BorderRadiusDirectionalAttribute _all(Radius radius) => only(
        topStart: radius,
        topEnd: radius,
        bottomStart: radius,
        bottomEnd: radius,
      );
  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomStart =>
      RadiusUtility(_bottomStart);
  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomEnd =>
      RadiusUtility(_bottomEnd);
  RadiusUtility<BorderRadiusDirectionalAttribute> get topStart =>
      RadiusUtility(_topStart);
  RadiusUtility<BorderRadiusDirectionalAttribute> get topEnd =>
      RadiusUtility(_topEnd);
  RadiusUtility<BorderRadiusDirectionalAttribute> get all =>
      RadiusUtility(_all);

  BorderRadiusDirectionalAttribute call(
    double p1, [
    double? p2,
    double? p3,
    double? p4,
  ]) {
    double topStart = p1;
    double topEnd = p1;
    double bottomStart = p1;
    double bottomEnd = p1;

    if (p2 != null) {
      bottomEnd = p2;
      bottomStart = p2;
    }

    if (p3 != null) {
      topStart = p1;
      topEnd = p2!;
      bottomStart = p2;
      bottomEnd = p3;
    }

    if (p4 != null) {
      topStart = p1;
      topEnd = p2!;
      bottomStart = p3!;
      bottomEnd = p4;
    }

    return BorderRadiusDirectionalAttribute.only(
      topStart: topStart.toRadius(),
      topEnd: topEnd.toRadius(),
      bottomStart: bottomStart.toRadius(),
      bottomEnd: bottomEnd.toRadius(),
    );
  }

  // Only specific corners
  BorderRadiusDirectionalAttribute only({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    return BorderRadiusDirectionalAttribute.only(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }

  BorderRadiusDirectionalAttribute zero() => _all(Radius.zero);
}
