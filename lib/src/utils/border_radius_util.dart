import 'package:flutter/material.dart';

import '../attributes/border/border_radius_attribute.dart';
import '../helpers/extensions/values_ext.dart';

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusUtility();

// Border Radius Directional
// Provides a utility BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectional = BorderRadiusDirectionalUtility();

const rounded = RoundedUtility();

class BorderRadiusUtility {
  const BorderRadiusUtility();

  // zero
  BorderRadiusAttribute get zero {
    return all(Radius.zero);
  }

  BorderRadiusDirectionalUtility get _directional {
    return const BorderRadiusDirectionalUtility();
  }

  // Specific corners
  BorderRadiusAttribute bottomLeft(Radius radius) {
    return BorderRadiusAttribute(bottomLeft: radius);
  }

  BorderRadiusAttribute bottomRight(Radius radius) {
    return BorderRadiusAttribute(bottomRight: radius);
  }

  BorderRadiusAttribute topLeft(Radius radius) {
    return BorderRadiusAttribute(topLeft: radius);
  }

  BorderRadiusAttribute topRight(Radius radius) {
    return BorderRadiusAttribute(topRight: radius);
  }

  // Specific corners
  BorderRadiusDirectionalAttribute topStart(Radius radius) {
    return _directional.topStart(radius);
  }

  BorderRadiusDirectionalAttribute topEnd(Radius radius) {
    return _directional.topEnd(radius);
  }

  BorderRadiusDirectionalAttribute bottomStart(Radius radius) {
    return _directional.bottomStart(radius);
  }

  BorderRadiusDirectionalAttribute bottomEnd(Radius radius) {
    return _directional.bottomEnd(radius);
  }

  // Only method
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
  BorderRadiusAttribute vertical({Radius? top, Radius? bottom}) {
    return BorderRadiusAttribute(
      topLeft: top,
      topRight: top,
      bottomLeft: bottom,
      bottomRight: bottom,
    );
  }

  BorderRadiusAttribute horizontal({Radius? left, Radius? right}) {
    return BorderRadiusAttribute(
      topLeft: left,
      topRight: right,
      bottomLeft: left,
      bottomRight: right,
    );
  }

  // all
  BorderRadiusAttribute all(Radius radius) {
    return BorderRadiusAttribute(
      topLeft: radius,
      topRight: radius,
      bottomLeft: radius,
      bottomRight: radius,
    );
  }

  // circular
  BorderRadiusAttribute circular(double radius) {
    return all(Radius.circular(radius));
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

    return BorderRadiusAttribute(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}

class BorderRadiusDirectionalUtility {
  const BorderRadiusDirectionalUtility();

  // Specific corners
  BorderRadiusDirectionalAttribute topStart(Radius radius) {
    return BorderRadiusDirectionalAttribute(topStart: radius);
  }

  BorderRadiusDirectionalAttribute topEnd(Radius radius) {
    return BorderRadiusDirectionalAttribute(topEnd: radius);
  }

  BorderRadiusDirectionalAttribute bottomStart(Radius radius) {
    return BorderRadiusDirectionalAttribute(bottomStart: radius);
  }

  BorderRadiusDirectionalAttribute bottomEnd(Radius radius) {
    return BorderRadiusDirectionalAttribute(bottomEnd: radius);
  }

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
    return BorderRadiusDirectionalAttribute(
      topStart: top,
      topEnd: top,
      bottomStart: bottom,
      bottomEnd: bottom,
    );
  }

  BorderRadiusDirectionalAttribute horizontal({Radius? start, Radius? end}) {
    return BorderRadiusDirectionalAttribute(
      topStart: start,
      topEnd: end,
      bottomStart: start,
      bottomEnd: end,
    );
  }

  BorderRadiusDirectionalAttribute all(Radius radius) {
    return BorderRadiusDirectionalAttribute(
      topStart: radius,
      topEnd: radius,
      bottomStart: radius,
      bottomEnd: radius,
    );
  }

  BorderRadiusDirectionalAttribute circular(double radius) {
    return all(Radius.circular(radius));
  }

  BorderRadiusDirectionalAttribute zero() {
    return all(Radius.zero);
  }
}

class RoundedUtility {
  const RoundedUtility();

  BorderRadiusUtility get borderRadius => const BorderRadiusUtility();

  BorderRadiusDirectionalUtility get borderRadiusDirectional =>
      const BorderRadiusDirectionalUtility();

  // Specific corners
  BorderRadiusAttribute bottomLeft(double radius) {
    return borderRadius.bottomLeft(Radius.circular(radius));
  }

  BorderRadiusAttribute bottomRight(double radius) {
    return borderRadius.bottomRight(Radius.circular(radius));
  }

  BorderRadiusAttribute topLeft(double radius) {
    return borderRadius.topLeft(Radius.circular(radius));
  }

  BorderRadiusAttribute topRight(double radius) {
    return borderRadius.topRight(Radius.circular(radius));
  }

  // Specific corners
  BorderRadiusDirectionalAttribute topStart(double radius) {
    return borderRadius.topStart(Radius.circular(radius));
  }

  BorderRadiusDirectionalAttribute topEnd(double radius) {
    return borderRadius.topEnd(Radius.circular(radius));
  }

  BorderRadiusDirectionalAttribute bottomStart(double radius) {
    return borderRadius.bottomStart(Radius.circular(radius));
  }

  BorderRadiusDirectionalAttribute bottomEnd(double radius) {
    return borderRadius.bottomEnd(Radius.circular(radius));
  }

  // Only method
  BorderRadiusAttribute only({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return borderRadius.only(
      topLeft: topLeft?.toRadius(),
      topRight: topRight?.toRadius(),
      bottomLeft: bottomLeft?.toRadius(),
      bottomRight: bottomRight?.toRadius(),
    );
  }

  // Vertical and Horizontal
  BorderRadiusAttribute vertical({double? top, double? bottom}) {
    return borderRadius.vertical(
      top: top?.toRadius(),
      bottom: bottom?.toRadius(),
    );
  }

  BorderRadiusAttribute horizontal({double? left, double? right}) {
    return borderRadius.horizontal(
      left: left?.toRadius(),
      right: right?.toRadius(),
    );
  }

  // Positional
  BorderRadiusAttribute call(double p1, [double? p2, double? p3, double? p4]) {
    return borderRadius(
      p1.toRadius(),
      p2?.toRadius(),
      p3?.toRadius(),
      p4?.toRadius(),
    );
  }
}
