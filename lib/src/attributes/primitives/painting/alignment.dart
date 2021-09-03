import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class AlignmentUtility {
  const AlignmentUtility();

  /// The top left  corner.
  AlignmentAttribute topLeft() => const AlignmentAttribute(Alignment.topLeft);

  /// The top right corner.
  AlignmentAttribute topRight() => const AlignmentAttribute(Alignment.topRight);

  /// The center point along the top edge.
  AlignmentAttribute topCenter() =>
      const AlignmentAttribute(Alignment.topCenter);

  /// The center point along the left edge.
  AlignmentAttribute centerLeft() =>
      const AlignmentAttribute(Alignment.centerLeft);

  /// The center point, both horizontally and vertically.
  AlignmentAttribute center() => const AlignmentAttribute(Alignment.center);

  /// The center point along the right edge.
  AlignmentAttribute centerRight() =>
      const AlignmentAttribute(Alignment.centerRight);

  /// The bottom left corner.
  AlignmentAttribute bottomLeft() =>
      const AlignmentAttribute(Alignment.bottomLeft);

  /// The center point along the bottom edge.
  AlignmentAttribute bottomCenter() =>
      const AlignmentAttribute(Alignment.bottomCenter);

  /// The bottom right corner.
  AlignmentAttribute bottomRight() =>
      const AlignmentAttribute(Alignment.bottomRight);
}

/// Alignment Attribute
class AlignmentAttribute extends Attribute<Alignment> {
  const AlignmentAttribute(this.alignment);

  final Alignment alignment;
  @override
  Alignment get value => alignment;
}
