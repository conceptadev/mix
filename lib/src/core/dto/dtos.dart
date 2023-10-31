import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

class EdgeInsetsGeometryDto extends Dto<EdgeInsetsGeometry> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  final bool isDirectional;

  const EdgeInsetsGeometryDto({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
    this.isDirectional = false,
  });

  const EdgeInsetsGeometryDto.all(double all, {this.isDirectional = false})
      : top = all,
        bottom = all,
        left = all,
        right = all,
        start = all,
        end = all;

  const EdgeInsetsGeometryDto.symmetric({
    double? vertical,
    double? horizontal,
    this.isDirectional = false,
  })  : top = vertical,
        bottom = vertical,
        left = horizontal,
        right = horizontal,
        start = horizontal,
        end = horizontal;

  @override
  EdgeInsetsGeometryDto merge(EdgeInsetsGeometryDto? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return EdgeInsetsGeometryDto(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
      start: other.start ?? start,
      end: other.end ?? end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: start ?? defalutDirectionalvalue.start,
            top: top ?? defalutDirectionalvalue.top,
            end: end ?? defalutDirectionalvalue.end,
            bottom: bottom ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: left ?? defaultValue.left,
            top: top ?? defaultValue.top,
            right: right ?? defaultValue.right,
            bottom: bottom ?? defaultValue.bottom,
          );
  }

  @override
  get props => [top, bottom, left, right, start, end];
}

class SpaceGeometryDto extends EdgeInsetsGeometryDto {
  const SpaceGeometryDto({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
    super.isDirectional = false,
  });

  const SpaceGeometryDto.all(double all, {super.isDirectional = false})
      : super.all(all);

  factory SpaceGeometryDto.positional(
    double p1, [
    double? p2,
    double? p3,
    double? p4,
  ]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) right = p4;

    return SpaceGeometryDto(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      start: left,
      end: right,
    );
  }

  const SpaceGeometryDto.symmetric({
    double? vertical,
    double? horizontal,
    super.isDirectional = false,
  }) : super.symmetric(vertical: vertical, horizontal: horizontal);

  SpaceGeometryDto get toDirectional => copyWith(isDirectional: true);

  SpaceGeometryDto copyWith({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
    bool? isDirectional,
  }) {
    return SpaceGeometryDto(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
      start: start ?? this.start,
      end: end ?? this.end,
      isDirectional: isDirectional ?? this.isDirectional,
    );
  }

  @override
  SpaceGeometryDto merge(SpaceGeometryDto? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return SpaceGeometryDto(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
      start: other.start ?? start,
      end: other.end ?? end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: start ?? defalutDirectionalvalue.start,
            top: top ?? defalutDirectionalvalue.top,
            end: end ?? defalutDirectionalvalue.end,
            bottom: bottom ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: left ?? defaultValue.left,
            top: top ?? defaultValue.top,
            right: right ?? defaultValue.right,
            bottom: bottom ?? defaultValue.bottom,
          );
  }
}

class AlignmentGeometryDto extends Dto<AlignmentGeometry> {
  final double? _start;
  final double? _x;
  final double? _y;

  const AlignmentGeometryDto({double? start, double? x, double? y})
      : _start = start,
        _x = x,
        _y = y;

  @visibleForTesting
  double? get start => _start;

  @visibleForTesting
  double? get x => _x;

  @visibleForTesting
  double? get y => _y;

  bool get _isDirectional => _start != null;

  @override
  AlignmentGeometryDto merge(AlignmentGeometryDto? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional alignment attributes",
      );
    }

    return AlignmentGeometryDto(
      start: other._start ?? _start,
      x: other._x ?? _x,
      y: other._y ?? _y,
    );
  }

  @override
  AlignmentGeometry resolve(MixData mix) {
    return _isDirectional
        ? AlignmentDirectional(_start ?? 0.0, _y ?? 0.0)
        : Alignment(_x ?? 0.0, _y ?? 0.0);
  }

  @override
  get props => [_start, _x, _y];
}
