// ignore_for_file: no-equal-arguments

import 'package:flutter/material.dart';

import '../core/dto/radius.dto.dart';
import '../factory/exports.dart';
import 'border_radius_geometry.attribute.dart';

class BorderRadiusAttribute
    extends BorderRadiusGeometryAttribute<BorderRadius> {
  final RadiusDto? topLeft;
  final RadiusDto? topRight;
  final RadiusDto? bottomLeft;
  final RadiusDto? bottomRight;

  const BorderRadiusAttribute._({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  factory BorderRadiusAttribute.from(BorderRadius borderRadius) {
    return BorderRadiusAttribute._(
      topLeft: RadiusDto.from(borderRadius.topLeft),
      topRight: RadiusDto.from(borderRadius.topRight),
      bottomLeft: RadiusDto.from(borderRadius.bottomLeft),
      bottomRight: RadiusDto.from(borderRadius.bottomRight),
    );
  }

  /// Creates a border radius where all radii are [radius].
  const BorderRadiusAttribute.all(RadiusDto radius)
      : topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius;

  /// Creates a border radius where all radii are [Radius.circular(radius)].
  BorderRadiusAttribute.circular(double radius)
      : this.all(RadiusDto.circular(radius));

  /// Creates a vertically symmetric border radius where the top and bottom
  /// sides of the rectangle have the same radii.
  const BorderRadiusAttribute.vertical({
    RadiusDto top = RadiusDto.zero,
    RadiusDto bottom = RadiusDto.zero,
  })  : topLeft = top,
        topRight = top,
        bottomLeft = bottom,
        bottomRight = bottom;

  /// Creates a horizontally symmetrical border radius where the left and right
  /// sides of the rectangle have the same radii.
  const BorderRadiusAttribute.horizontal({
    RadiusDto left = RadiusDto.zero,
    RadiusDto right = RadiusDto.zero,
  })  : topLeft = left,
        topRight = right,
        bottomLeft = left,
        bottomRight = right;

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  const BorderRadiusAttribute.only({
    this.topLeft = RadiusDto.zero,
    this.topRight = RadiusDto.zero,
    this.bottomLeft = RadiusDto.zero,
    this.bottomRight = RadiusDto.zero,
  });

  @override
  BorderRadiusAttribute merge(BorderRadiusAttribute? other) {
    if (other == null) return this;

    return BorderRadiusAttribute._(
      topLeft: topLeft?.merge(other.topLeft) ?? other.topLeft,
      topRight: topRight?.merge(other.topRight) ?? other.topRight,
      bottomLeft: bottomLeft?.merge(other.bottomLeft) ?? other.bottomLeft,
      bottomRight: bottomRight?.merge(other.bottomRight) ?? other.bottomRight,
    );
  }

  @override
  BorderRadius resolve(MixData mix) {
    return BorderRadius.only(
      topLeft: topLeft?.resolve(mix) ?? Radius.zero,
      topRight: topRight?.resolve(mix) ?? Radius.zero,
      bottomLeft: bottomLeft?.resolve(mix) ?? Radius.zero,
      bottomRight: bottomRight?.resolve(mix) ?? Radius.zero,
    );
  }

  @override
  get props => [topLeft, topRight, bottomLeft, bottomRight];
}
