import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import '../helpers/extensions/values_ext.dart';

/// Generates an [AlignmentAttribute] from given [x] and [y] values.
const alignment = AlignmentUtility();

class AlignmentUtility {
  const AlignmentUtility();

  AlignmentAttribute get topLeft => const AlignmentAttribute(-1.0, -1.0);
  AlignmentAttribute get topCenter => const AlignmentAttribute(0.0, -1.0);
  AlignmentAttribute get topRight => const AlignmentAttribute(1.0, -1.0);
  AlignmentAttribute get centerLeft => const AlignmentAttribute(-1.0, 0.0);
  AlignmentAttribute get center => const AlignmentAttribute(0.0, 0.0);
  AlignmentAttribute get centerRight => const AlignmentAttribute(1.0, 0.0);
  AlignmentAttribute get bottomLeft => const AlignmentAttribute(-1.0, 1.0);
  AlignmentAttribute get bottomCenter => const AlignmentAttribute(0.0, 1.0);
  AlignmentAttribute get bottomRight => const AlignmentAttribute(1.0, 1.0);

  AlignmentDirectionalAttribute get topStart =>
      const AlignmentDirectionalAttribute(-1.0, -1.0);
  AlignmentDirectionalAttribute get topEnd =>
      const AlignmentDirectionalAttribute(1.0, -1.0);
  AlignmentDirectionalAttribute get centerStart =>
      const AlignmentDirectionalAttribute(-1.0, 0.0);
  AlignmentDirectionalAttribute get centerEnd =>
      const AlignmentDirectionalAttribute(1.0, 0.0);
  AlignmentDirectionalAttribute get bottomStart =>
      const AlignmentDirectionalAttribute(-1.0, 1.0);
  AlignmentDirectionalAttribute get bottomEnd =>
      const AlignmentDirectionalAttribute(1.0, 1.0);

  // Callable interface
  AlignmentGeometryAttribute call(AlignmentGeometry value) =>
      value.toAttribute();
}
