import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import '../helpers/extensions/values_ext.dart';

/// Generates an [AlignmentAttribute] from given [x] and [y] values.
const alignment = AlignmentUtility();

class AlignmentUtility {
  const AlignmentUtility();

  AlignmentAttribute topLeft() => const AlignmentAttribute(-1.0, -1.0);
  AlignmentAttribute topCenter() => const AlignmentAttribute(0.0, -1.0);
  AlignmentAttribute topRight() => const AlignmentAttribute(1.0, -1.0);
  AlignmentAttribute centerLeft() => const AlignmentAttribute(-1.0, 0.0);
  AlignmentAttribute center() => const AlignmentAttribute(0.0, 0.0);
  AlignmentAttribute centerRight() => const AlignmentAttribute(1.0, 0.0);
  AlignmentAttribute bottomLeft() => const AlignmentAttribute(-1.0, 1.0);
  AlignmentAttribute bottomCenter() => const AlignmentAttribute(0.0, 1.0);
  AlignmentAttribute bottomRight() => const AlignmentAttribute(1.0, 1.0);

  AlignmentDirectionalAttribute topStart() =>
      const AlignmentDirectionalAttribute(-1.0, -1.0);
  AlignmentDirectionalAttribute topEnd() =>
      const AlignmentDirectionalAttribute(1.0, -1.0);
  AlignmentDirectionalAttribute centerStart() =>
      const AlignmentDirectionalAttribute(-1.0, 0.0);
  AlignmentDirectionalAttribute centerEnd() =>
      const AlignmentDirectionalAttribute(1.0, 0.0);
  AlignmentDirectionalAttribute bottomStart() =>
      const AlignmentDirectionalAttribute(-1.0, 1.0);
  AlignmentDirectionalAttribute bottomEnd() =>
      const AlignmentDirectionalAttribute(1.0, 1.0);

  // Callable interface
  AlignmentGeometryAttribute call(AlignmentGeometry value) =>
      value.toAttribute();
}
