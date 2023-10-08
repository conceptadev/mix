import 'package:flutter/widgets.dart';

import 'axis.attribute.dart';
import 'cross_axis_alignment.attribute.dart';
import 'flex_fit.attribute.dart';
import 'main_axis_alignment.attribute.dart';
import 'main_axis_size.attribute.dart';

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
