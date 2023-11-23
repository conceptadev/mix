import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/attribute.dart';

class AxisAttribute extends ScalarAttribute<Axis> {
  const AxisAttribute(super.value);

  static AxisAttribute? maybe(Axis? value) =>
      value == null ? null : AxisAttribute(value);
  @override
  AxisAttribute merge(AxisAttribute? other) => other ?? this;
}
