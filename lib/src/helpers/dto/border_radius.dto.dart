import 'package:flutter/material.dart';
import 'dto.dart';

class BorderRadiusDto extends Dto<BorderRadius> {
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;

  const BorderRadiusDto._({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  const BorderRadiusDto.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  /// A border radius with all zero radii.
  static const BorderRadiusDto zero = BorderRadiusDto.all(0);

  const BorderRadiusDto.all(double radius)
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
  BorderRadius resolve(BuildContext context) {
    return BorderRadius.only(
      topLeft: _createRadius(topLeft),
      topRight: _createRadius(topRight),
      bottomLeft: _createRadius(bottomLeft),
      bottomRight: _createRadius(bottomRight),
    );
  }

  BorderRadiusDto merge(BorderRadiusDto? other) {
    if (other == null || other == this) return this;

    return copyWith(
      topLeft: other.topLeft,
      topRight: other.topRight,
      bottomLeft: other.bottomLeft,
      bottomRight: other.bottomRight,
    );
  }

  BorderRadiusDto copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadiusDto._(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderRadiusDto &&
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
