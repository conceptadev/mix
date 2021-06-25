import 'package:flutter/material.dart';

import '../base_attribute.dart';

class AxisUtility {
  AxisAttribute get horizontal => AxisAttribute(Axis.horizontal);
  AxisAttribute get vertical => AxisAttribute(Axis.vertical);
}

class AxisAttribute extends Attribute<Axis> {
  const AxisAttribute(Axis axis) : _axis = axis;

  final Axis _axis;
  // Returns axis value
  Axis get value => _axis;
}
