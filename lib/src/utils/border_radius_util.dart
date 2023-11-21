// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../../mix.dart';

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusUtility();

// Border Radius Directional
// Provides a utility BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectional = BorderRadiusDirectionalUtility();

class BorderRadiusUtility
    extends MixUtility<BorderRadiusGeometryAttribute, BorderRadiusGeometryDto> {
  const BorderRadiusUtility() : super(BorderRadiusGeometryAttribute.from);

  // Specific corners
  RadiusUtility get bottomLeft => RadiusUtility(_bottomLeft);
  RadiusUtility get bottomRight => RadiusUtility(_bottomRight);
  RadiusUtility get topLeft => RadiusUtility(_topLeft);
  RadiusUtility get topRight => RadiusUtility(_topRight);
  RadiusUtility get topStart => RadiusUtility(_topStart);

  RadiusUtility get all => RadiusUtility(_all);

  BorderRadiusDirectionalUtility get _directional {
    return const BorderRadiusDirectionalUtility();
  }

  BorderRadiusGeometryAttribute zero() => _all(Radius.zero);

  BorderRadiusGeometryAttribute only({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    final isDirectional = topStart != null ||
        topEnd != null ||
        bottomStart != null ||
        bottomEnd != null;
    final nonDirectional = topLeft != null ||
        topRight != null ||
        bottomLeft != null ||
        bottomRight != null;

    // Assert that can only have left right, params or start, and end params but not both
    // so can only have either topLeft, topRight, bottomLeft, bottomRight or topStart, topEnd, bottomStart, bottomEnd
    assert(
      isDirectional && nonDirectional,
      'Cannot have both directional and non-directional parameters',
    );

    BorderRadiusGeometryDto borderRadius;
    // ignore: prefer-conditional-expressions
    if (isDirectional) {
      borderRadius = BorderRadiusDirectionalDto(
        topStart: topStart,
        topEnd: topEnd,
        bottomStart: bottomStart,
        bottomEnd: bottomEnd,
      );
    } else {
      borderRadius = BorderRadiusDto(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );
    }

    return BorderRadiusGeometryAttribute.from(borderRadius);
  }

  // Vertical and Horizontal
  BorderRadiusAttribute vertical({double? top, double? bottom}) {
    final borderRadius = BorderRadiusDto.vertical(
      top: top?.toRadius(),
      bottom: bottom?.toRadius(),
    );

    return BorderRadiusAttribute(borderRadius);
  }

  BorderRadiusAttribute horizontal({double? left, double? right}) {
    final borderRadius = BorderRadiusDto.horizontal(
      left: left?.toRadius(),
      right: right?.toRadius(),
    );

    return BorderRadiusAttribute(borderRadius);
  }

  // Circular
  BorderRadiusAttribute circular(double radius) {
    final borderRadius = BorderRadiusDto.all(Radius.circular(radius));

    return BorderRadiusAttribute(borderRadius);
  }

  // Positional
  BorderRadiusAttribute call(Radius p1, [Radius? p2, Radius? p3, Radius? p4]) {
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

    final borderRadius = BorderRadiusDto(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );

    return BorderRadiusAttribute(borderRadius);
  }

  BorderRadiusGeometryAttribute _bottomLeft(Radius radius) =>
      only(bottomLeft: radius);

  BorderRadiusGeometryAttribute _bottomRight(Radius radius) =>
      only(bottomRight: radius);

  BorderRadiusGeometryAttribute _topLeft(Radius radius) =>
      only(topLeft: radius);

  BorderRadiusGeometryAttribute _topRight(Radius radius) =>
      only(topRight: radius);

  BorderRadiusGeometryAttribute _topStart(Radius radius) =>
      only(topStart: radius);

  BorderRadiusGeometryAttribute _all(Radius radius) => only(
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      );
}

class RadiusUtility extends MixUtility<BorderRadiusGeometryAttribute, Radius> {
  const RadiusUtility(super.builder);

  BorderRadiusGeometryAttribute zero() => builder(Radius.zero);

  BorderRadiusGeometryAttribute elliptical(double x, double y) =>
      builder(Radius.elliptical(x, y));

  BorderRadiusGeometryAttribute call(double radius) =>
      builder(Radius.circular(radius));
}

class BorderRadiusDirectionalUtility extends MixUtility<
    BorderRadiusDirectionalAttribute, BorderRadiusDirectionalDto> {
  const BorderRadiusDirectionalUtility()
      : super(BorderRadiusDirectionalAttribute.new);

  RadiusUtility get bottomStart => RadiusUtility(_bottomStart);
  RadiusUtility get bottomEnd => RadiusUtility(_bottomEnd);
  RadiusUtility get topStart => RadiusUtility(_topStart);
  RadiusUtility get topEnd => RadiusUtility(_topEnd);
  BorderRadiusDirectionalAttribute call(
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

    final borderRadius = BorderRadiusDirectionalDto(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  // Only specific corners
  BorderRadiusDirectionalAttribute only({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    final borderRadius = BorderRadiusDirectionalDto(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  // Vertical and Horizontal
  BorderRadiusDirectionalAttribute vertical({Radius? top, Radius? bottom}) {
    final borderRadius = BorderRadiusDirectionalDto.vertical(
      top: top,
      bottom: bottom,
    );

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  BorderRadiusDirectionalAttribute horizontal({Radius? start, Radius? end}) {
    final borderRadius = BorderRadiusDirectionalDto.horizontal(
      start: start,
      end: end,
    );

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  BorderRadiusDirectionalAttribute all(Radius radius) {
    final borderRadius = BorderRadiusDirectionalDto.all(radius);

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  BorderRadiusDirectionalAttribute circular(double radius) {
    final borderRadius =
        BorderRadiusDirectionalDto.all(Radius.circular(radius));

    return BorderRadiusDirectionalAttribute(borderRadius);
  }

  BorderRadiusDirectionalAttribute zero() {
    const borderRadius = BorderRadiusDirectionalDto.zero();

    return const BorderRadiusDirectionalAttribute(borderRadius);
  }

  BorderRadiusDirectionalAttribute _bottomStart(Radius radius) =>
      only(bottomStart: radius);

  BorderRadiusDirectionalAttribute _bottomEnd(Radius radius) =>
      only(bottomEnd: radius);

  BorderRadiusDirectionalAttribute _topStart(Radius radius) =>
      only(topStart: radius);

  BorderRadiusDirectionalAttribute _topEnd(Radius radius) =>
      only(topEnd: radius);

  BorderRadiusDirectionalAttribute _all(Radius radius) => only(
        topStart: radius,
        topEnd: radius,
        bottomStart: radius,
        bottomEnd: radius,
      );
}
