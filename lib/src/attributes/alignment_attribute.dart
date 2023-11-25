import 'package:flutter/material.dart';

import '../core/attribute.dart';

class AlignmentGeometryAttribute extends ScalarAttribute<AlignmentGeometry>
    with SingleChildRenderAttributeMixin<Align> {
  const AlignmentGeometryAttribute(super.value);

  @override
  AlignmentGeometryAttribute merge(AlignmentGeometryAttribute? other) =>
      other ?? this;

  @override
  Align build(mix, child) {
    return Align(alignment: value, child: child);
  }
}
