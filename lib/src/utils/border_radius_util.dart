import 'package:flutter/material.dart';

import '../attributes/border_attribute.dart';

BorderRadiusGeometryAttribute borderRadius(
  Radius radius, {
  bool isDirectional = false,
}) {
  return BorderRadiusGeometryAttribute.all(radius,
      isDirectional: isDirectional);
}

BorderRadiusGeometryAttribute rounded(
  double radius, {
  bool isDirectional = false,
}) {
  return borderRadius(Radius.circular(radius), isDirectional: isDirectional);
}

BorderRadiusGeometryAttribute roundedHorizontal(
  double radius, {
  bool isDirectional = false,
}) {
  return BorderRadiusGeometryAttribute.horizontal(
    leftStart: Radius.circular(radius),
    rightEnd: Radius.circular(radius),
    isDirectional: isDirectional,
  );
}

BorderRadiusGeometryAttribute roundedVertical(
  double radius, {
  bool isDirectional = false,
}) {
  return BorderRadiusGeometryAttribute.vertical(
    top: Radius.circular(radius),
    bottom: Radius.circular(radius),
    isDirectional: isDirectional,
  );
}

BorderRadiusGeometryAttribute roundedTopLeft(double radius) {
  return BorderRadiusGeometryAttribute(topLeft: Radius.circular(radius));
}

BorderRadiusGeometryAttribute roundedTopRight(double radius) {
  return BorderRadiusGeometryAttribute(topRight: Radius.circular(radius));
}

BorderRadiusGeometryAttribute roundedBottomLeft(double radius) {
  return BorderRadiusGeometryAttribute(bottomLeft: Radius.circular(radius));
}

BorderRadiusGeometryAttribute roundedBottomRight(double radius) {
  return BorderRadiusGeometryAttribute(bottomRight: Radius.circular(radius));
}

// Directional options
BorderRadiusGeometryAttribute roundedTopStart(double radius) {
  return BorderRadiusGeometryAttribute(
    topStart: Radius.circular(radius),
    isDirectional: true,
  );
}

BorderRadiusGeometryAttribute roundedTopEnd(double radius) {
  return BorderRadiusGeometryAttribute(
    topEnd: Radius.circular(radius),
    isDirectional: true,
  );
}

BorderRadiusGeometryAttribute roundedBottomStart(double radius) {
  return BorderRadiusGeometryAttribute(
    bottomStart: Radius.circular(radius),
    isDirectional: true,
  );
}

BorderRadiusGeometryAttribute roundedBottomEnd(double radius) {
  return BorderRadiusGeometryAttribute(
    bottomEnd: Radius.circular(radius),
    isDirectional: true,
  );
}

BorderRadiusGeometryAttribute squared() {
  return borderRadius(Radius.zero);
}
