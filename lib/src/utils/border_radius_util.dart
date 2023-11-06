import 'package:flutter/material.dart';

import '../attributes/border/border_radius_attribute.dart';

// Provides a constant for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusAttribute.all;

// Provides a constant for creating a uniform circular BorderRadiusAttribute for all corners.
const borderRadiusCircular = BorderRadiusAttribute.circular;

// Provides a constant for creating a vertical BorderRadiusAttribute with independent radii for top and bottom sides.
const borderRadiusVertical = BorderRadiusAttribute.vertical;

// Provides a constant for creating a horizontal BorderRadiusAttribute with independent radii for left and right sides.
const borderRadiusHorizontal = BorderRadiusAttribute.horizontal;

// Provides a constant for creating a BorderRadiusAttribute with zero radius, resulting in square corners.
const borderRadiusZero = BorderRadiusAttribute.zero;

// Provides a constructor for creating a BorderRadiusAttribute with custom radii for individual corners.
const borderRadiusOnly = BorderRadiusAttribute.new;

// Border Radius Directional Constants
// Provides a constant for creating a uniform BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectional = BorderRadiusDirectionalAttribute.all;

// Provides a constant for creating a uniform circular BorderRadiusDirectionalAttribute for all corners, considering text direction.
const borderRadiusDirectionalCircular =
    BorderRadiusDirectionalAttribute.circular;

// Provides a constant for creating a vertical BorderRadiusDirectionalAttribute with independent radii for top and bottom sides, considering text direction.
const borderRadiusDirectionalVertical =
    BorderRadiusDirectionalAttribute.vertical;

// Provides a constant for creating a horizontal BorderRadiusDirectionalAttribute with independent radii for start and end sides, considering text direction.
const borderRadiusDirectionalHorizontal =
    BorderRadiusDirectionalAttribute.horizontal;

// Provides a constructor for creating a BorderRadiusDirectionalAttribute with custom radii for individual corners, considering text direction.
const borderRadiusDirectionalOnly = BorderRadiusDirectionalAttribute.new;

// Aliases for quick access
// Alias for creating a uniform circular BorderRadiusAttribute.
const rounded = borderRadiusCircular;

// Alias for creating a uniform circular BorderRadiusDirectionalAttribute, considering text direction.
const roundedDirectional = borderRadiusDirectionalCircular;

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
