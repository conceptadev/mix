import 'package:flutter/material.dart';

import '../attributes/space_attribute.dart';
import '../helpers/extensions/values_ext.dart';

const _paddingFactory =
    SpaceUtilityFactory<PaddingAttribute>(PaddingAttribute.new);

const _paddingDirectionalFactory =
    SpaceDirectionalUtilityFactory<PaddingDirectionalAttribute>(
  PaddingDirectionalAttribute.new,
);

PaddingAttribute padding(double p1, [double? p2, double? p3, double? p4]) {
  return _paddingFactory.positional(p1, p2, p3, p4);
}

PaddingDirectionalAttribute paddingDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return _paddingDirectionalFactory.positional(p1, p2, p3, p4);
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

PaddingDirectionalAttribute paddingStart(double value) {
  return _paddingDirectionalFactory.create(start: value);
}

PaddingDirectionalAttribute paddingEnd(double value) {
  return _paddingDirectionalFactory.create(end: value);
}

PaddingAttribute paddingHorizontal(double value) {
  return _paddingFactory.symmetric(horizontal: value);
}

PaddingAttribute paddingVertical(double value) {
  return _paddingFactory.symmetric(vertical: value);
}

PaddingGeometryAttribute paddingFrom(EdgeInsets edgeInsets) {
  return edgeInsets.toPadding();
}

const _marginFactory =
    SpaceUtilityFactory<MarginAttribute>(MarginAttribute.new);

const _marginDirectionalFactory =
    SpaceDirectionalUtilityFactory<MarginDirectionalAttribute>(
  MarginDirectionalAttribute.new,
);

MarginAttribute margin(double p1, [double? p2, double? p3, double? p4]) {
  return _marginFactory.positional(p1, p2, p3, p4);
}

MarginDirectionalAttribute marginDirectional(
  double p1, [
  double? p2,
  double? p3,
  double? p4,
]) {
  return _marginDirectionalFactory.positional(p1, p2, p3, p4);
}

MarginAttribute marginTop(double value) {
  return _marginFactory.create(top: value);
}

MarginAttribute marginBottom(double value) {
  return _marginFactory.create(bottom: value);
}

MarginAttribute marginLeft(double value) {
  return _marginFactory.create(left: value);
}

MarginAttribute marginRight(double value) {
  return _marginFactory.create(right: value);
}

MarginDirectionalAttribute marginStart(double value) {
  return _marginDirectionalFactory.create(start: value);
}

MarginDirectionalAttribute marginEnd(double value) {
  return _marginDirectionalFactory.create(end: value);
}

MarginAttribute marginHorizontal(double value) {
  return _marginFactory.symmetric(horizontal: value);
}

MarginAttribute marginVertical(double value) {
  return _marginFactory.symmetric(vertical: value);
}

MarginGeometryAttribute marginFrom(EdgeInsets edgeInsets) {
  return _marginFactory.from(edgeInsets);
}

MarginDirectionalAttribute marginDirectionalFrom(
  EdgeInsetsDirectional edgeInsets,
) {
  return _marginDirectionalFactory.from(edgeInsets);
}
