import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

@immutable
abstract class BorderRadiusGeometryDto<T extends BorderRadiusGeometry>
    extends Dto<T> {
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

  // Directional values
  final Radius? topStart;
  final Radius? topEnd;
  final Radius? bottomStart;
  final Radius? bottomEnd;

  const BorderRadiusGeometryDto({
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
class BorderRadiusDto extends BorderRadiusGeometryDto<BorderRadius>
    with Resolver<BorderRadius> {
  const BorderRadiusDto({
    super.topLeft,
    super.topRight,
    super.bottomLeft,
    super.bottomRight,
  });

  const BorderRadiusDto.zero() : this.all(Radius.zero);

  const BorderRadiusDto.all(Radius radius)
      : super(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  const BorderRadiusDto.horizontal({Radius? left, Radius? right})
      : super(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  factory BorderRadiusDto.positional(
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

    return BorderRadiusDto(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }

  const BorderRadiusDto.vertical({Radius? top, Radius? bottom})
      : super(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  @override
  BorderRadiusDto merge(BorderRadiusDto? other) {
    if (other == null) return this;

    return BorderRadiusDto(
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
class BorderRadiusDirectionalDto
    extends BorderRadiusGeometryDto<BorderRadiusDirectional> {
  const BorderRadiusDirectionalDto({
    super.topStart,
    super.topEnd,
    super.bottomStart,
    super.bottomEnd,
  });

  factory BorderRadiusDirectionalDto.positional(
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

    return BorderRadiusDirectionalDto(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }

  BorderRadiusDirectionalDto.circular(double radius)
      : this.all(Radius.circular(radius));

  const BorderRadiusDirectionalDto.zero() : this.all(Radius.zero);

  const BorderRadiusDirectionalDto.all(Radius radius)
      : super(
          topStart: radius,
          topEnd: radius,
          bottomStart: radius,
          bottomEnd: radius,
        );

  const BorderRadiusDirectionalDto.horizontal({
    Radius? start,
    Radius? end,
  }) : super(
          topStart: start,
          topEnd: end,
          bottomStart: start,
          bottomEnd: end,
        );

  const BorderRadiusDirectionalDto.vertical({
    Radius? top,
    Radius? bottom,
  }) : super(
          topStart: top,
          topEnd: top,
          bottomStart: bottom,
          bottomEnd: bottom,
        );

  @override
  BorderRadiusDirectionalDto merge(BorderRadiusDirectionalDto? other) {
    if (other == null) return this;

    return BorderRadiusDirectionalDto(
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

@immutable
abstract class BorderRadiusGeometryAttribute<
    T extends BorderRadiusGeometryDto<Value>,
    Value extends BorderRadiusGeometry> extends DtoStyleAttribute<T, Value> {
  const BorderRadiusGeometryAttribute(super.value);

  @override
  Value resolve(MixData mix) => value.resolve(mix);

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
}

@immutable
class BorderRadiusAttribute
    extends BorderRadiusGeometryAttribute<BorderRadiusDto, BorderRadius> {
  const BorderRadiusAttribute(super.value);

  @override
  BorderRadiusAttribute merge(BorderRadiusAttribute? other) {
    return other == null
        ? this
        : BorderRadiusAttribute(value.merge(other.value));
  }
}

@immutable
class BorderRadiusDirectionalAttribute extends BorderRadiusGeometryAttribute<
    BorderRadiusDirectionalDto, BorderRadiusDirectional> {
  const BorderRadiusDirectionalAttribute(super.value);

  @override
  BorderRadiusDirectionalAttribute merge(
      BorderRadiusDirectionalAttribute? other) {
    return other == null
        ? this
        : BorderRadiusDirectionalAttribute(value.merge(other.value));
  }
}
