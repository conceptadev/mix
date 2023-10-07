import 'package:flutter/material.dart';

import 'flex.attribute.dart';

FlexAttributes flex(
  Axis direction, {
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  double? gapSize,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return FlexAttributes(
    crossAxisAlignment: crossAxisAlignment,
    direction: direction,
    gapSize: gapSize,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    verticalDirection: verticalDirection,
    textDirection: textDirection,
    textBaseline: textBaseline,
    clipBehavior: clipBehavior,
  );
}

FlexAttributes row({
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  double? gapSize,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return FlexAttributes(
    crossAxisAlignment: crossAxisAlignment,
    direction: Axis.horizontal,
    gapSize: gapSize,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    verticalDirection: verticalDirection,
    textDirection: textDirection,
    textBaseline: textBaseline,
    clipBehavior: clipBehavior,
  );
}

FlexAttributes column({
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  double? gapSize,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return FlexAttributes(
    crossAxisAlignment: crossAxisAlignment,
    direction: Axis.vertical,
    gapSize: gapSize,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    verticalDirection: verticalDirection,
    textDirection: textDirection,
    textBaseline: textBaseline,
    clipBehavior: clipBehavior,
  );
}

// Create a FlexAttributes for the direction axis.
@Deprecated('Use flex(direction: direction) instead')
FlexAttributes direction(Axis direction) {
  return FlexAttributes(direction: direction);
}

// Create a FlexAttributes for the direction vertical axis.
@Deprecated('Use flex(direction: Axis.vertical) instead')
FlexAttributes verticalDirection(VerticalDirection verticalDirection) {
  return FlexAttributes(verticalDirection: verticalDirection);
}

// Create a FlexAttributes for the main axis.
@Deprecated('Use flex(mainAxisAlignment: mainAxisAlignment) instead')
FlexAttributes mainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
  return FlexAttributes(mainAxisAlignment: mainAxisAlignment);
}

// Create a FlexAttributes for the main axis size.
@Deprecated('Use flex(mainAxisSize: mainAxisSize) instead')
FlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
  return FlexAttributes(mainAxisSize: mainAxisSize);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex(crossAxisAlignment: crossAxisAlignment) instead')
FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return FlexAttributes(crossAxisAlignment: crossAxisAlignment);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex(crossAxisAlignment: crossAxisAlignment) instead')
FlexAttributes crossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
  return FlexAttributes(crossAxisAlignment: crossAxisAlignment);
}

// Create a FlexAttributes for gap size.
@Deprecated('Use flex(gapSize: gapSize) instead')
FlexAttributes gap(double gapSize) {
  return FlexAttributes(gapSize: gapSize);
}

@Deprecated('Use flex(mainAxisAlignment: mainAxis) instead')
FlexAttributes mainAxis(MainAxisAlignment mainAxis) {
  return mainAxisAlignment(mainAxis);
}
