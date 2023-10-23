import 'package:flutter/material.dart';

import '../core/dto/radius_dto.dart';
import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class BorderRadiusGeometryAttribute<T extends BorderRadiusGeometry>
    extends StyleAttribute<T> {
  const BorderRadiusGeometryAttribute();

  static BorderRadiusGeometryAttribute from(
    BorderRadiusGeometry borderRadius,
  ) {
    if (borderRadius is BorderRadius) {
      return BorderRadiusAttribute.only(
        topLeft: RadiusDto.from(borderRadius.topLeft),
        topRight: RadiusDto.from(borderRadius.topRight),
        bottomLeft: RadiusDto.from(borderRadius.bottomLeft),
        bottomRight: RadiusDto.from(borderRadius.bottomRight),
      );
    }

    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusDirectionalAttribute.only(
        topStart: RadiusDto.from(borderRadius.topStart),
        topEnd: RadiusDto.from(borderRadius.topEnd),
        bottomStart: RadiusDto.from(borderRadius.bottomStart),
        bottomEnd: RadiusDto.from(borderRadius.bottomEnd),
      );
    }

    throw UnsupportedError(
      'Cannot create a border radius attribute from a border radius of type ${borderRadius.runtimeType}',
    );
  }

  @override
  BorderRadiusGeometryAttribute<T> merge(
    covariant BorderRadiusGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);
}

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
  const BorderRadiusAttribute.vertical({RadiusDto? top, RadiusDto? bottom})
      : topLeft = top,
        topRight = top,
        bottomLeft = bottom,
        bottomRight = bottom;

  /// Creates a horizontally symmetrical border radius where the left and right
  /// sides of the rectangle have the same radii.
  const BorderRadiusAttribute.horizontal({RadiusDto? left, RadiusDto? right})
      : topLeft = left,
        topRight = right,
        bottomLeft = left,
        bottomRight = right;

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  const BorderRadiusAttribute.only({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
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
    RadiusDto? top,
    RadiusDto? bottom,
  })  : bottomEnd = bottom,
        bottomStart = bottom,
        topEnd = top,
        topStart = top;

  /// Creates a horizontally symmetrical border radius where the start and end
  /// sides of the rectangle have the same radii.
  const BorderRadiusDirectionalAttribute.horizontal({
    RadiusDto? start,
    RadiusDto? end,
  })  : bottomEnd = end,
        bottomStart = start,
        topEnd = end,
        topStart = start;

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  const BorderRadiusDirectionalAttribute.only({
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
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
