import 'package:flutter/material.dart';

import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/enum/vertical_direction/vertical_direction.attribute.dart';
import '../../attributes/flex/axis.attribute.dart';
import '../../attributes/flex/cross_axis_alignment.attribute.dart';
import '../../attributes/flex/main_axis_alignment.attribute.dart';
import '../../attributes/flex/main_axis_size.attribute.dart';
import '../../attributes/text/text_baseline.attribute.dart';
import '../../attributes/text/text_direction/text_direction.attribute.dart';
import 'flex.attribute.dart';

FlexAttributes flex({
  Axis? direction,
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return FlexAttributes(
    crossAxisAlignment: crossAxisAlignment == null
        ? null
        : CrossAxisAlignmentAttribute(crossAxisAlignment),
    direction: direction == null ? null : AxisAttribute(direction),
    mainAxisAlignment: mainAxisAlignment == null
        ? null
        : MainAxisAlignmentAttribute(mainAxisAlignment),
    mainAxisSize:
        mainAxisSize == null ? null : MainAxisSizeAttribute(mainAxisSize),
    verticalDirection: verticalDirection == null
        ? null
        : VerticalDirectionAttribute(verticalDirection),
    textDirection:
        textDirection == null ? null : TextDirectionAttribute(textDirection),
    textBaseline:
        textBaseline == null ? null : TextBaselineAttribute(textBaseline),
    clipBehavior: clipBehavior == null ? null : ClipAttribute(clipBehavior),
  );
}

FlexAttributes row({
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return flex(
    direction: Axis.horizontal,
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
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
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return flex(
    direction: Axis.vertical,
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
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
  return flex(direction: direction);
}

// Create a FlexAttributes for the direction vertical axis.
@Deprecated('Use flex(direction: Axis.vertical) instead')
FlexAttributes verticalDirection(VerticalDirection verticalDirection) {
  return flex(verticalDirection: verticalDirection);
}

// Create a FlexAttributes for the main axis.
@Deprecated('Use flex(mainAxisAlignment: mainAxisAlignment) instead')
FlexAttributes mainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
  return flex(mainAxisAlignment: mainAxisAlignment);
}

// Create a FlexAttributes for the main axis size.
@Deprecated('Use flex(mainAxisSize: mainAxisSize) instead')
FlexAttributes mainAxisSize(MainAxisSize mainAxisSize) {
  return flex(mainAxisSize: mainAxisSize);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex(crossAxisAlignment: crossAxisAlignment) instead')
FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return flex(crossAxisAlignment: crossAxisAlignment);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex(crossAxisAlignment: crossAxisAlignment) instead')
FlexAttributes crossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
  return flex(crossAxisAlignment: crossAxisAlignment);
}

@Deprecated('Use flex(mainAxisAlignment: mainAxis) instead')
FlexAttributes mainAxis(MainAxisAlignment mainAxis) {
  return mainAxisAlignment(mainAxis);
}
