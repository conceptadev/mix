import 'package:flutter/material.dart';

import 'double.dto.dart';
import 'dto.dart';

class BorderRadiusDto extends Dto<BorderRadius> {
  final DoubleDto? topLeft;
  final DoubleDto? topRight;
  final DoubleDto? bottomLeft;
  final DoubleDto? bottomRight;

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
  static const BorderRadiusDto zero = BorderRadiusDto.all(DoubleDto(0.0));

  const BorderRadiusDto.all(DoubleDto radius)
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
      topLeft: _createRadius(topLeft?.resolve(context)),
      topRight: _createRadius(topRight?.resolve(context)),
      bottomLeft: _createRadius(bottomLeft?.resolve(context)),
      bottomRight: _createRadius(bottomRight?.resolve(context)),
    );
  }

  BorderRadiusDto merge(BorderRadiusDto? other) {
    if (other == this) return this;

    return copyWith(
      topLeft: other?.topLeft ?? topLeft,
      topRight: other?.topRight ?? topRight,
      bottomLeft: other?.bottomLeft ?? bottomLeft,
      bottomRight: other?.bottomRight ?? bottomRight,
    );
  }

  BorderRadiusDto copyWith({
    DoubleDto? topLeft,
    DoubleDto? topRight,
    DoubleDto? bottomLeft,
    DoubleDto? bottomRight,
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
