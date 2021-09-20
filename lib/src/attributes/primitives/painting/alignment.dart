import 'package:flutter/material.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class AlignmentUtility {
  const AlignmentUtility();

  /// The top left  corner.
  AlignmentAttribute topLeft() => AlignmentAttribute(Alignment.topLeft);

  /// The top right corner.
  AlignmentAttribute topRight() => AlignmentAttribute(Alignment.topRight);

  /// The center point along the top edge.
  AlignmentAttribute topCenter() => AlignmentAttribute(Alignment.topCenter);

  /// The center point along the left edge.
  AlignmentAttribute centerLeft() => AlignmentAttribute(Alignment.centerLeft);

  /// The center point, both horizontally and vertically.
  AlignmentAttribute center() => AlignmentAttribute(Alignment.center);

  /// The center point along the right edge.
  AlignmentAttribute centerRight() => AlignmentAttribute(Alignment.centerRight);

  /// The bottom left corner.
  AlignmentAttribute bottomLeft() => AlignmentAttribute(Alignment.bottomLeft);

  /// The center point along the bottom edge.
  AlignmentAttribute bottomCenter() =>
      AlignmentAttribute(Alignment.bottomCenter);

  /// The bottom right corner.
  AlignmentAttribute bottomRight() => AlignmentAttribute(Alignment.bottomRight);
}

/// Alignment Attribute
class AlignmentAttribute extends Attribute<Alignment>
    with AnimatedMix<Alignment> {
  AlignmentAttribute(this.alignment);

  final Alignment alignment;
  @override
  Alignment get value => alignment;
}
