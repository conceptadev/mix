import 'package:flutter/material.dart';

import '../attributes/data_attributes.dart';
import '../core/dto/border_dto.dart';

BorderRadiusGeometryAttribute borderRadius(
  Radius radius, {
  bool isDirectional = false,
}) {
  return BorderRadiusGeometryData.all(
    radius,
    isDirectional: isDirectional,
  ).toAttribute();
}

BorderRadiusGeometryAttribute rounded(
  double radius, {
  bool isDirectional = false,
}) {
  return borderRadius(
    Radius.circular(radius),
    isDirectional: isDirectional,
  );
}

BorderRadiusGeometryAttribute roundedHorizontal(
  double radius, {
  bool isDirectional = false,
}) {
  return BorderRadiusGeometryData.horizontal(
    leftStart: Radius.circular(radius),
    rightEnd: Radius.circular(radius),
    isDirectional: isDirectional,
  ).toAttribute();
}

BorderRadiusGeometryAttribute roundedVertical(
  double radius, {
  bool isDirectional = false,
}) {
  return BorderRadiusGeometryData.vertical(
    top: Radius.circular(radius),
    bottom: Radius.circular(radius),
    isDirectional: isDirectional,
  ).toAttribute();
}

BorderRadiusGeometryAttribute roundedTopLeft(double radius) {
  return BorderRadiusGeometryData(topLeft: Radius.circular(radius))
      .toAttribute();
}

BorderRadiusGeometryAttribute roundedTopRight(double radius) {
  return BorderRadiusGeometryData(topRight: Radius.circular(radius))
      .toAttribute();
}

BorderRadiusGeometryAttribute roundedBottomLeft(double radius) {
  return BorderRadiusGeometryData(bottomLeft: Radius.circular(radius))
      .toAttribute();
}

BorderRadiusGeometryAttribute roundedBottomRight(double radius) {
  return BorderRadiusGeometryData(bottomRight: Radius.circular(radius))
      .toAttribute();
}

// Directional options
BorderRadiusGeometryAttribute roundedTopStart(double radius) {
  return BorderRadiusGeometryData(
    topStart: Radius.circular(radius),
    isDirectional: true,
  ).toAttribute();
}

BorderRadiusGeometryAttribute roundedTopEnd(double radius) {
  return BorderRadiusGeometryData(
    topEnd: Radius.circular(radius),
    isDirectional: true,
  ).toAttribute();
}

BorderRadiusGeometryAttribute roundedBottomStart(double radius) {
  return BorderRadiusGeometryData(
    bottomStart: Radius.circular(radius),
    isDirectional: true,
  ).toAttribute();
}

BorderRadiusGeometryAttribute roundedBottomEnd(
  double radius,
) {
  return BorderRadiusGeometryData(
    bottomEnd: Radius.circular(radius),
    isDirectional: true,
  ).toAttribute();
}

BorderRadiusGeometryAttribute squared() {
  return borderRadius(Radius.zero);
}
