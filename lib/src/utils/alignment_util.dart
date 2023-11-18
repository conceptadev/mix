import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import 'scalar_util.dart';

/// Generates an [AlignmentAttribute] from given [x] and [y] values.
const alignment = AlignmentUtility(AlignmentGeometryAttribute.from);

class AlignmentUtility<T> extends ScalarUtility<AlignmentGeometry, T> {
  const AlignmentUtility(super.builder);

  T topLeft() => builder(Alignment.topLeft);
  T topCenter() => builder(Alignment.topCenter);
  T topRight() => builder(Alignment.topRight);
  T centerLeft() => builder(Alignment.centerLeft);
  T center() => builder(Alignment.center);
  T centerRight() => builder(Alignment.centerRight);
  T bottomLeft() => builder(Alignment.bottomLeft);
  T bottomCenter() => builder(Alignment.bottomCenter);
  T bottomRight() => builder(Alignment.bottomRight);

  T topStart() => builder(AlignmentDirectional.topStart);
  T topEnd() => builder(AlignmentDirectional.topEnd);
  T centerStart() => builder(AlignmentDirectional.centerStart);
  T centerEnd() => builder(AlignmentDirectional.centerEnd);
  T bottomStart() => builder(AlignmentDirectional.bottomStart);
  T bottomEnd() => builder(AlignmentDirectional.bottomEnd);
}
