// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class AlignmentGeometryAttribute<T extends AlignmentGeometry>
    extends VisualAttribute<T> {
  const AlignmentGeometryAttribute();
  double? get _x;
  double? get _y;

  double? get _start;
  @override
  AlignmentGeometryAttribute<T> merge(
    covariant AlignmentGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);
}

@immutable
class AlignmentAttribute extends AlignmentGeometryAttribute<Alignment> {
  /// The top left corner.
  static const topLeft = AlignmentAttribute(-1.0, -1.0);

  /// The center point along the top edge.
  static const topCenter = AlignmentAttribute(0.0, -1.0);

  /// The top right corner.
  static const topRight = AlignmentAttribute(1.0, -1.0);

  /// The center point along the left edge.
  static const centerLeft = AlignmentAttribute(-1.0, 0.0);

  /// The center point, both horizontally and vertically.
  static const center = AlignmentAttribute(0.0, 0.0);

  /// The center point along the right edge.
  static const centerRight = AlignmentAttribute(1.0, 0.0);

  /// The bottom left corner.
  static const bottomLeft = AlignmentAttribute(-1.0, 1.0);

  /// The center point along the bottom edge.
  static const bottomCenter = AlignmentAttribute(0.0, 1.0);

  /// The bottom right corner.
  static const bottomRight = AlignmentAttribute(1.0, 1.0);

  final double y;

  final double x;

  const AlignmentAttribute(this.x, this.y);

  @override
  double get _x => x;

  @override
  double get _y => y;

  @override
  double get _start => 0.0;

  @override
  AlignmentAttribute merge(AlignmentAttribute? other) {
    return AlignmentAttribute(other?.x ?? x, other?.y ?? y);
  }

  @override
  Alignment resolve(MixData mix) => Alignment(x, y);

  @override
  get props => [x, y];
}

@immutable
class AlignmentDirectionalAttribute
    extends AlignmentGeometryAttribute<AlignmentDirectional> {
  /// The top corner on the "start" side.
  static const topStart = AlignmentDirectionalAttribute(-1.0, -1.0);

  /// The center point along the top edge.
  ///
  /// Consider using [Alignment.topCenter] instead, as it does not need
  /// to be [resolve]d to be used.
  static const topCenter = AlignmentDirectionalAttribute(0.0, -1.0);

  /// The top corner on the "end" side.
  static const topEnd = AlignmentDirectionalAttribute(1.0, -1.0);

  /// The center point along the "start" edge.
  static const centerStart = AlignmentDirectionalAttribute(-1.0, 0.0);

  /// The center point, both horizontally and vertically.
  ///
  /// Consider using [Alignment.center] instead, as it does not need to
  /// be [resolve]d to be used.
  static const center = AlignmentDirectionalAttribute(0.0, 0.0);

  /// The center point along the "end" edge.
  static const centerEnd = AlignmentDirectionalAttribute(1.0, 0.0);

  /// The bottom corner on the "start" side.
  static const bottomStart = AlignmentDirectionalAttribute(-1.0, 1.0);

  /// The center point along the bottom edge.
  ///
  /// Consider using [Alignment.bottomCenter] instead, as it does not
  /// need to be [resolve]d to be used.
  static const bottomCenter = AlignmentDirectionalAttribute(0.0, 1.0);

  /// The bottom corner on the "end" side.
  static const bottomEnd = AlignmentDirectionalAttribute(1.0, 1.0);

  final double y;
  final double start;
  const AlignmentDirectionalAttribute(this.start, this.y);

  @override
  double get _y => y;

  @override
  double get _start => start;

  @override
  double get _x => 0.0;

  @override
  AlignmentDirectionalAttribute merge(AlignmentDirectionalAttribute? other) {
    return AlignmentDirectionalAttribute(
      other?.start ?? start,
      other?.y ?? y,
    );
  }

  @override
  AlignmentDirectional resolve(MixData mix) => AlignmentDirectional(start, y);
  @override
  get props => [start, y];
}
