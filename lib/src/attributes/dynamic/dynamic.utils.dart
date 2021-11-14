import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/dark_mode.attributes.dart';
import 'package:mix/src/attributes/dynamic/media_query.attributes.dart';
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
}
