import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class AlignmentGeometryDto<Value extends AlignmentGeometry>
    extends Dto<Value> {
  final double? _x;
  final double? _y;
  final double? _start;

  const AlignmentGeometryDto({double? x, double? y, double? start})
      : _start = start,
        _y = y,
        _x = x;

  /// Determines the mergeable alignment type.
  ///
  /// Returns the alignment type if both alignments are of the same type.
  /// Returns AlignmentDto if the current alignment has a defined x value and the other alignment lacks a start value.
  /// Returns AligmentDirectionalDto if the current alignment has a defined start value and the other alignment lacks an x value.
  /// Returns null if none of these conditions are met.
  Type? canMergeType(covariant AlignmentGeometryDto other) {
    if (other is AlignmentDto && this is AlignmentDto) return AlignmentDto;
    if (other is AligmentDirectionalDto && this is AligmentDirectionalDto) {
      return AligmentDirectionalDto;
    }

    if (_x != null && other._start == null) return AlignmentDto;
    if (_start != null && other._x == null) return AligmentDirectionalDto;

    return null;
  }

  @override
  Value resolve(MixData mix) {
    if (this is AlignmentDto) {
      return Alignment(_x ?? 0.0, _y ?? 0.0) as Value;
    }

    if (this is AligmentDirectionalDto) {
      return AlignmentDirectional(_start ?? 0.0, _y ?? 0.0) as Value;
    }

    throw UnimplementedError('Cannot resolve $this');
  }

  @override
  AlignmentGeometryDto merge(covariant AlignmentGeometryDto? other) {
    if (other == null) return this;

    final mergeableType = canMergeType(other);

    if (mergeableType == AlignmentDto) {
      return AlignmentDto(x: other._x ?? _x, y: other._y ?? _y);
    }

    if (mergeableType == AligmentDirectionalDto) {
      return AligmentDirectionalDto(
        start: other._start ?? _start,
        y: other._y ?? _y,
      );
    }

    // If cannot be merge it will just override
    return other;
  }

  @override
  get props => [_x, _y, _start];
}

@immutable
class AlignmentDto extends AlignmentGeometryDto<Alignment> {
  const AlignmentDto({super.x, super.y});
}

@immutable
class AligmentDirectionalDto
    extends AlignmentGeometryDto<AlignmentDirectional> {
  const AligmentDirectionalDto({super.start, super.y});

  @override
  AlignmentDirectional resolve(MixData mix) {
    return AlignmentDirectional(_start ?? 0.0, _y ?? 0.0);
  }

  @override
  AligmentDirectionalDto merge(covariant AligmentDirectionalDto? other) {
    return AligmentDirectionalDto(
      start: other?._start ?? _start,
      y: other?._y ?? _y,
    );
  }
}

@immutable
abstract class AlignmentGeometryAttribute<T extends AlignmentGeometryDto<Value>,
    Value extends AlignmentGeometry> extends DtoStyleAttribute<T, Value> {
  const AlignmentGeometryAttribute(super.value);

  static AlignmentGeometryAttribute from(AlignmentGeometryDto dto) {
    if (dto is AlignmentDto) return AlignmentAttribute(dto);

    if (dto is AligmentDirectionalDto) {
      return AlignmentDirectionalAttribute(dto);
    }

    throw UnimplementedError(
      'Cannot create AlignmentGeometryAttribute from $dto',
    );
  }

  @visibleForTesting
  double? get x => value._x;

  @visibleForTesting
  double? get y => value._y;

  @visibleForTesting
  double? get start => value._start;
  @override
  AlignmentGeometryAttribute merge(
    covariant AlignmentGeometryAttribute? other,
  ) {
    return other == null ? this : from(value.merge(other.value));
  }

  @override
  Value resolve(MixData mix) => value.resolve(mix);
}

@immutable
class AlignmentAttribute
    extends AlignmentGeometryAttribute<AlignmentDto, Alignment> {
  const AlignmentAttribute(super.value);
}

@immutable
class AlignmentDirectionalAttribute extends AlignmentGeometryAttribute<
    AligmentDirectionalDto, AlignmentDirectional> {
  const AlignmentDirectionalAttribute(super.value);
}
