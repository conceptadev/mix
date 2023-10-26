import 'package:flutter/material.dart';

import '../attributes/axis_attribute.dart';
import '../attributes/cross_axis_alignment_attribute.dart';
import '../attributes/flex_fit_attribute.dart';
import '../attributes/main_axis_alignment_attribute.dart';
import '../attributes/main_axis_size_attribute.dart';

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

// Create a FlexAttributes for the direction axis.
@Deprecated('Use flex(direction: direction) instead')
AxisAttribute direction(Axis direction) {
  return AxisAttribute(direction);
}

// Create a FlexAttributes for the cross axis.
@Deprecated('Use flex(crossAxisAlignment: crossAxisAlignment) instead')
CrossAxisAlignmentAttribute crossAxis(CrossAxisAlignment crossAxisAlignment) {
  return CrossAxisAlignmentAttribute(crossAxisAlignment);
}

@Deprecated('Use flex(mainAxisAlignment: mainAxis) instead')
MainAxisAlignmentAttribute mainAxis(MainAxisAlignment mainAxis) {
  return _mainAxisAlignment(mainAxis);
}
