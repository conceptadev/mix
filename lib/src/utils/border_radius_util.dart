// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../attributes/border/border_radius_attribute.dart';
import '../helpers/extensions/values_ext.dart';
import 'scalar_util.dart';

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusUtility();

// Border Radius Directional
// Provides a utility BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectional = BorderRadiusDirectionalUtility();

class BorderRadiusUtility
    extends MixUtility<BorderRadiusAttribute, BorderRadiusDto> {
  const BorderRadiusUtility() : super(BorderRadiusAttribute.new);

  /// Applied radius only to bottomLeft corner.
  RadiusUtility<BorderRadiusAttribute> get bottomLeft =>
      RadiusUtility(_bottomLeft);

  /// Applied radius only to bottomRight corner.
  RadiusUtility<BorderRadiusAttribute> get bottomRight =>
      RadiusUtility(_bottomRight);

  /// Applied radius only to topLeft corner.
  RadiusUtility<BorderRadiusAttribute> get topLeft => RadiusUtility(_topLeft);

  /// Applied radius only to topRight corner.
  RadiusUtility<BorderRadiusAttribute> get topRight => RadiusUtility(_topRight);

  /// Applies radius to all corners.
  RadiusUtility<BorderRadiusAttribute> get all => RadiusUtility(_all);

  /// Applies radius to topRight and topLeft corners.
  RadiusUtility<BorderRadiusAttribute> get top => RadiusUtility(_top);

  /// Applies radius to bottomRight and bottomLeft corners.
  RadiusUtility<BorderRadiusAttribute> get bottom => RadiusUtility(_bottom);

  /// Applies radius to topLeft and bottomLeft corners.
  RadiusUtility<BorderRadiusAttribute> get left => RadiusUtility(_left);

  /// Applies radius to topRight and bottomRight corners.
  RadiusUtility<BorderRadiusAttribute> get right => RadiusUtility(_right);

  /// Applies a Radius.zero to all corners
  BorderRadiusAttribute zero() => _all(Radius.zero);

  // Only specific corners
  BorderRadiusAttribute only({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    final borderRadius = BorderRadiusDto(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );

    return BorderRadiusAttribute(borderRadius);
  }

  BorderRadiusAttribute call(double p1, [double? p2, double? p3, double? p4]) {
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

    final borderRadius = BorderRadiusDto(
      topLeft: topLeft.toRadius(),
      topRight: topRight.toRadius(),
      bottomLeft: bottomLeft.toRadius(),
      bottomRight: bottomRight.toRadius(),
    );

    return BorderRadiusAttribute(borderRadius);
  }

  BorderRadiusAttribute _bottomLeft(Radius radius) => only(bottomLeft: radius);

  BorderRadiusAttribute _bottomRight(Radius radius) =>
      only(bottomRight: radius);

  BorderRadiusAttribute _topLeft(Radius radius) => only(topLeft: radius);

  BorderRadiusAttribute _topRight(Radius radius) => only(topRight: radius);

  BorderRadiusAttribute _top(Radius radius) => only(
        topLeft: radius,
        topRight: radius,
      );

  BorderRadiusAttribute _bottom(Radius radius) => only(
        bottomLeft: radius,
        bottomRight: radius,
      );

  BorderRadiusAttribute _left(Radius radius) => only(
        topLeft: radius,
        bottomLeft: radius,
      );

  BorderRadiusAttribute _right(Radius radius) => only(
        topRight: radius,
        bottomRight: radius,
      );

  BorderRadiusAttribute _all(Radius radius) => only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      );
}

class RadiusUtility<
    T extends BorderRadiusGeometryAttribute<BorderRadiusGeometryDto,
        BorderRadiusGeometry>> extends MixUtility<T, Radius> {
  const RadiusUtility(super.builder);

  T zero() => builder(Radius.zero);

  T elliptical(double x, double y) => builder(Radius.elliptical(x, y));

  T call(double radius) => builder(Radius.circular(radius));
}

class BorderRadiusDirectionalUtility extends MixUtility<
    BorderRadiusDirectionalAttribute, BorderRadiusDirectionalDto> {
  const BorderRadiusDirectionalUtility()
      : super(BorderRadiusDirectionalAttribute.new);

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

    final borderRadius = BorderRadiusDirectionalDto(
      topStart: topStart.toRadius(),
      topEnd: topEnd.toRadius(),
      bottomStart: bottomStart.toRadius(),
      bottomEnd: bottomEnd.toRadius(),
    );

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  // Only specific corners
  BorderRadiusDirectionalAttribute only({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    final borderRadius = BorderRadiusDirectionalDto(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  BorderRadiusDirectionalAttribute zero() => _all(Radius.zero);
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
}
