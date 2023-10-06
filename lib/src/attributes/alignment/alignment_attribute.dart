import 'package:flutter/material.dart';

import '../../dtos/dto.dart';
import '../../factory/exports.dart';

class AlignmentAttribute extends ResolvableAttribute<AlignmentGeometry> {
  final double? x;
  final double? y;
  final double? start;

  // ignore: unused_element
  const AlignmentAttribute._({this.x, this.y, this.start});

  factory AlignmentAttribute.from(AlignmentGeometry alignment) {
    if (alignment is Alignment) {
      return AlignmentAttribute._(x: alignment.x, y: alignment.y);
    }

    if (alignment is AlignmentDirectional) {
      return AlignmentAttribute._(y: alignment.y, start: alignment.start);
    }

    throw UnsupportedError(
      'AlignmentAttribute.from only supports Alignment and AlignmentDirectional',
    );
  }

  bool get _isDirectional => start != null;

  @override
  AlignmentAttribute merge(AlignmentAttribute? other) {
    if (other == null) return this;

    if (_isDirectional != other._isDirectional) {
      throw ArgumentError('Cannot merge Aligment and AligmentDirectional');
    }

    return AlignmentAttribute._(
      x: other.x ?? x,
      y: other.y ?? y,
      start: other.start ?? start,
    );
  }

  @override
  AlignmentGeometry resolve(MixData _) {
    const defaultValue = 0.0;

    return _isDirectional
        ? AlignmentDirectional(start ?? defaultValue, y ?? defaultValue)
        : Alignment(x ?? defaultValue, y ?? defaultValue);
  }

  @override
  get props => [x, y, start];
}
