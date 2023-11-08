import 'package:flutter/material.dart';

import '../attributes/border/border_radius_attribute.dart';

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusAttribute.positional;

// Border Radius Directional
// Provides a utility BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectional = BorderRadiusDirectionalAttribute.positional;

// Provides an utility for creating a vertical BorderRadiusAttribute with independent radii for top and bottom sides.
const borderRadiusVertical = BorderRadiusAttribute.vertical;

// Provides an utility for creating a horizontal BorderRadiusAttribute with independent radii for left and right sides.
const borderRadiusHorizontal = BorderRadiusAttribute.horizontal;

// Provides an utility for creating a BorderRadiusAttribute with zero radius, resulting in square corners.
const borderRadiusOnly = BorderRadiusAttribute.new;

const borderRadiusDirectionalOnly = BorderRadiusDirectionalAttribute.new;

// Alias for creating a uniform circular BorderRadiusDirectionalAttribute.
BorderRadiusAttribute rounded(double p1, [double? p2, double? p3, double? p4]) {
  final r1 = Radius.circular(p1);
  Radius? r2 = p2 == null ? null : Radius.circular(p2);
  Radius? r3 = p3 == null ? null : Radius.circular(p3);
  Radius? r4 = p4 == null ? null : Radius.circular(p4);

  return BorderRadiusAttribute.positional(r1, r2, r3, r4);
}

BorderRadiusDirectionalAttribute roundedDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  final r1 = Radius.circular(p1);
  Radius? r2 = p2 == null ? null : Radius.circular(p2);
  Radius? r3 = p3 == null ? null : Radius.circular(p3);
  Radius? r4 = p4 == null ? null : Radius.circular(p4);

  return BorderRadiusDirectionalAttribute.positional(r1, r2, r3, r4);
}

// Corner-specific BorderRadiusAttributes
// Creates a BorderRadiusAttribute with a circular radius applied to the top-left corner.
BorderRadiusAttribute roundedTopLeft(double radius) {
  return BorderRadiusAttribute(topLeft: Radius.circular(radius));
}

// Creates a BorderRadiusAttribute with a circular radius applied to the top-right corner.
BorderRadiusAttribute roundedTopRight(double radius) {
  return BorderRadiusAttribute(topRight: Radius.circular(radius));
}

// Creates a BorderRadiusAttribute with a circular radius applied to the bottom-left corner.
BorderRadiusAttribute roundedBottomLeft(double radius) {
  return BorderRadiusAttribute(bottomLeft: Radius.circular(radius));
}

// Creates a BorderRadiusAttribute with a circular radius applied to the bottom-right corner.
BorderRadiusAttribute roundedBottomRight(double radius) {
  return BorderRadiusAttribute(bottomRight: Radius.circular(radius));
}

// Corner-specific BorderRadiusDirectionalAttributes
// Creates a BorderRadiusDirectionalAttribute with a circular radius applied to the top-start corner, considering text direction.
BorderRadiusDirectionalAttribute roundedTopStart(double radius) {
  return BorderRadiusDirectionalAttribute(topStart: Radius.circular(radius));
}

BorderRadiusAttribute roundedHorizontal({double? left, double? right}) {
  return BorderRadiusAttribute.horizontal(
    left: left == null ? null : Radius.circular(left),
    right: right == null ? null : Radius.circular(right),
  );
}

BorderRadiusAttribute roundedVertical({double? top, double? bottom}) {
  return BorderRadiusAttribute.vertical(
    top: top == null ? null : Radius.circular(top),
    bottom: bottom == null ? null : Radius.circular(bottom),
  );
}

// Creates a BorderRadiusDirectionalAttribute with a circular radius applied to the top-end corner, considering text direction.
BorderRadiusDirectionalAttribute roundedTopEnd(double radius) {
  return BorderRadiusDirectionalAttribute(topEnd: Radius.circular(radius));
}

// Creates a BorderRadiusDirectionalAttribute with a circular radius applied to the bottom-start corner, considering text direction.
BorderRadiusDirectionalAttribute roundedBottomStart(double radius) {
  return BorderRadiusDirectionalAttribute(bottomStart: Radius.circular(radius));
}

// Creates a BorderRadiusDirectionalAttribute with a circular radius applied to the bottom-end corner, considering text direction.
BorderRadiusDirectionalAttribute roundedBottomEnd(double radius) {
  return BorderRadiusDirectionalAttribute(bottomEnd: Radius.circular(radius));
}
