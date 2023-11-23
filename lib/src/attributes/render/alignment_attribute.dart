import 'package:flutter/material.dart';

import '../../utils/scalar_util.dart';
import '../attribute.dart';

const alignment = AlignmentUtility(AlignmentGeometryAttribute.new);

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
