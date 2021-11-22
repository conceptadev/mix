import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';

class ScreenSizeAttribute extends VariantAttribute {
  const ScreenSizeAttribute(
    List<Attribute> attributes,
    this.screenSize,
  ) : super('screenSize', attributes);

  final ScreenSize screenSize;
  @override
  bool shouldApply(BuildContext context) {
    return context.screenSize == screenSize;
  }
}

class OrientationAttribute extends VariantAttribute {
  const OrientationAttribute(
    List<Attribute> attributes,
    this.orientation,
  ) : super('orientation', attributes);
  final Orientation orientation;
  @override
  bool shouldApply(BuildContext context) {
    return context.orientation == orientation;
  }
}
