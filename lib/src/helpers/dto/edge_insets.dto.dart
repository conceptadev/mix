import 'package:flutter/material.dart';

import '../../theme/mix_theme.dart';
import 'dto.dart';

abstract class EdgeInsetsGeometryDto extends Dto<EdgeInsetsGeometry> {
  const EdgeInsetsGeometryDto();

  double? get _top;
  double? get _bottom;
  double? get _left;
  double? get _right;
  double? get _start;
  double? get _end;

  bool get _isDirectional =>
      (_start != null || _end != null) && (_left == null && _right == null);

  @override
  EdgeInsetsGeometry resolve(BuildContext context) {
    final spacing = MixTheme.of(context).space;
    final top = spacing.fromValue(_top) ?? 0.0;
    final bottom = spacing.fromValue(_bottom) ?? 0.0;

    if (_isDirectional) {
      return EdgeInsetsDirectional.only(
        top: top,
        bottom: bottom,
        start: spacing.fromValue(_start) ?? 0.0,
        end: spacing.fromValue(_end) ?? 0.0,
      );
    }

    return EdgeInsets.only(
      top: top,
      bottom: bottom,
      left: spacing.fromValue(_left) ?? 0.0,
      right: spacing.fromValue(_right) ?? 0.0,
    );
  }

  EdgeInsetsGeometryDto merge(EdgeInsetsGeometryDto? other) {
    if (other == null || other == this) return this;

    if (other is EdgeInsetsDirectionalDto) {
      return EdgeInsetsDirectionalDto._(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        start: other.start ?? _start,
        end: other.end ?? _end,
      );
    }
    if (other is EdgeInsetsDto) {
      return EdgeInsetsDto._(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        left: other.left ?? _left,
        right: other.right ?? _right,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is not supported, use EdgeInsetsDto or EdgeInsetsDirectionalDto",
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (_isDirectional) {
      return other is EdgeInsetsDirectionalDto &&
          other.top == _top &&
          other.bottom == _bottom &&
          other.start == _start &&
          other.bottom == _bottom;
    }

    return other is EdgeInsetsDto &&
        other.top == _top &&
        other.bottom == _bottom &&
        other.left == _left &&
        other.right == _right;
  }

  @override
  int get hashCode {
    return _top.hashCode ^
        _bottom.hashCode ^
        (_isDirectional
            ? _start.hashCode ^ _end.hashCode
            : _left.hashCode ^ _right.hashCode);
  }

  @override
  String toString() {
    if (_isDirectional) {
      return 'EdgeInsetsDirectionalDto(top: $_top, bottom: $_bottom, start: $_start, end: $_end)';
    } else {
      return 'EdgeInsetsDto(top: $_top, bottom: $_bottom, left: $_left, right: $_right)';
    }
  }
}

class EdgeInsetsDto extends EdgeInsetsGeometryDto {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const EdgeInsetsDto._({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  const EdgeInsetsDto.only({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  const EdgeInsetsDto.all(double value)
      : this._(
          top: value,
          bottom: value,
          left: value,
          right: value,
        );

  const EdgeInsetsDto.symmetric({
    double? horizontal,
    double? vertical,
  }) : this._(
          top: vertical,
          bottom: vertical,
          left: horizontal,
          right: horizontal,
        );

  factory EdgeInsetsDto.fromEdgeInsets(EdgeInsets edgeInsets) {
    return EdgeInsetsDto._(
      top: _nullIfZero(edgeInsets.top),
      bottom: _nullIfZero(edgeInsets.bottom),
      left: _nullIfZero(edgeInsets.left),
      right: _nullIfZero(edgeInsets.right),
    );
  }

  @override
  double? get _top => top;

  @override
  double? get _bottom => bottom;

  @override
  double? get _left => left;

  @override
  double? get _right => right;

  @override
  double? get _start => null;

  @override
  double? get _end => null;

  EdgeInsetsDto copyWith({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsetsDto._(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }
}

class EdgeInsetsDirectionalDto extends EdgeInsetsGeometryDto {
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;

  const EdgeInsetsDirectionalDto._({
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  const EdgeInsetsDirectionalDto.only({
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  const EdgeInsetsDirectionalDto.all(double value)
      : this._(
          top: value,
          bottom: value,
          start: value,
          end: value,
        );

  const EdgeInsetsDirectionalDto.symmetric({
    double? horizontal,
    double? vertical,
  }) : this._(
          top: vertical,
          bottom: vertical,
          start: horizontal,
          end: horizontal,
        );

  factory EdgeInsetsDirectionalDto.fromEdgeInsets(
    EdgeInsetsDirectional edgeInsets,
  ) {
    return EdgeInsetsDirectionalDto._(
      top: _nullIfZero(edgeInsets.top),
      bottom: _nullIfZero(edgeInsets.bottom),
      start: _nullIfZero(edgeInsets.start),
      end: _nullIfZero(edgeInsets.end),
    );
  }

  @override
  double? get _top => top;

  @override
  double? get _bottom => bottom;

  @override
  double? get _left => null;

  @override
  double? get _right => null;

  @override
  double? get _start => start;

  @override
  double? get _end => end;

  EdgeInsetsDirectionalDto copyWith({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return EdgeInsetsDirectionalDto._(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}

double? _nullIfZero(double? value) {
  if (value == 0.0) return null;

  return value;
}
