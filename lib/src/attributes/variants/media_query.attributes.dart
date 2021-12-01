import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/theme/breakpoints.dart';

class ScreenSizeAttribute extends VariantAttribute {
  const ScreenSizeAttribute(
    List<Attribute> attributes,
    this.screenSize,
  ) : super('screenSize', attributes);

  final ScreenSizeToken screenSize;
  @override
  bool shouldApply(BuildContext context) {
    final breakpoints = context.mixData.breakpoints;
    return breakpoints.getScreenSize(context).index <= screenSize.index;
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
