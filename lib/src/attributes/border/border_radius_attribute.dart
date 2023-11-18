import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

@immutable
abstract class BorderRadiusGeometryAttribute<T extends BorderRadiusGeometry>
    extends VisualAttribute<T> {
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
  BorderRadiusGeometryAttribute<T> merge(
    covariant BorderRadiusGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);

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

  factory BorderRadiusAttribute.positional(
    Radius p1, [
    Radius? p2,
    Radius? p3,
    Radius? p4,
  ]) {
    Radius topLeft = p1;
    Radius topRight = p1;
    Radius bottomLeft = p1;
    Radius bottomRight = p1;

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

    return BorderRadiusAttribute(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }

  const BorderRadiusAttribute.vertical({Radius? top, Radius? bottom})
      : super(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  @override
  BorderRadiusAttribute merge(BorderRadiusGeometryAttribute? other) {
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

  factory BorderRadiusDirectionalAttribute.positional(
    Radius p1, [
    Radius? p2,
    Radius? p3,
    Radius? p4,
  ]) {
    Radius topStart = p1;
    Radius topEnd = p1;
    Radius bottomStart = p1;
    Radius bottomEnd = p1;

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

    return BorderRadiusDirectionalAttribute(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }

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

  const BorderRadiusDirectionalAttribute.vertical({
    Radius? top,
    Radius? bottom,
  }) : super(
          topStart: top,
          topEnd: top,
          bottomStart: bottom,
          bottomEnd: bottom,
        );

  @override
  BorderRadiusDirectionalAttribute merge(
    BorderRadiusGeometryAttribute<BorderRadiusDirectional>? other,
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
