import 'package:flutter/material.dart';

import '../attributes/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';

// Import custom attributes for border styling.

/// Creates a [BorderRadiusGeometryAttribute] with the same radius value for all corners.
///
/// The [radius] parameter specifies the radius of the corners.

BorderRadiusGeometryAttribute borderRadius(Radius radius) {
  return BorderRadius.all(radius).toAttribute();
}

BorderRadiusGeometryAttribute borderRadiusDirectional(Radius radius) {
  return BorderRadiusDirectional.all(radius).toAttribute();
}

/// Convenience method to create a [BorderRadiusGeometryAttribute] with a circular radius.
///
/// The [radius] parameter specifies the circular radius to be applied to all corners.
/// The [isDirectional] flag can be set to true to apply radius respecting text direction.
BorderRadiusGeometryAttribute rounded(double radius) {
  return borderRadiusCircular(radius);
}

BorderRadiusGeometryAttribute roundedDirectional(double radius) {
  return borderRadiusDirectionalCircular(radius);
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied horizontally.
///
/// The horizontal radius applies to the left and right sides regardless of text direction.
/// The [radius] parameter specifies the circular radius to be applied to the left and right sides.
BorderRadiusGeometryAttribute roundedHorizontal({
  double left = 0.0,
  double right = 0.0,
}) {
  return borderRadiusHorizontal(
    left: Radius.circular(left),
    right: Radius.circular(right),
  );
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied vertically.
///
/// The vertical radius applies to the top and bottom sides regardless of text direction.
BorderRadiusGeometryAttribute roundedVertical({
  double top = 0.0,
  double bottom = 0.0,
}) {
  return borderRadiusVertical(
    top: Radius.circular(top),
    bottom: Radius.circular(bottom),
  );
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the top-left corner.
BorderRadiusGeometryAttribute roundedTopLeft(double radius) {
  return BorderRadius.only(topLeft: Radius.circular(radius)).toAttribute();
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the top-right corner.
BorderRadiusGeometryAttribute roundedTopRight(double radius) {
  return BorderRadiusGeometryAttribute(topRight: Radius.circular(radius));
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the bottom-left corner.
BorderRadiusGeometryAttribute roundedBottomLeft(double radius) {
  return BorderRadius.only(bottomLeft: Radius.circular(radius)).toAttribute();
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the bottom-right corner.
BorderRadiusGeometryAttribute roundedBottomRight(double radius) {
  return BorderRadius.only(bottomRight: Radius.circular(radius)).toAttribute();
}

// Directional options respect the text direction when applying the border radius.

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the top-start corner.
BorderRadiusGeometryAttribute roundedTopStart(double radius) {
  return BorderRadiusDirectional.only(topStart: Radius.circular(radius))
      .toAttribute();
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the top-end corner.
BorderRadiusGeometryAttribute roundedTopEnd(double radius) {
  return BorderRadiusDirectional.only(topEnd: Radius.circular(radius))
      .toAttribute();
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the bottom-start corner.
BorderRadiusGeometryAttribute roundedBottomStart(double radius) {
  return BorderRadiusDirectional.only(bottomStart: Radius.circular(radius))
      .toAttribute();
}

/// Creates a [BorderRadiusGeometryAttribute] with a circular radius applied to the bottom-end corner.
BorderRadiusGeometryAttribute roundedBottomEnd(double radius) {
  return BorderRadiusDirectional.only(bottomEnd: Radius.circular(radius))
      .toAttribute();
}

/// Creates a [BorderRadiusGeometryAttribute] representing a border with no radius, effectively square corners.
BorderRadiusGeometryAttribute squared() {
  return borderRadius(Radius.zero);
}

// Function that creates a BorderRadius with the same Radius value horizontally for left and right sides.
BorderRadiusGeometryAttribute borderRadiusHorizontal({
  Radius left = Radius.zero,
  Radius right = Radius.zero,
}) {
  return BorderRadius.horizontal(left: left, right: right).toAttribute();
}

// Function that creates a BorderRadius with the same Radius value vertically for top and bottom sides.
BorderRadiusGeometryAttribute borderRadiusVertical({
  Radius top = Radius.zero,
  Radius bottom = Radius.zero,
}) {
  return BorderRadius.vertical(top: top, bottom: bottom).toAttribute();
}

// Function that creates a uniform BorderRadius with a circular radius applied to all corners.
BorderRadiusGeometryAttribute borderRadiusCircular(double radius) {
  return BorderRadius.circular(radius).toAttribute();
}

// Function that creates a BorderRadiusDirectional with the same RadiusDirectional value horizontally for start and end sides.
BorderRadiusGeometryAttribute borderRadiusDirectionalHorizontal({
  Radius start = Radius.zero,
  Radius end = Radius.zero,
}) {
  return BorderRadiusDirectional.horizontal(start: start, end: end)
      .toAttribute();
}

// Function that creates a BorderRadiusDirectional with the same RadiusDirectional value vertically for top and bottom sides.
BorderRadiusGeometryAttribute borderRadiusDirectionalVertical({
  Radius top = Radius.zero,
  Radius bottom = Radius.zero,
}) {
  return BorderRadiusDirectional.vertical(top: top, bottom: bottom)
      .toAttribute();
}

// Function that creates a uniform BorderRadiusDirectional with a circular radius applied to all corners.
BorderRadiusGeometryAttribute borderRadiusDirectionalCircular(double radius) {
  return BorderRadiusDirectional.circular(radius).toAttribute();
}
