import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

@immutable
class AlignmentGeometryAttribute extends VisualAttribute<AlignmentGeometry> {
  final double? start;
  final double? x;
  final double? y;

  final bool isDirectional;

  const AlignmentGeometryAttribute({
    this.start,
    this.x,
    this.y,
    this.isDirectional = false,
  });

  @override
  AlignmentGeometryAttribute merge(AlignmentGeometryAttribute? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional alignment attributes",
      );
    }

    return AlignmentGeometryAttribute(
      start: other.start ?? start,
      x: other.x ?? x,
      y: other.y ?? y,
    );
  }

  @override
  AlignmentGeometry resolve(MixData mix) {
    return isDirectional
        ? AlignmentDirectional(start ?? 0.0, y ?? 0.0)
        : Alignment(x ?? 0.0, y ?? 0.0);
  }

  @override
  get props => [start, x, y, isDirectional];
}
