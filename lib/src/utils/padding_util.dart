import 'package:flutter/material.dart';

import '../attributes/space_attribute.dart';

PaddingAttribute padding(double value) {
  return PaddingAttribute(EdgeInsetsDto.all(value));
}

PaddingAttribute paddingTop(double value) {
  return PaddingAttribute(EdgeInsetsDto.only(top: value));
}

PaddingAttribute paddingBottom(double value) {
  return PaddingAttribute(EdgeInsetsDto.only(bottom: value));
}

PaddingAttribute paddingLeft(double value) {
  return PaddingAttribute(EdgeInsetsDto.only(left: value));
}

PaddingAttribute paddingRight(double value) {
  return PaddingAttribute(EdgeInsetsDto.only(right: value));
}

PaddingAttribute paddingStart(double value) {
  return PaddingAttribute(EdgeInsetsDto.directionalOnly(start: value));
}

PaddingAttribute paddingEnd(double value) {
  return PaddingAttribute(EdgeInsetsDto.directionalOnly(end: value));
}

PaddingAttribute paddingHorizontal(double value) {
  return PaddingAttribute(EdgeInsetsDto.symmetric(horizontal: value));
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return PaddingAttribute(EdgeInsetsDto.symmetric(vertical: value));
}

PaddingAttribute paddingInsets(EdgeInsets insets) {
  return PaddingAttribute(EdgeInsetsDto.from(insets));
}
