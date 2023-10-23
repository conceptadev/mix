import 'package:flutter/material.dart';

import '../attributes/space_attribute.dart';

MarginAttribute margin(double value) {
  return MarginAttribute(EdgeInsetsDto.all(value));
}

MarginAttribute marginTop(double value) {
  return MarginAttribute(EdgeInsetsDto.only(top: value));
}

MarginAttribute marginBottom(double value) {
  return MarginAttribute(EdgeInsetsDto.only(bottom: value));
}

MarginAttribute marginLeft(double value) {
  return MarginAttribute(EdgeInsetsDto.only(left: value));
}

MarginAttribute marginRight(double value) {
  return MarginAttribute(EdgeInsetsDto.only(right: value));
}

MarginAttribute marginStart(double value) {
  return MarginAttribute(EdgeInsetsDto.directionalOnly(start: value));
}

MarginAttribute marginEnd(double value) {
  return MarginAttribute(EdgeInsetsDto.directionalOnly(end: value));
}

MarginAttribute marginHorizontal(double value) {
  return MarginAttribute(EdgeInsetsDto.symmetric(horizontal: value));
}

MarginAttribute marginVertical(double value) {
  /// margin vertical.
  return MarginAttribute(EdgeInsetsDto.symmetric(vertical: value));
}

MarginAttribute marginInsets(EdgeInsets insets) {
  return MarginAttribute(EdgeInsetsDto.from(insets));
}
