import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'border_radius_dto.dart';

/// Utility class for creating and manipulating attributes with [BorderRadiusGeometry]
///
/// Allows setting of radius for a border. This class provides a convenient way to configure and apply border radius to [T]
/// Accepts a builder function that returns [T] and takes a [BorderRadiusGeometryDto] as a parameter.
class BorderRadiusUtility<T extends Attribute>
    extends DtoUtility<T, BorderRadiusGeometryDto, BorderRadiusGeometry> {
  BorderRadiusUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  /// Returns a [RadiusUtility] to manipulate [Radius] for bottomLeft corner.
  RadiusUtility<T> get bottomLeft {
    return RadiusUtility((radius) => only(bottomLeft: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for bottomRight corner.
  RadiusUtility<T> get bottomRight {
    return RadiusUtility((radius) => only(bottomRight: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topLeft corner.
  RadiusUtility<T> get topLeft {
    return RadiusUtility((radius) => only(topLeft: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topRight corner.
  RadiusUtility<T> get topRight {
    return RadiusUtility((radius) => only(topRight: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for all corners.
  RadiusUtility<T> get all {
    return RadiusUtility((radius) => only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topLeft and topRight corner.
  RadiusUtility<T> get top {
    return RadiusUtility(
      (radius) => only(topLeft: radius, topRight: radius),
    );
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for bottomLeft and bottomRight corner.
  RadiusUtility<T> get bottom {
    return RadiusUtility(
      (radius) => only(bottomLeft: radius, bottomRight: radius),
    );
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topLeft and bottomLeft corner.
  RadiusUtility<T> get left {
    return RadiusUtility(
      (radius) => only(topLeft: radius, bottomLeft: radius),
    );
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topRight and bottomRight corner.
  RadiusUtility<T> get right {
    return RadiusUtility(
      (radius) => only(topRight: radius, bottomRight: radius),
    );
  }

  /// Sets a circular [Radius] for all corners.
  T circular(double radius) {
    return all.circular(radius);
  }

  /// Sets an elliptical [Radius] for all corners.
  T elliptical(double x, double y) {
    return all.elliptical(x, y);
  }

  /// Sets a zero [Radius] for all corners.
  T zero() {
    return all.zero();
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

    return only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  // Only specific corners
  @override
  T only({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return builder(
      BorderRadiusGeometryDto(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      ),
    );
  }
}

class BorderRadiusDirectionalUtility<T extends Attribute>
    extends DtoUtility<T, BorderRadiusGeometryDto, BorderRadiusGeometry> {
  BorderRadiusDirectionalUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  /// Returns a [RadiusUtility] to manipulate [Radius] for all corners.
  RadiusUtility<T> get all {
    return RadiusUtility((radius) => only(
          topStart: radius,
          topEnd: radius,
          bottomStart: radius,
          bottomEnd: radius,
        ));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topStart and topEnd corner.
  RadiusUtility<T> get top {
    return RadiusUtility((radius) => only(topStart: radius, topEnd: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for bottomStart and bottomEnd corner.
  RadiusUtility<T> get bottom {
    return RadiusUtility(
      (radius) => only(bottomStart: radius, bottomEnd: radius),
    );
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topStart and bottomStart corner.
  RadiusUtility<T> get start {
    return RadiusUtility(
      (radius) => only(topStart: radius, bottomStart: radius),
    );
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topEnd and bottomEnd corner.
  RadiusUtility<T> get end {
    return RadiusUtility(
      (radius) => only(topEnd: radius, bottomEnd: radius),
    );
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topStart corner.
  RadiusUtility<T> get topStart {
    return RadiusUtility((radius) => only(topStart: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for topEnd corner.
  RadiusUtility<T> get topEnd {
    return RadiusUtility((radius) => only(topEnd: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for bottomStart corner.
  RadiusUtility<T> get bottomStart {
    return RadiusUtility((radius) => only(bottomStart: radius));
  }

  /// Returns a [RadiusUtility] to manipulate [Radius] for bottomEnd corner.
  RadiusUtility<T> get bottomEnd {
    return RadiusUtility((radius) => only(bottomEnd: radius));
  }

  T circular(double radius) {
    return all.circular(radius);
  }

  T elliptical(double x, double y) {
    return all.elliptical(x, y);
  }

  T zero() {
    return all.zero();
  }

  T call(double p1, [double? p2, double? p3, double? p4]) {
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

    return builder(
      BorderRadiusGeometryDto(
        topStart: Radius.circular(topStart),
        topEnd: Radius.circular(topEnd),
        bottomStart: Radius.circular(bottomStart),
        bottomEnd: Radius.circular(bottomEnd),
      ),
    );
  }

  /// Creates a [BorderRadiusGeometryDto] with the specified radius values for each corner.
  ///
  /// The [topStart] parameter represents the radius of the top-left corner.
  /// The [topEnd] parameter represents the radius of the top-right corner.
  /// The [bottomStart] parameter represents the radius of the bottom-left corner.
  /// The [bottomEnd] parameter represents the radius of the bottom-right corner.
  ///
  /// Returns the created [T] object.
  @override
  T only({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    return builder(
      BorderRadiusGeometryDto(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      ),
    );
  }
}
