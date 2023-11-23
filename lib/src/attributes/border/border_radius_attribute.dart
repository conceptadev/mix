// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';

@immutable
abstract class BorderRadiusGeometryAttribute<T extends BorderRadiusGeometry>
    extends ResolvableAttribute<T> {
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

  // Directional values
  final Radius? topStart;
  final Radius? topEnd;
  final Radius? bottomStart;
  final Radius? bottomEnd;

  const BorderRadiusGeometryAttribute({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
  });

  @override
  get props => [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
        topStart,
        topEnd,
        bottomStart,
        bottomEnd,
      ];
}

@immutable
class BorderRadiusAttribute
    extends BorderRadiusGeometryAttribute<BorderRadius> {
  const BorderRadiusAttribute({
    super.topLeft,
    super.topRight,
    super.bottomLeft,
    super.bottomRight,
  });

  const BorderRadiusAttribute.zero() : this.all(Radius.zero);

  const BorderRadiusAttribute.all(Radius radius)
      : super(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  const BorderRadiusAttribute.horizontal({Radius? left, Radius? right})
      : super(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  const BorderRadiusAttribute.vertical({Radius? top, Radius? bottom})
      : super(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  // circular
  BorderRadiusAttribute.circular(double radius)
      : this.all(Radius.circular(radius));

  @override
  BorderRadiusAttribute merge(BorderRadiusAttribute? other) {
    if (other == null) return this;

    return BorderRadiusAttribute(
      topLeft: other.topLeft ?? topLeft,
      topRight: other.topRight ?? topRight,
      bottomLeft: other.bottomLeft ?? bottomLeft,
      bottomRight: other.bottomRight ?? bottomRight,
    );
  }

  @override
  BorderRadius resolve(MixData mix) {
    return BorderRadius.only(
      topLeft: topLeft ?? Radius.zero,
      topRight: topRight ?? Radius.zero,
      bottomLeft: bottomLeft ?? Radius.zero,
      bottomRight: bottomRight ?? Radius.zero,
    );
  }
}

@immutable
class BorderRadiusDirectionalAttribute
    extends BorderRadiusGeometryAttribute<BorderRadiusDirectional> {
  const BorderRadiusDirectionalAttribute({
    super.topStart,
    super.topEnd,
    super.bottomStart,
    super.bottomEnd,
  });

  BorderRadiusDirectionalAttribute.circular(double radius)
      : this.all(Radius.circular(radius));

  const BorderRadiusDirectionalAttribute.zero() : this.all(Radius.zero);

  const BorderRadiusDirectionalAttribute.all(Radius radius)
      : super(
          topStart: radius,
          topEnd: radius,
          bottomStart: radius,
          bottomEnd: radius,
        );

  const BorderRadiusDirectionalAttribute.horizontal({
    Radius? start,
    Radius? end,
  }) : super(
          topStart: start,
          topEnd: end,
          bottomStart: start,
          bottomEnd: end,
        );

  const BorderRadiusDirectionalAttribute.vertical({Radius? top, Radius? bottom})
      : super(
          topStart: top,
          topEnd: top,
          bottomStart: bottom,
          bottomEnd: bottom,
        );

  @override
  BorderRadiusDirectionalAttribute merge(
    BorderRadiusDirectionalAttribute? other,
  ) {
    if (other == null) return this;

    return BorderRadiusDirectionalAttribute(
      topStart: other.topStart ?? topStart,
      topEnd: other.topEnd ?? topEnd,
      bottomStart: other.bottomStart ?? bottomStart,
      bottomEnd: other.bottomEnd ?? bottomEnd,
    );
  }

  @override
  BorderRadiusDirectional resolve(MixData mix) {
    return BorderRadiusDirectional.only(
      topStart: topStart ?? Radius.zero,
      topEnd: topEnd ?? Radius.zero,
      bottomStart: bottomStart ?? Radius.zero,
      bottomEnd: bottomEnd ?? Radius.zero,
    );
  }
}
