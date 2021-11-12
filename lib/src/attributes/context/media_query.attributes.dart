import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/attribute.dart';

class ScreenSizeAttribute extends DynamicAttribute {
  const ScreenSizeAttribute(
    Attribute attribute,
    this.screenSize,
  ) : super(attribute);

  final ScreenSize screenSize;
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize() == screenSize;
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
    return context.orientation() == orientation;
  }
}
