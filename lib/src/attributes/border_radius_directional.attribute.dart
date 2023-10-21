import 'package:flutter/material.dart';

import '../core/dto/radius.dto.dart';
import '../factory/exports.dart';
import 'border_radius_geometry.attribute.dart';

class BorderRadiusDirectionalAttribute
    extends BorderRadiusGeometryAttribute<BorderRadiusDirectional> {
  /// A border radius with all zero radii.
  ///
  /// Consider using [BorderRadius.zero] instead, since that object has the same
  /// effect, but will be cheaper to [resolve].
  static const zero = BorderRadiusDirectionalAttribute.all(RadiusDto.zero);

  final RadiusDto? topStart;
  final RadiusDto? topEnd;
  final RadiusDto? bottomStart;
  final RadiusDto? bottomEnd;

  const BorderRadiusDirectionalAttribute._({
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
  });

  /// Creates a border radius where all radii are [radius].
  const BorderRadiusDirectionalAttribute.all(RadiusDto radius)
      : bottomEnd = radius,
        bottomStart = radius,
        topEnd = radius,
        topStart = radius;

  /// Creates a border radius where all radii are [Radius.circular(radius)].
  BorderRadiusDirectionalAttribute.circular(double radius)
      : this.all(RadiusDto.circular(radius));

  /// Creates a vertically symmetric border radius where the top and bottom
  /// sides of the rectangle have the same radii.
  const BorderRadiusDirectionalAttribute.vertical({
    RadiusDto top = RadiusDto.zero,
    RadiusDto bottom = RadiusDto.zero,
  })  : bottomEnd = bottom,
        bottomStart = bottom,
        topEnd = top,
        topStart = top;

  /// Creates a horizontally symmetrical border radius where the start and end
  /// sides of the rectangle have the same radii.
  const BorderRadiusDirectionalAttribute.horizontal({
    RadiusDto start = RadiusDto.zero,
    RadiusDto end = RadiusDto.zero,
  })  : bottomEnd = end,
        bottomStart = start,
        topEnd = end,
        topStart = start;

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  const BorderRadiusDirectionalAttribute.only({
    this.topStart = RadiusDto.zero,
    this.topEnd = RadiusDto.zero,
    this.bottomStart = RadiusDto.zero,
    this.bottomEnd = RadiusDto.zero,
  });

  @override
  BorderRadiusDirectionalAttribute merge(
    BorderRadiusDirectionalAttribute? other,
  ) {
    if (other == null) return this;

    return BorderRadiusDirectionalAttribute._(
      topStart: topStart?.merge(other.topStart) ?? other.topStart,
      topEnd: topEnd?.merge(other.topEnd) ?? other.topEnd,
      bottomStart: bottomStart?.merge(other.bottomStart) ?? other.bottomStart,
      bottomEnd: bottomEnd?.merge(other.bottomEnd) ?? other.bottomEnd,
    );
  }

  @override
  BorderRadiusDirectional resolve(MixData mix) {
    return BorderRadiusDirectional.only(
      topStart: topStart?.resolve(mix) ?? Radius.zero,
      topEnd: topEnd?.resolve(mix) ?? Radius.zero,
      bottomStart: bottomStart?.resolve(mix) ?? Radius.zero,
      bottomEnd: bottomEnd?.resolve(mix) ?? Radius.zero,
    );
  }

  @override
  get props => [topStart, topEnd, bottomStart, bottomEnd];
}
