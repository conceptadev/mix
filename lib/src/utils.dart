import 'package:flutter/material.dart';

import 'attributes/base_attribute.dart';

/// Attribute params to list
List<Attribute> attributeParamToList([
  Attribute? p1,
  Attribute? p2,
  Attribute? p3,
  Attribute? p4,
  Attribute? p5,
  Attribute? p6,
  Attribute? p7,
  Attribute? p8,
  Attribute? p9,
  Attribute? p10,
  Attribute? p11,
  Attribute? p12,
]) {
  final params = <Attribute>[];

  if (p1 != null) {
    params.add(p1);
  }
  if (p2 != null) {
    params.add(p2);
  }
  if (p3 != null) {
    params.add(p3);
  }
  if (p4 != null) {
    params.add(p4);
  }
  if (p5 != null) {
    params.add(p5);
  }
  if (p6 != null) {
    params.add(p6);
  }
  if (p7 != null) {
    params.add(p7);
  }
  if (p8 != null) {
    params.add(p8);
  }
  if (p9 != null) {
    params.add(p9);
  }
  if (p10 != null) {
    params.add(p10);
  }
  if (p11 != null) {
    params.add(p11);
  }
  if (p12 != null) {
    params.add(p12);
  }
  return params;
}

/// Turns 4 positional args into a list
List<T> positionalToList<T>([
  T? p1,
  T? p2,
  T? p3,
  T? p4,
]) {
  final params = <T>[];
  if (p1 != null) {
    params.add(p1);
  }
  if (p2 != null) {
    params.add(p2);
  }
  if (p3 != null) {
    params.add(p3);
  }
  if (p4 != null) {
    params.add(p4);
  }

  return params;
}

Color hexToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}
