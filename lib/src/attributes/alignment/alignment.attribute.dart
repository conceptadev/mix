import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import 'alignment_geometry.attribute.dart';

class AlignmentAttribute extends AlignmentGeometryAttribute<Alignment> {
  final double? x;
  final double? y;

  // ignore: unused_element
  const AlignmentAttribute({this.x, this.y});

  @override
  AlignmentAttribute merge(AlignmentAttribute? other) {
    if (other == null) return this;

    return AlignmentAttribute(x: other.x ?? x, y: other.y ?? y);
  }

  @override
  Alignment resolve(MixData mix) {
    const defaultValue = 0.0;

    return Alignment(x ?? defaultValue, y ?? defaultValue);
  }

  @override
  get props => [x, y];
}
