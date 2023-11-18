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

  static AlignmentGeometryAttribute<T> from<T extends AlignmentGeometry>(
    T value,
  ) {
    if (value is Alignment) {
      return AlignmentAttribute(value.x, value.y)
          as AlignmentGeometryAttribute<T>;
    } else if (value is AlignmentDirectional) {
      return AlignmentDirectionalAttribute(value.start, value.y)
          as AlignmentGeometryAttribute<T>;
    } else {
      throw ArgumentError.value(
        value,
        'value',
        'AlignmentGeometryAttribute must be Alignment or AlignmentDirectional',
      );
    }
  }

  @override
  AlignmentGeometryAttribute<T> merge(
    covariant AlignmentGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);
}

@immutable
class AlignmentAttribute extends AlignmentGeometryAttribute<Alignment> {
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
