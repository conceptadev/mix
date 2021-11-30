import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/theme/breakpoints.dart';

class DarkModeAttribute<T extends Attribute> extends VariantAttribute<T> {
  const DarkModeAttribute(List<T> attribute) : super('dark', attribute);
  @override
  bool shouldApply(BuildContext context) {
    return context.isDarkMode;
  }
}

class ScreenSizeAttribute<T extends Attribute> extends VariantAttribute<T> {
  const ScreenSizeAttribute(
    List<T> attributes,
    this.screenSize,
  ) : super('screenSize', attributes);

  final ScreenSizeToken screenSize;
  @override
  bool shouldApply(BuildContext context) {
    final breakpoints = context.mixData.breakpoints;
    return breakpoints.getScreenSize(context).index <= screenSize.index;
  }
}

class OrientationAttribute<T extends Attribute> extends VariantAttribute<T> {
  const OrientationAttribute(
    List<T> attributes,
    this.orientation,
  ) : super('orientation', attributes);
  final Orientation orientation;
  @override
  bool shouldApply(BuildContext context) {
    return context.orientation == orientation;
  }
}
