import 'package:flutter/material.dart';

import '../core/attribute.dart';

class TransformAttribute extends ScalarAttribute<Matrix4>
    with SingleChildRenderAttributeMixin<Transform> {
  const TransformAttribute(super.value);

  @override
  TransformAttribute merge(TransformAttribute? other) => other ?? this;

  @override
  Transform build(mix, child) {
    return Transform(transform: value, child: child);
  }
}
