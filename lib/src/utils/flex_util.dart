import 'package:flutter/material.dart';

import '../attributes/axis_attribute.dart';
import '../attributes/clip_attribute.dart';
import '../attributes/cross_axis_alignment_attribute.dart';
import '../attributes/flex_attribute.dart';
import '../attributes/flex_fit_attribute.dart';
import '../attributes/main_axis_alignment_attribute.dart';
import '../attributes/main_axis_size_attribute.dart';
import '../attributes/text_baseline_attribute.dart';
import '../attributes/text_direction_attribute.dart';
import '../attributes/vertical_direction_attribute.dart';

const row = _row;
const column = _column;
const flexFit = _flexFit;
const axisDirection = _axisDirection;
const mainAxisAlignment = _mainAxisAlignment;
const crossAxisAlignment = _crossAxisAlignment;
const mainAxisSize = _mainAxisSize;

FlexFitAttribute _flexFit(FlexFit flexFit) => FlexFitAttribute(flexFit);
AxisAttribute _axisDirection(Axis axis) => AxisAttribute(axis);

MainAxisAlignmentAttribute _mainAxisAlignment(
  MainAxisAlignment mainAxisAlignment,
) {
  return MainAxisAlignmentAttribute(mainAxisAlignment);
}

CrossAxisAlignmentAttribute _crossAxisAlignment(
  CrossAxisAlignment crossAxisAlignment,
) {
  return CrossAxisAlignmentAttribute(crossAxisAlignment);
}

MainAxisSizeAttribute _mainAxisSize(MainAxisSize mainAxisSize) {
  return MainAxisSizeAttribute(mainAxisSize);
}

FlexAttributes _flex({
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

FlexAttributes _row({
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return _flex(
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

FlexAttributes _column({
  MainAxisAlignment? mainAxisAlignment,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisSize? mainAxisSize,
  VerticalDirection? verticalDirection,
  TextDirection? textDirection,
  TextBaseline? textBaseline,
  Clip? clipBehavior,
}) {
  return _flex(
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
  return _flex(direction: direction);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex(crossAxisAlignment: crossAxisAlignment) instead')
FlexAttributes crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return _flex(crossAxisAlignment: crossAxisAlignment);
}

@Deprecated('Use flex(mainAxisAlignment: mainAxis) instead')
MainAxisAlignmentAttribute mainAxis(MainAxisAlignment mainAxis) {
  return _mainAxisAlignment(mainAxis);
}
