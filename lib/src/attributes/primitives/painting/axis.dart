import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class AxisUtility {
  AxisAttribute get horizontal => const AxisAttribute(Axis.horizontal);
  AxisAttribute get vertical => const AxisAttribute(Axis.vertical);
}

class AxisAttribute extends Attribute<Axis> {
  const AxisAttribute(Axis axis) : _axis = axis;

  final Axis _axis;

  @override
  Axis get value => _axis;
}
