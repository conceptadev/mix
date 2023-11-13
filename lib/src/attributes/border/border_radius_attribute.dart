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
