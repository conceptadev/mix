import 'package:flutter/material.dart';

import '../core/attribute.dart';

class TransformAttribute extends ScalarAttribute<Matrix4> {
  const TransformAttribute(super.value);

  @override
  TransformAttribute merge(TransformAttribute? other) => other ?? this;
}
