import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';
import 'package:mix/src/helpers/extensions.dart';

class MediaQueryUtility {
  const MediaQueryUtility();
  ScreenSizeUtility<LargeScreenSizeAttribute> get lg =>
      const ScreenSizeUtility<LargeScreenSizeAttribute>();

  ScreenSizeUtility<MediumScreenSizeAttribute> get md =>
      const ScreenSizeUtility<MediumScreenSizeAttribute>();

  ScreenSizeUtility<SmallScreenSizeAttribute> get sm =>
      const ScreenSizeUtility<SmallScreenSizeAttribute>();

  ScreenSizeUtility<XSmallScreenSizeAttribute> get xs =>
      const ScreenSizeUtility<XSmallScreenSizeAttribute>();

  OrientationUtility<PortraitAttribute> get portrait =>
      const OrientationUtility<PortraitAttribute>();

  OrientationUtility<LandscapeAttribute> get landscape =>
      const OrientationUtility<LandscapeAttribute>();
}

class OrientationUtility<T extends OrientationAttribute> {
  const OrientationUtility();

  T call(Attribute attribute) {
    switch (T) {
      case PortraitAttribute:
        return PortraitAttribute(attribute) as T;
      case LandscapeAttribute:
        return LandscapeAttribute(attribute) as T;

      default:
        throw Exception('Cannot create OrientationAttribute of $T');
    }
  }
}

class ScreenSizeUtility<T extends ScreenSizeAttribute> {
  const ScreenSizeUtility();

  T call(Attribute attribute) {
    switch (T) {
      case LargeScreenSizeAttribute:
        return LargeScreenSizeAttribute(attribute) as T;
      case MediumScreenSizeAttribute:
        return MediumScreenSizeAttribute(attribute) as T;
      case SmallScreenSizeAttribute:
        return SmallScreenSizeAttribute(attribute) as T;
      case XSmallScreenSizeAttribute:
        return XSmallScreenSizeAttribute(attribute) as T;
      default:
        throw Exception('Cannot create ScreenSizeAttribute of $T');
    }
  }
}

abstract class ScreenSizeAttribute extends DynamicAttribute {
  const ScreenSizeAttribute(Attribute attribute) : super(attribute);
}

class LargeScreenSizeAttribute extends ScreenSizeAttribute {
  const LargeScreenSizeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize == ScreenSize.lg;
  }
}

class MediumScreenSizeAttribute extends ScreenSizeAttribute {
  const MediumScreenSizeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize == ScreenSize.md;
  }
}

class SmallScreenSizeAttribute extends ScreenSizeAttribute {
  const SmallScreenSizeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize == ScreenSize.sm;
  }
}

class XSmallScreenSizeAttribute extends ScreenSizeAttribute {
  const XSmallScreenSizeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize == ScreenSize.xs;
  }
}

abstract class OrientationAttribute extends DynamicAttribute {
  const OrientationAttribute(Attribute attribute) : super(attribute);
}

class PortraitAttribute extends OrientationAttribute {
  const PortraitAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.isPortrait;
  }
}

class LandscapeAttribute extends OrientationAttribute {
  const LandscapeAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.isLandscape;
  }
}
