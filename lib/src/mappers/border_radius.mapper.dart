import 'package:flutter/material.dart';
import 'package:mix/src/mappers/class_properties.dart';

class BorderRadiusProps extends Properties<BorderRadius> {
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;

  const BorderRadiusProps._({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  const BorderRadiusProps.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  /// A border radius with all zero radii.
  static const BorderRadiusProps zero = BorderRadiusProps.all(0);

  const BorderRadiusProps.all(double radius)
      : this.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  Radius _createRadius(double? radii) {
    return radii == null ? Radius.zero : Radius.circular(radii);
  }

  @override
  BorderRadius create() {
    return BorderRadius.only(
      topLeft: _createRadius(topLeft),
      topRight: _createRadius(topRight),
      bottomLeft: _createRadius(bottomLeft),
      bottomRight: _createRadius(bottomRight),
    );
  }

  BorderRadiusProps merge(BorderRadiusProps? borderRadius) {
    if (borderRadius == null) return this;
    return copyWith(
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );
  }

  BorderRadiusProps copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadiusProps._(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderRadiusProps &&
        other.topLeft == topLeft &&
        other.topRight == topRight &&
        other.bottomLeft == bottomLeft &&
        other.bottomRight == bottomRight;
  }

  @override
  int get hashCode {
    return topLeft.hashCode ^
        topRight.hashCode ^
        bottomLeft.hashCode ^
        bottomRight.hashCode;
  }
}
