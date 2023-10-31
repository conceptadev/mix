import 'package:flutter/material.dart';

import '../attributes/data_attributes.dart';
import '../core/dto/edge_insets_dto.dart';
import '../helpers/extensions/values_ext.dart';

PaddingAttribute padding(double p1, [double? p2, double? p3, double? p4]) {
  return PaddingAttribute(SpacingGeometryData.positional(p1, p2, p3, p4));
}

PaddingAttribute paddingDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return PaddingAttribute(
    SpacingGeometryData.positional(p1, p2, p3, p4).toDirectional,
  );
}

PaddingAttribute paddingTop(double value) {
  return PaddingAttribute(SpacingGeometryData(top: value));
}

PaddingAttribute paddingBottom(double value) {
  return PaddingAttribute(SpacingGeometryData(bottom: value));
}

PaddingAttribute paddingLeft(double value) {
  return PaddingAttribute(SpacingGeometryData(left: value));
}

PaddingAttribute paddingRight(double value) {
  return PaddingAttribute(SpacingGeometryData(right: value));
}

PaddingAttribute paddingStart(double value) {
  return PaddingAttribute(
    SpacingGeometryData(start: value, isDirectional: true),
  );
}

PaddingAttribute paddingEnd(double value) {
  return PaddingAttribute(SpacingGeometryData(end: value, isDirectional: true));
}

PaddingAttribute paddingHorizontal(double value) {
  return PaddingAttribute(SpacingGeometryData.symmetric(horizontal: value));
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return PaddingAttribute(SpacingGeometryData.symmetric(vertical: value));
}

PaddingAttribute paddingInsets(EdgeInsetsGeometry insets) {
  return PaddingAttribute(insets.toSpace);
}

MarginAttribute margin(double p1, [double? p2, double? p3, double? p4]) {
  return MarginAttribute(SpacingGeometryData.positional(p1, p2, p3, p4));
}

MarginAttribute marginDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return MarginAttribute(
    SpacingGeometryData.positional(p1, p2, p3, p4).toDirectional,
  );
}

MarginAttribute marginTop(double value) {
  return MarginAttribute(SpacingGeometryData(top: value));
}

MarginAttribute marginBottom(double value) {
  return MarginAttribute(SpacingGeometryData(bottom: value));
}

MarginAttribute marginLeft(double value) {
  return MarginAttribute(SpacingGeometryData(left: value));
}

MarginAttribute marginRight(double value) {
  return MarginAttribute(SpacingGeometryData(right: value));
}

MarginAttribute marginStart(double value) {
  return MarginAttribute(
    SpacingGeometryData(start: value, isDirectional: true),
  );
}

MarginAttribute marginEnd(double value) {
  return MarginAttribute(SpacingGeometryData(end: value, isDirectional: true));
}

MarginAttribute marginHorizontal(double value) {
  return MarginAttribute(SpacingGeometryData.symmetric(horizontal: value));
}

MarginAttribute marginVertical(double value) {
  return MarginAttribute(SpacingGeometryData.symmetric(vertical: value));
}

MarginAttribute marginInsets(EdgeInsets insets) {
  return MarginAttribute(insets.toSpace);
}
