import 'package:flutter/material.dart';

import '../base_attribute.dart';

class AlignmentUtility {
  /// The top left  corner.
  AlignmentAttribute get topLeft => AlignmentAttribute(Alignment.topLeft);

  /// The top right corner.
  AlignmentAttribute get topRight => AlignmentAttribute(Alignment.topRight);

  /// The center point along the top edge.
  AlignmentAttribute get topCenter => AlignmentAttribute(Alignment.topCenter);

  /// The center point along the left edge.
  AlignmentAttribute get centerLeft => AlignmentAttribute(Alignment.centerLeft);

  /// The center point, both horizontally and vertically.
  AlignmentAttribute get center => AlignmentAttribute(Alignment.center);

  /// The center point along the right edge.
  AlignmentAttribute get centerRight =>
      AlignmentAttribute(Alignment.centerRight);

  /// The bottom left corner.
  AlignmentAttribute get bottomLeft => AlignmentAttribute(Alignment.bottomLeft);

  /// The center point along the bottom edge.
  AlignmentAttribute get bottomCenter =>
      AlignmentAttribute(Alignment.bottomCenter);

  /// The bottom right corner.
  AlignmentAttribute get bottomRight =>
      AlignmentAttribute(Alignment.bottomRight);
}

/// Alignment Attribute
class AlignmentAttribute extends Attribute<Alignment> {
  const AlignmentAttribute(this.alignment);

  final Alignment alignment;

  Alignment get value => alignment;
}
