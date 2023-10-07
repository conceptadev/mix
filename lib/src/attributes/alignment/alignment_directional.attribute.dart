import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import 'alignment_geometry.attribute.dart';

class AlignmentDirectionalAttribute
    extends AlignmentGeometryAttribute<AlignmentDirectional> {
  final double? start;
  final double? y;

  // ignore: unused_element
  const AlignmentDirectionalAttribute({this.start, this.y});

  @override
  AlignmentDirectionalAttribute merge(AlignmentDirectionalAttribute? other) {
    if (other == null) return this;

    return AlignmentDirectionalAttribute(
      start: other.start ?? start,
      y: other.y ?? y,
    );
  }

  @override
  AlignmentDirectional resolve(MixData mix) {
    const defaultValue = 0.0;

    return AlignmentDirectional(start ?? defaultValue, y ?? defaultValue);
  }

  @override
  get props => [start, y];
}
