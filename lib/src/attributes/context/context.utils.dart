import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/context/dark_mode.attributes.dart';
import 'package:mix/src/attributes/context/media_query.attributes.dart';
import 'package:mix/src/helpers/extensions.dart';

class ContextUtility {
  const ContextUtility._();
  static ScreenSizeAttribute xsmall(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.xs,
    );
  }

  static ScreenSizeAttribute small(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.sm,
    );
  }

  static ScreenSizeAttribute medium(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.md,
    );
  }

  static ScreenSizeAttribute large(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.lg,
    );
  }

  static OrientationAttribute portrait(Attribute attribute) {
    return OrientationAttribute(
      attribute,
      Orientation.portrait,
    );
  }

  static OrientationAttribute landscape(Attribute attribute) {
    return OrientationAttribute(
      attribute,
      Orientation.landscape,
    );
  }

  static DarkModeAttribute dark(Attribute attribute) {
    return DarkModeAttribute(attribute);
  }
}
