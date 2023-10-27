import 'package:flutter/material.dart';

import '../attributes/spacing_attribute.dart';

PaddingAttribute padding(double value) {
  return PaddingAttribute(SpacingGeometryDto.all(value));
}

PaddingAttribute paddingTop(double value) {
  return PaddingAttribute(SpacingGeometryDto.only(top: value));
}

PaddingAttribute paddingBottom(double value) {
  return PaddingAttribute(SpacingGeometryDto.only(bottom: value));
}

PaddingAttribute paddingLeft(double value) {
  return PaddingAttribute(SpacingGeometryDto.only(left: value));
}

PaddingAttribute paddingRight(double value) {
  return PaddingAttribute(SpacingGeometryDto.only(right: value));
}

PaddingAttribute paddingStart(double value) {
  return PaddingAttribute(SpacingGeometryDto.directionalOnly(start: value));
}

PaddingAttribute paddingEnd(double value) {
  return PaddingAttribute(SpacingGeometryDto.directionalOnly(end: value));
}

PaddingAttribute paddingHorizontal(double value) {
  return PaddingAttribute(SpacingGeometryDto.symmetric(horizontal: value));
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return PaddingAttribute(SpacingGeometryDto.symmetric(vertical: value));
}

PaddingAttribute paddingInsets(EdgeInsets insets) {
  return PaddingAttribute(SpacingGeometryDto.from(insets));
}
