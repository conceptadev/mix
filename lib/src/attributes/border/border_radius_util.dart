// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../scalars/scalar_util.dart';
import 'border_radius_attribute.dart';

class BorderRadiusGeometryUtility<T extends StyleAttribute>
    extends MixUtility<T, BorderRadiusGeometryAttribute> {
  static const selfBuilder =
      BorderRadiusGeometryUtility(MixUtility.selfBuilder);
  const BorderRadiusGeometryUtility(super.builder);

  BorderRadiusDirectionalUtility<T> get directional {
    return BorderRadiusDirectionalUtility(builder);
  }

  /// Applied radius only to bottomLeft corner.
  RadiusUtility<T> get bottomLeft {
    return RadiusUtility((radius) => only(bottomLeft: radius));
  }

  /// Applied radius only to bottomRight corner.
  RadiusUtility<T> get bottomRight {
    return RadiusUtility((radius) => only(bottomRight: radius));
  }

  /// Applied radius only to topLeft corner.
  RadiusUtility<T> get topLeft {
    return RadiusUtility((radius) => only(topLeft: radius));
  }

  /// Applied radius only to topRight corner.
  RadiusUtility<T> get topRight {
    return RadiusUtility((radius) => only(topRight: radius));
  }

  /// Applies radius to all corners.
  RadiusUtility<T> get all {
    return RadiusUtility((radius) => only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ));
  }

  /// Applies radius to topRight and topLeft corners.
  RadiusUtility<T> get top {
    return RadiusUtility(
      (radius) => only(topLeft: radius, topRight: radius),
    );
  }

  /// Applies radius to bottomRight and bottomLeft corners.
  RadiusUtility<T> get bottom {
    return RadiusUtility(
      (radius) => only(bottomLeft: radius, bottomRight: radius),
    );
  }

  /// Applies radius to topLeft and bottomLeft corners.
  RadiusUtility<T> get left {
    return RadiusUtility(
      (radius) => only(topLeft: radius, bottomLeft: radius),
    );
  }

  /// Applies radius to topRight and bottomRight corners.
  RadiusUtility<T> get right {
    return RadiusUtility(
      (radius) => only(topRight: radius, bottomRight: radius),
    );
  }

  /// Applies a Radius.zero to all corners
  T zero() => all.zero();

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

    return builder(borderRadius);
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

    return builder(borderRadius);
  }
}

class BorderRadiusDirectionalUtility<T extends StyleAttribute>
    extends MixUtility<T, BorderRadiusDirectionalAttribute> {
  const BorderRadiusDirectionalUtility(super.builder);

  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomStart {
    return RadiusUtility((radius) => only(bottomStart: radius));
  }

  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomEnd {
    return RadiusUtility((radius) => only(bottomEnd: radius));
  }

  RadiusUtility<BorderRadiusDirectionalAttribute> get topStart {
    return RadiusUtility((radius) => only(topStart: radius));
  }

  RadiusUtility<BorderRadiusDirectionalAttribute> get topEnd {
    return RadiusUtility((radius) => only(topEnd: radius));
  }

  RadiusUtility<BorderRadiusDirectionalAttribute> get all {
    return RadiusUtility((radius) => only(
          topStart: radius,
          topEnd: radius,
          bottomStart: radius,
          bottomEnd: radius,
        ));
  }

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

  BorderRadiusDirectionalAttribute zero() => all.zero();
}
