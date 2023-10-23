import 'package:flutter/material.dart';

import '../core/style_attribute.dart';
import '../factory/exports.dart';

abstract class AlignmentGeometryAttribute<T extends AlignmentGeometry>
    extends StyleAttribute<T> {
  const AlignmentGeometryAttribute();

  static AlignmentGeometryAttribute? maybeFrom(AlignmentGeometry? alignment) {
    return alignment == null ? null : from(alignment);
  }

  static AlignmentGeometryAttribute from(AlignmentGeometry alignment) {
    if (alignment is Alignment) {
      return AlignmentAttribute(x: alignment.x, y: alignment.y);
    }

    if (alignment is AlignmentDirectional) {
      return AlignmentDirectionalAttribute(
        start: alignment.start,
        y: alignment.y,
      );
    }

    throw UnsupportedError(
      'AlignmentAttribute.from only supports Alignment and AlignmentDirectional',
    );
  }

  @override
  AlignmentGeometryAttribute<T> merge(
    covariant AlignmentGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);
}

class AlignmentAttribute extends AlignmentGeometryAttribute<Alignment> {
  final double? x;
  final double? y;

  // ignore: unused_element
  const AlignmentAttribute({this.x, this.y});

  @override
  AlignmentAttribute merge(AlignmentAttribute? other) {
    if (other == null) return this;

    return AlignmentAttribute(x: other.x ?? x, y: other.y ?? y);
  }

  @override
  Alignment resolve(MixData mix) {
    const defaultValue = 0.0;

    return Alignment(x ?? defaultValue, y ?? defaultValue);
  }

  @override
  get props => [x, y];
}

class AlignmentDirectionalAttribute
    extends AlignmentGeometryAttribute<AlignmentDirectional> {
  final double? start;
  final double? y;

  // ignore: unused_element
  const AlignmentDirectionalAttribute({this.start, this.y});

  @override
  AlignmentDirectionalAttribute merge(AlignmentDirectionalAttribute? other) {
    if (other == null) return this;

    return AlignmentDirectionalAttribute(
      start: other.start ?? start,
      y: other.y ?? y,
    );
  }

  @override
  AlignmentDirectional resolve(MixData mix) {
    const defaultValue = 0.0;

    return AlignmentDirectional(start ?? defaultValue, y ?? defaultValue);
  }

  @override
  get props => [start, y];
}
