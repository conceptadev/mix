import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/attribute.dart';

class ScreenSizeAttribute extends DynamicAttribute {
  const ScreenSizeAttribute(
    List<Attribute> attributes,
    this.screenSize,
  ) : super(attributes);

  final ScreenSize screenSize;
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize() == screenSize;
  }
}

class OrientationAttribute extends DynamicAttribute {
  const OrientationAttribute(
    List<Attribute> attributes,
    this.orientation,
  ) : super(attributes);
  final Orientation orientation;
  @override
  bool shouldApply(BuildContext context) {
    return context.orientation() == orientation;
  }
}
