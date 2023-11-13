import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class AlignmentGeometryAttribute<T extends AlignmentGeometry>
    extends VisualAttribute<T> {
  final double? start;
  final double? x;
  final double? y;

  const AlignmentGeometryAttribute({this.start, this.x, this.y});

  @override
  AlignmentGeometryAttribute<T> merge(
    covariant AlignmentGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);

  @override
  get props => [start, x, y];
}

@immutable
class AlignmentAttribute extends AlignmentGeometryAttribute<Alignment> {
  /// The top left corner.
  static const topLeft = AlignmentAttribute.pos(-1.0, -1.0);

  /// The center point along the top edge.
  static const topCenter = AlignmentAttribute.pos(0.0, -1.0);

  /// The top right corner.
  static const topRight = AlignmentAttribute.pos(1.0, -1.0);

  /// The center point along the left edge.
  static const centerLeft = AlignmentAttribute.pos(-1.0, 0.0);

  /// The center point, both horizontally and vertically.
  static const center = AlignmentAttribute.pos(0.0, 0.0);

  /// The center point along the right edge.
  static const centerRight = AlignmentAttribute.pos(1.0, 0.0);

  /// The bottom left corner.
  static const bottomLeft = AlignmentAttribute.pos(-1.0, 1.0);

  /// The center point along the bottom edge.
  static const bottomCenter = AlignmentAttribute.pos(0.0, 1.0);

  /// The bottom right corner.
  static const bottomRight = AlignmentAttribute.pos(1.0, 1.0);

  const AlignmentAttribute({super.x, super.y});

  const AlignmentAttribute.pos(double x, double y) : this(x: x, y: y);

  @override
  AlignmentAttribute merge(AlignmentAttribute? other) {
    return AlignmentAttribute(x: other?.x ?? x, y: other?.y ?? y);
  }

  @override
  Alignment resolve(MixData mix) => Alignment(x ?? 0, y ?? 0);
}

@immutable
class AlignmentDirectionalAttribute
    extends AlignmentGeometryAttribute<AlignmentDirectional> {
  /// The top corner on the "start" side.
  static const topStart = AlignmentDirectionalAttribute.pos(-1.0, -1.0);

  /// The center point along the top edge.
  ///
  /// Consider using [Alignment.topCenter] instead, as it does not need
  /// to be [resolve]d to be used.
  static const topCenter = AlignmentDirectionalAttribute.pos(0.0, -1.0);

  /// The top corner on the "end" side.
  static const topEnd = AlignmentDirectionalAttribute.pos(1.0, -1.0);

  /// The center point along the "start" edge.
  static const centerStart = AlignmentDirectionalAttribute.pos(-1.0, 0.0);

  /// The center point, both horizontally and vertically.
  ///
  /// Consider using [Alignment.center] instead, as it does not need to
  /// be [resolve]d to be used.
  static const center = AlignmentDirectionalAttribute.pos(0.0, 0.0);

  /// The center point along the "end" edge.
  static const centerEnd = AlignmentDirectionalAttribute.pos(1.0, 0.0);

  /// The bottom corner on the "start" side.
  static const bottomStart = AlignmentDirectionalAttribute.pos(-1.0, 1.0);

  /// The center point along the bottom edge.
  ///
  /// Consider using [Alignment.bottomCenter] instead, as it does not
  /// need to be [resolve]d to be used.
  static const bottomCenter = AlignmentDirectionalAttribute.pos(0.0, 1.0);

  /// The bottom corner on the "end" side.
  static const bottomEnd = AlignmentDirectionalAttribute.pos(1.0, 1.0);

  const AlignmentDirectionalAttribute({super.start, super.y});

  const AlignmentDirectionalAttribute.pos(double start, double y)
      : this(start: start, y: y);
  @override
  AlignmentDirectionalAttribute merge(AlignmentDirectionalAttribute? other) {
    return AlignmentDirectionalAttribute(
      start: other?.start ?? start,
      y: other?.y ?? y,
    );
  }

  @override
  AlignmentDirectional resolve(MixData mix) =>
      AlignmentDirectional(start ?? 0, y ?? 0);
}
