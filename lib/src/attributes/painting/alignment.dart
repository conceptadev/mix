import 'package:flutter/material.dart';

import '../base_attribute.dart';

class AlignmentUtility {
  const AlignmentUtility();

  /// The top left  corner.
  AlignmentAttribute get topLeft => const AlignmentAttribute(Alignment.topLeft);

  /// The top right corner.
  AlignmentAttribute get topRight =>
      const AlignmentAttribute(Alignment.topRight);

  /// The center point along the top edge.
  AlignmentAttribute get topCenter =>
      const AlignmentAttribute(Alignment.topCenter);

  /// The center point along the left edge.
  AlignmentAttribute get centerLeft =>
      const AlignmentAttribute(Alignment.centerLeft);

  /// The center point, both horizontally and vertically.
  AlignmentAttribute get center => const AlignmentAttribute(Alignment.center);

  /// The center point along the right edge.
  AlignmentAttribute get centerRight =>
      const AlignmentAttribute(Alignment.centerRight);

  /// The bottom left corner.
  AlignmentAttribute get bottomLeft =>
      const AlignmentAttribute(Alignment.bottomLeft);

  /// The center point along the bottom edge.
  AlignmentAttribute get bottomCenter =>
      const AlignmentAttribute(Alignment.bottomCenter);

  /// The bottom right corner.
  AlignmentAttribute get bottomRight =>
      const AlignmentAttribute(Alignment.bottomRight);
}

/// Alignment Attribute
class AlignmentAttribute extends Attribute<Alignment> {
  const AlignmentAttribute(this.alignment);

  final Alignment alignment;
  @override
  Alignment get value => alignment;
}
