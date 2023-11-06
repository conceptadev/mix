import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
class AlignmentGeometryAttribute extends VisualAttribute<AlignmentGeometry> {
  final double? start;
  final double? x;
  final double? y;

  final bool _isDirectional;

  const AlignmentGeometryAttribute({
    this.start,
    this.x,
    this.y,
    bool isDirectional = false,
  }) : _isDirectional = isDirectional;

  bool get isDirectional {
    return start != null || _isDirectional;
  }

  @override
  AlignmentGeometryAttribute merge(AlignmentGeometryAttribute? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
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
  get props => [start, x, y, _isDirectional];
}
