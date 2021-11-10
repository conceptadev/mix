import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';
import 'package:mix/src/helpers/extensions.dart';

class MediaQueryUtility {
  const MediaQueryUtility();
  ScreenSizeAttribute xsmall(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.xs,
    );
  }

  ScreenSizeAttribute small(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.sm,
    );
  }

  ScreenSizeAttribute medium(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.md,
    );
  }

  ScreenSizeAttribute large(Attribute attribute) {
    return ScreenSizeAttribute(
      attribute,
      ScreenSize.lg,
    );
  }

  OrientationAttribute portrait(Attribute attribute) {
    return OrientationAttribute(
      attribute,
      Orientation.portrait,
    );
  }

  OrientationAttribute landscape(Attribute attribute) {
    return OrientationAttribute(
      attribute,
      Orientation.landscape,
    );
  }
}

class ScreenSizeAttribute extends DynamicAttribute {
  const ScreenSizeAttribute(
    Attribute attribute,
    this.screenSize,
  ) : super(attribute);

  final ScreenSize screenSize;
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize == screenSize;
  }
}

class OrientationAttribute extends DynamicAttribute {
  const OrientationAttribute(
    Attribute attribute,
    this.orientation,
  ) : super(attribute);
  final Orientation orientation;
  @override
  bool shouldApply(BuildContext context) {
    return context.mq.orientation == orientation;
  }
}
