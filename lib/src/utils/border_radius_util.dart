// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../attributes/border/border_radius_attribute.dart';
import '../helpers/extensions/values_ext.dart';

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusUtility();

// Border Radius Directional
// Provides a utility BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectional = BorderRadiusDirectionalUtility();

class BorderRadiusUtility {
  const BorderRadiusUtility();

  // Specific corners
  RadiusUtility<BorderRadiusAttribute> get bottomLeft =>
      RadiusUtility((value) => BorderRadiusAttribute(bottomLeft: value));

  RadiusUtility<BorderRadiusAttribute> get bottomRight =>
      RadiusUtility((value) => BorderRadiusAttribute(bottomRight: value));

  RadiusUtility<BorderRadiusAttribute> get topLeft =>
      RadiusUtility((value) => BorderRadiusAttribute(topLeft: value));
  RadiusUtility<BorderRadiusAttribute> get topRight =>
      RadiusUtility((value) => BorderRadiusAttribute(topRight: value));

  RadiusUtility<BorderRadiusDirectionalAttribute> get topStart =>
      _directional.topStart;
  RadiusUtility<BorderRadiusDirectionalAttribute> get topEnd =>
      _directional.topEnd;
  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomStart =>
      _directional.bottomStart;

  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomEnd =>
      _directional.bottomEnd;

  RadiusUtility<BorderRadiusAttribute> get all =>
      const RadiusUtility<BorderRadiusAttribute>(BorderRadiusAttribute.all);

  BorderRadiusDirectionalUtility get _directional {
    return const BorderRadiusDirectionalUtility();
  }

  BorderRadiusAttribute zero() => const BorderRadiusAttribute.zero();

  BorderRadiusAttribute only({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return BorderRadiusAttribute(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }

  // Vertical and Horizontal
  BorderRadiusAttribute vertical({double? top, double? bottom}) {
    return BorderRadiusAttribute.vertical(
      top: top?.toRadius(),
      bottom: bottom?.toRadius(),
    );
  }

  BorderRadiusAttribute horizontal({double? left, double? right}) {
    return BorderRadiusAttribute.horizontal(
      left: left?.toRadius(),
      right: right?.toRadius(),
    );
  }

  // Circular
  BorderRadiusAttribute circular(double radius) {
    return BorderRadiusAttribute.all(Radius.circular(radius));
  }

  // Positional
  BorderRadiusAttribute call(double p1, [double? p2, double? p3, double? p4]) {
    return BorderRadiusAttribute.positional(
      p1.toRadius(),
      p2?.toRadius(),
      p3?.toRadius(),
      p4?.toRadius(),
    );
  }
}

class RadiusUtility<T extends BorderRadiusGeometryAttribute> {
  final T Function(Radius value) fn;
  const RadiusUtility(this.fn);

  T zero() => fn(Radius.zero);

  T elliptical(double x, double y) => fn(Radius.elliptical(x, y));

  T call(double radius) => fn(Radius.circular(radius));
}

class BorderRadiusDirectionalUtility {
  const BorderRadiusDirectionalUtility();

  // Specific corners
  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomStart =>
      RadiusUtility(
          (value) => BorderRadiusDirectionalAttribute(bottomStart: value));

  RadiusUtility<BorderRadiusDirectionalAttribute> get bottomEnd =>
      RadiusUtility(
          (value) => BorderRadiusDirectionalAttribute(bottomEnd: value));

  RadiusUtility<BorderRadiusDirectionalAttribute> get topStart => RadiusUtility(
      (value) => BorderRadiusDirectionalAttribute(topStart: value));

  RadiusUtility<BorderRadiusDirectionalAttribute> get topEnd =>
      RadiusUtility((value) => BorderRadiusDirectionalAttribute(topEnd: value));

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

    return BorderRadiusDirectionalAttribute(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }

  // Only specific corners
  BorderRadiusDirectionalAttribute only({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    return BorderRadiusDirectionalAttribute(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }

  // Vertical and Horizontal
  BorderRadiusDirectionalAttribute vertical({Radius? top, Radius? bottom}) {
    return BorderRadiusDirectionalAttribute.vertical(
      top: top,
      bottom: bottom,
    );
  }

  BorderRadiusDirectionalAttribute horizontal({Radius? start, Radius? end}) {
    return BorderRadiusDirectionalAttribute.horizontal(
      start: start,
      end: end,
    );
  }

  BorderRadiusDirectionalAttribute all(Radius radius) {
    return BorderRadiusDirectionalAttribute.all(radius);
  }

  BorderRadiusDirectionalAttribute circular(double radius) {
    return BorderRadiusDirectionalAttribute.circular(radius);
  }

  BorderRadiusDirectionalAttribute zero() {
    return const BorderRadiusDirectionalAttribute.zero();
  }
}
