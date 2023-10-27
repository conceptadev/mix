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
  return PaddingAttribute(SpaceGeometryDto(top: value.toDto));
}

PaddingAttribute paddingBottom(double value) {
  return PaddingAttribute(SpaceGeometryDto(bottom: value.toDto));
}

PaddingAttribute paddingLeft(double value) {
  return PaddingAttribute(SpaceGeometryDto(left: value.toDto));
}

PaddingAttribute paddingRight(double value) {
  return PaddingAttribute(SpaceGeometryDto(right: value.toDto));
}

PaddingAttribute paddingStart(double value) {
  return PaddingAttribute(
    SpaceGeometryDto(start: value.toDto, isDirectional: true),
  );
}

PaddingAttribute paddingEnd(double value) {
  return PaddingAttribute(
    SpaceGeometryDto(end: value.toDto, isDirectional: true),
  );
}

PaddingAttribute paddingHorizontal(double value) {
  return PaddingAttribute(SpaceGeometryDto.symmetric(horizontal: value.toDto));
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return PaddingAttribute(SpaceGeometryDto.symmetric(vertical: value.toDto));
}

PaddingAttribute paddingInsets(EdgeInsetsGeometry insets) {
  return PaddingAttribute(insets.toSpace);
}

MarginAttribute margin(double p1, [double? p2, double? p3, double? p4]) {
  return MarginAttribute(SpaceGeometryDto.positional(p1, p2, p3, p4));
}

MarginAttribute marginDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return MarginAttribute(
    SpaceGeometryDto.positional(p1, p2, p3, p4).toDirectional,
  );
}

MarginAttribute marginTop(double value) {
  return MarginAttribute(SpaceGeometryDto(top: value.toDto));
}

MarginAttribute marginBottom(double value) {
  return MarginAttribute(SpaceGeometryDto(bottom: value.toDto));
}

MarginAttribute marginLeft(double value) {
  return MarginAttribute(SpaceGeometryDto(left: value.toDto));
}

MarginAttribute marginRight(double value) {
  return MarginAttribute(SpaceGeometryDto(right: value.toDto));
}

MarginAttribute marginStart(double value) {
  return MarginAttribute(
    SpaceGeometryDto(start: value.toDto, isDirectional: true),
  );
}

MarginAttribute marginEnd(double value) {
  return MarginAttribute(
    SpaceGeometryDto(end: value.toDto, isDirectional: true),
  );
}

MarginAttribute marginHorizontal(double value) {
  return MarginAttribute(SpaceGeometryDto.symmetric(horizontal: value.toDto));
}

MarginAttribute marginVertical(double value) {
  return MarginAttribute(SpaceGeometryDto.symmetric(vertical: value.toDto));
}

MarginAttribute marginInsets(EdgeInsets insets) {
  return MarginAttribute(insets.toSpace);
}
