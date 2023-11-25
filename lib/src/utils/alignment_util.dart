import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import 'scalar_util.dart';

const alignment = AlignmentUtility(AlignmentGeometryAttribute.new);

class AlignmentUtility<T> extends ScalarUtility<T, AlignmentGeometry> {
  const AlignmentUtility(super.builder);

  T topLeft() => as(Alignment.topLeft);
  T topCenter() => as(Alignment.topCenter);
  T topRight() => as(Alignment.topRight);
  T centerLeft() => as(Alignment.centerLeft);
  T center() => as(Alignment.center);
  T centerRight() => as(Alignment.centerRight);
  T bottomLeft() => as(Alignment.bottomLeft);
  T bottomCenter() => as(Alignment.bottomCenter);
  T bottomRight() => as(Alignment.bottomRight);
  T only(double? x, double? y, double? start) {
    return start == null
        ? as(Alignment(x ?? 0, y ?? 0))
        : as(AlignmentDirectional(start, y ?? 0));
  }
}
