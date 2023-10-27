import 'package:flutter/material.dart';

import '../attributes/spacing_attribute.dart';

MarginAttribute margin(double value) {
  return MarginAttribute(SpacingGeometryDto.all(value));
}

MarginAttribute marginTop(double value) {
  return MarginAttribute(SpacingGeometryDto.only(top: value));
}

MarginAttribute marginBottom(double value) {
  return MarginAttribute(SpacingGeometryDto.only(bottom: value));
}

MarginAttribute marginLeft(double value) {
  return MarginAttribute(SpacingGeometryDto.only(left: value));
}

MarginAttribute marginRight(double value) {
  return MarginAttribute(SpacingGeometryDto.only(right: value));
}

MarginAttribute marginStart(double value) {
  return MarginAttribute(SpacingGeometryDto.directionalOnly(start: value));
}

MarginAttribute marginEnd(double value) {
  return MarginAttribute(SpacingGeometryDto.directionalOnly(end: value));
}

MarginAttribute marginHorizontal(double value) {
  return MarginAttribute(SpacingGeometryDto.symmetric(horizontal: value));
}

MarginAttribute marginVertical(double value) {
  /// margin vertical.
  return MarginAttribute(SpacingGeometryDto.symmetric(vertical: value));
}

MarginAttribute marginInsets(EdgeInsets insets) {
  return MarginAttribute(SpacingGeometryDto.from(insets));
}
