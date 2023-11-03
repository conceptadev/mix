import 'package:flutter/material.dart';

import '../attributes/edge_insets_attribute.dart';

SpacingDataFactory<PaddingAttribute> _paddingFactory =
    const SpacingDataFactory<PaddingAttribute>(PaddingAttribute.new);

PaddingAttribute padding(double p1, [double? p2, double? p3, double? p4]) {
  return _paddingFactory.positional(p1, p2, p3, p4);
}

PaddingAttribute paddingDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return _paddingFactory.positional(p1, p2, p3, p4).toDirectional;
}

PaddingAttribute paddingTop(double value) {
  return _paddingFactory.create(top: value);
}

PaddingAttribute paddingBottom(double value) {
  return _paddingFactory.create(bottom: value);
}

PaddingAttribute paddingLeft(double value) {
  return _paddingFactory.create(left: value);
}

PaddingAttribute paddingRight(double value) {
  return _paddingFactory.create(right: value);
}

PaddingAttribute paddingStart(double value) {
  return _paddingFactory.create(isDirectional: true, start: value);
}

PaddingAttribute paddingEnd(double value) {
  return _paddingFactory.create(end: value, isDirectional: true);
}

PaddingAttribute paddingHorizontal(double value) {
  return _paddingFactory.symmetric(horizontal: value);
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return _paddingFactory.symmetric(vertical: value);
}

PaddingAttribute paddingInsets(EdgeInsetsGeometry insets) {
  return _paddingFactory.fromEdgeInsets(insets);
}

SpacingDataFactory<MarginAttribute> _marginFactory =
    const SpacingDataFactory<MarginAttribute>(MarginAttribute.new);

MarginAttribute margin(double p1, [double? p2, double? p3, double? p4]) {
  return _marginFactory.positional(p1, p2, p3, p4);
}

MarginAttribute marginDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return _marginFactory.positional(p1, p2, p3, p4).toDirectional;
}

MarginAttribute marginTop(double value) {
  return MarginAttribute(top: value);
}

MarginAttribute marginBottom(double value) {
  return MarginAttribute(bottom: value);
}

MarginAttribute marginLeft(double value) {
  return MarginAttribute(left: value);
}

MarginAttribute marginRight(double value) {
  return MarginAttribute(right: value);
}

MarginAttribute marginStart(double value) {
  return MarginAttribute(start: value, isDirectional: true);
}

MarginAttribute marginEnd(double value) {
  return MarginAttribute(end: value, isDirectional: true);
}

MarginAttribute marginHorizontal(double value) {
  return _marginFactory.symmetric(horizontal: value);
}

MarginAttribute marginVertical(double value) {
  return _marginFactory.symmetric(vertical: value);
}

MarginAttribute marginInsets(EdgeInsets edgeInsets) {
  return _marginFactory.fromEdgeInsets(edgeInsets);
}
