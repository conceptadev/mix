import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'border_radius_dto.dart';

@immutable
class BorderRadiusGeometryAttribute extends DtoAttribute<
    BorderRadiusGeometryAttribute,
    BorderRadiusGeometryDto,
    BorderRadiusGeometry> {
  const BorderRadiusGeometryAttribute(super.value);

  static BorderRadiusGeometryAttribute from(
    BorderRadiusGeometry borderRadius,
  ) {
    return BorderRadiusGeometryAttribute(
      BorderRadiusGeometryDto.from(borderRadius),
    );
  }

  static BorderRadiusGeometryAttribute? maybeFrom(
    BorderRadiusGeometry? borderRadius,
  ) {
    return borderRadius == null ? null : from(borderRadius);
  }

  @visibleForTesting
  Radius? get topLeft => value.topLeft;

  @visibleForTesting
  Radius? get topRight => value.topRight;

  @visibleForTesting
  Radius? get bottomLeft => value.bottomLeft;

  @visibleForTesting
  Radius? get bottomRight => value.bottomRight;

  @visibleForTesting
  Radius? get topStart => value.topStart;

  @visibleForTesting
  Radius? get topEnd => value.topEnd;

  @visibleForTesting
  Radius? get bottomStart => value.bottomStart;

  @visibleForTesting
  Radius? get bottomEnd => value.bottomEnd;

  @override
  BorderRadiusGeometryAttribute merge(BorderRadiusGeometryAttribute? other) {
    return other == null
        ? this
        : BorderRadiusGeometryAttribute(value.merge(other.value));
  }

  @override
  BorderRadiusGeometry resolve(MixData mix) => value.resolve(mix);

  @override
  List<Object?> get props => [value];
}

class BorderRadiusAttribute extends BorderRadiusGeometryAttribute {
  const BorderRadiusAttribute(super.value);

  factory BorderRadiusAttribute.all(Radius radius) {
    return BorderRadiusAttribute(
      BorderRadiusGeometryDto(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
    );
  }

  factory BorderRadiusAttribute.only({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return BorderRadiusAttribute(
      BorderRadiusGeometryDto(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      ),
    );
  }

  factory BorderRadiusAttribute.horizontal({Radius? left, Radius? right}) {
    return BorderRadiusAttribute.only(
      topLeft: left,
      topRight: right,
      bottomLeft: left,
      bottomRight: right,
    );
  }

  factory BorderRadiusAttribute.vertical({Radius? top, Radius? bottom}) {
    return BorderRadiusAttribute.only(
      topLeft: top,
      topRight: top,
      bottomLeft: bottom,
      bottomRight: bottom,
    );
  }

  factory BorderRadiusAttribute.circular(double radius) {
    return BorderRadiusAttribute.all(Radius.circular(radius));
  }
}

class BorderRadiusDirectionalAttribute extends BorderRadiusGeometryAttribute {
  const BorderRadiusDirectionalAttribute.raw(super.value);

  factory BorderRadiusDirectionalAttribute.all(Radius radius) {
    return BorderRadiusDirectionalAttribute.raw(
      BorderRadiusGeometryDto(
        topStart: radius,
        topEnd: radius,
        bottomStart: radius,
        bottomEnd: radius,
      ),
    );
  }

  factory BorderRadiusDirectionalAttribute.only({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    return BorderRadiusDirectionalAttribute.raw(
      BorderRadiusGeometryDto(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      ),
    );
  }

  factory BorderRadiusDirectionalAttribute.horizontal({
    Radius? start,
    Radius? end,
  }) {
    return BorderRadiusDirectionalAttribute.only(
      topStart: start,
      topEnd: end,
      bottomStart: start,
      bottomEnd: end,
    );
  }

  factory BorderRadiusDirectionalAttribute.vertical({
    Radius? top,
    Radius? bottom,
  }) {
    return BorderRadiusDirectionalAttribute.only(
      topStart: top,
      topEnd: top,
      bottomStart: bottom,
      bottomEnd: bottom,
    );
  }

  factory BorderRadiusDirectionalAttribute.circular(double radius) {
    return BorderRadiusDirectionalAttribute.all(Radius.circular(radius));
  }
}
