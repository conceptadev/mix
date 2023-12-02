// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../scalars/scalar_util.dart';
import 'border_radius_attribute.dart';

/// Utility class for creating and manipulating attributes with [BorderRadiusGeometry]
///
/// Allows setting of radius for a border. This class provides a convenient way to configure and apply border radius to [T]
///
/// Accepts a builder function that returns [T] and takes a [BorderRadiusGeometryAttribute] as a parameter.
///
/// Example usage:
///
/// ```dart
/// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
/// final attribute = borderRadius(10.0);
/// ```
///
/// See also:
/// * [BorderRadiusGeometryAttribute], the attribute class for [BorderRadiusGeometry]
/// * [MixUtility], the utility class that [BorderRadiusGeometryUtility] extends
/// * [RadiusUtility], the utility class for manipulating [Radius]
/// * [RadiusAttribute], the attribute class for [Radius]
/// * [BorderRadiusDirectionalUtility], the utility class for manipulating [BorderRadiusDirectional]
class BorderRadiusGeometryUtility<T extends StyleAttribute>
    extends MixUtility<T, BorderRadiusGeometryAttribute> {
  static const selfBuilder =
      BorderRadiusGeometryUtility(MixUtility.selfBuilder);
  const BorderRadiusGeometryUtility(super.builder);

  /// Returns a [BorderRadiusDirectionalUtility] to manipulate [BorderRadiusDirectional].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.directional(10.0);
  /// ```
  ///
  /// See also:
  /// * [BorderRadiusDirectionalUtility], the utility class for manipulating [BorderRadiusDirectional]
  /// * [BorderRadiusDirectionalAttribute], the attribute class for [BorderRadiusDirectional]
  BorderRadiusDirectionalUtility<T> get directional {
    return BorderRadiusDirectionalUtility(builder);
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.circular(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get bottomLeft {
    return RadiusUtility((radius) => only(bottomLeft: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.circular(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get bottomRight {
    return RadiusUtility((radius) => only(bottomRight: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.circular(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get topLeft {
    return RadiusUtility((radius) => only(topLeft: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.circular(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get topRight {
    return RadiusUtility((radius) => only(topRight: radius));
  }

  /// Applies radius to all corners.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.all(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get all {
    return RadiusUtility((radius) => only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ));
  }

  /// Applies radius to topRight and topLeft corners.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.top(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get top {
    return RadiusUtility(
      (radius) => only(topLeft: radius, topRight: radius),
    );
  }

  /// Applies radius to bottomRight and bottomLeft corners.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.bottom(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get bottom {
    return RadiusUtility(
      (radius) => only(bottomLeft: radius, bottomRight: radius),
    );
  }

  /// Applies radius to topLeft and bottomLeft corners.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.left(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<T> get left {
    return RadiusUtility(
      (radius) => only(topLeft: radius, bottomLeft: radius),
    );
  }

  /// Applies radius to topRight and bottomRight corners.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusGeometryUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.right(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
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

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.bottomStart(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomStart {
    return RadiusUtility((radius) => only(bottomStart: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.bottomEnd(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomEnd {
    return RadiusUtility((radius) => only(bottomEnd: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.topStart(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<BorderRadiusDirectionalAttribute> get topStart {
    return RadiusUtility((radius) => only(topStart: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.topEnd(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
  RadiusUtility<BorderRadiusDirectionalAttribute> get topEnd {
    return RadiusUtility((radius) => only(topEnd: radius));
  }

  /// Applies radius to all corners.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderRadius = BorderRadiusDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = borderRadius.all(10.0);
  /// ```
  ///
  /// See also:
  /// * [RadiusUtility], the utility class for manipulating [Radius]
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
