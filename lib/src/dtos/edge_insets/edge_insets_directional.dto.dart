import 'package:flutter/material.dart';

import '../../theme/mix_theme.dart';
import 'edge_insets_geometry.dto.dart';

class EdgeInsetsDirectionalDto
    extends EdgeInsetsGeometryDto<EdgeInsetsDirectional> {
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

  factory EdgeInsetsDirectionalDto.from(
    EdgeInsetsDirectional edgeInsets,
  ) {
    return EdgeInsetsDirectionalDto._(
      top: doubleNullIfZero(edgeInsets.top),
      bottom: doubleNullIfZero(edgeInsets.bottom),
      start: doubleNullIfZero(edgeInsets.start),
      end: doubleNullIfZero(edgeInsets.end),
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

  @override
  EdgeInsetsDirectionalDto merge(EdgeInsetsDirectionalDto? other) {
    if (other == null) return this;

    return copyWith(
      top: other.top,
      bottom: other.bottom,
      start: other.start,
      end: other.end,
    );
  }

  @override
  EdgeInsetsDirectional resolve(BuildContext context) {
    final spacing = MixTheme.of(context).space;

    return EdgeInsetsDirectional.only(
      top: spacing.fromValue(_top) ?? 0.0,
      bottom: spacing.fromValue(_bottom) ?? 0.0,
      start: spacing.fromValue(_start) ?? 0.0,
      end: spacing.fromValue(_end) ?? 0.0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EdgeInsetsDirectionalDto &&
        other.top == _top &&
        other.bottom == _bottom &&
        other.start == _start &&
        other.end == _end;
  }

  @override
  int get hashCode {
    return _top.hashCode ^ _bottom.hashCode ^ _start.hashCode ^ _end.hashCode;
  }
}
