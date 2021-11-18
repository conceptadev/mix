import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/dark_mode.attributes.dart';
import 'package:mix/src/attributes/dynamic/media_query.attributes.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';
import 'package:mix/src/helpers/extensions.dart';

class DynamicUtils {
  const DynamicUtils._();
  static ScreenSizeAttribute xsmall(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSize.xs,
    );
  }

  static ScreenSizeAttribute small(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSize.sm,
    );
  }

  static ScreenSizeAttribute medium(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSize.md,
    );
  }

  static ScreenSizeAttribute large(List<Attribute> attributes) {
    return ScreenSizeAttribute(
      attributes,
      ScreenSize.lg,
    );
  }

  static OrientationAttribute portrait(List<Attribute> attributes) {
    return OrientationAttribute(
      attributes,
      Orientation.portrait,
    );
  }

  static OrientationAttribute landscape(List<Attribute> attributes) {
    return OrientationAttribute(
      attributes,
      Orientation.landscape,
    );
  }

  static DarkModeAttribute dark(List<Attribute> attributes) {
    return DarkModeAttribute(attributes);
  }

  static VariantAttribute variant<T extends Attribute>(
      Symbol variant, List<T> attributes) {
    return VariantAttribute(variant, attributes);
  }

  static VariantAttribute variantParams<T extends Attribute>(
    Symbol variant, [
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params = <T>[];
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);
    return VariantAttribute(variant, params);
  }
}
