import 'package:flutter/material.dart';

import '../attributes/scalar_attribute.dart';

FlexFitAttribute flexFit(FlexFit flexFit) => FlexFitAttribute(flexFit);
AxisAttribute axisDirection(Axis axis) => AxisAttribute(axis);

MainAxisAlignmentAttribute mainAxisAlignment(
  MainAxisAlignment mainAxisAlignment,
) {
  return MainAxisAlignmentAttribute(mainAxisAlignment);
}

CrossAxisAlignmentAttribute crossAxisAlignment(
  CrossAxisAlignment crossAxisAlignment,
) {
  return CrossAxisAlignmentAttribute(crossAxisAlignment);
}

MainAxisSizeAttribute mainAxisSize(MainAxisSize mainAxisSize) {
  return MainAxisSizeAttribute(mainAxisSize);
}
