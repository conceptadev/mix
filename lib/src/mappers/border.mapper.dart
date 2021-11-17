import 'package:flutter/material.dart';

class BorderRadiusProps {
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

  Radius _getRadius(double? radii) {
    return radii == null ? Radius.zero : Radius.circular(radii);
  }

  BorderRadius toBorderRadius() {
    return BorderRadius.only(
      topLeft: _getRadius(topLeft),
      topRight: _getRadius(topRight),
      bottomLeft: _getRadius(bottomLeft),
      bottomRight: _getRadius(bottomRight),
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

class BorderSideProps {
  Color? color;
  double? width;
  BorderStyle? style;

  BorderSideProps({
    this.color,
    this.width,
    this.style,
  });

  BorderSideProps copyWith({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideProps(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
    );
  }

  BorderSideProps merge(BorderSideProps other) {
    return BorderSideProps(
      color: other.color ?? color,
      width: other.width ?? width,
      style: other.style ?? style,
    );
  }

  final BorderSide _default = const BorderSide();

  Border toBorder() {
    return Border.all(
      color: color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }

  BorderSide toBorderSide() {
    return BorderSide(
      color: color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }
}
