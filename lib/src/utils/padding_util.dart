import 'package:flutter/material.dart';

import '../attributes/value_attributes.dart';
import '../core/dto/dtos.dart';
import '../helpers/extensions/helper_ext.dart';

PaddingAttribute padding(double p1, [double? p2, double? p3, double? p4]) {
  return PaddingAttribute(SpaceGeometryDto.positional(p1, p2, p3, p4));
}

PaddingAttribute paddingDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return PaddingAttribute(
    SpaceGeometryDto.positional(p1, p2, p3, p4).toDirectional,
  );
}

PaddingAttribute paddingTop(double value) {
  return PaddingAttribute(SpaceGeometryDto(top: value.dto));
}

PaddingAttribute paddingBottom(double value) {
  return PaddingAttribute(SpaceGeometryDto(bottom: value.dto));
}

PaddingAttribute paddingLeft(double value) {
  return PaddingAttribute(SpaceGeometryDto(left: value.dto));
}

PaddingAttribute paddingRight(double value) {
  return PaddingAttribute(SpaceGeometryDto(right: value.dto));
}

PaddingAttribute paddingStart(double value) {
  return PaddingAttribute(
    SpaceGeometryDto(start: value.dto, isDirectional: true),
  );
}

PaddingAttribute paddingEnd(double value) {
  return PaddingAttribute(
    SpaceGeometryDto(end: value.dto, isDirectional: true),
  );
}

PaddingAttribute paddingHorizontal(double value) {
  return PaddingAttribute(SpaceGeometryDto.symmetric(horizontal: value.dto));
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return PaddingAttribute(SpaceGeometryDto.symmetric(vertical: value.dto));
}

PaddingAttribute paddingInsets(EdgeInsets insets) {
  return PaddingAttribute(
    SpaceGeometryDto(
      top: insets.top.dto,
      bottom: insets.bottom.dto,
      left: insets.left.dto,
      right: insets.right.dto,
    ),
  );
}
