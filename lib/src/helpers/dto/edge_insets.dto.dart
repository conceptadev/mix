import 'package:flutter/material.dart';

import '../../theme/mix_theme.dart';
import 'double.dto.dart';
import 'dto.dart';

abstract class EdgeInsetsGeometryDto<T extends EdgeInsetsGeometry>
    extends Dto<T> {
  const EdgeInsetsGeometryDto();

  DoubleDto? get _top;
  DoubleDto? get _bottom;
  DoubleDto? get _left;
  DoubleDto? get _right;
  DoubleDto? get _start;
  DoubleDto? get _end;

  bool get _isDirectional =>
      (_start != null || _end != null) && (_left == null && _right == null);

  static EdgeInsetsGeometryDto from(EdgeInsetsGeometry insets) {
    if (insets is EdgeInsets) {
      return EdgeInsetsDto.from(insets);
    }
    if (insets is EdgeInsetsDirectional) {
      return EdgeInsetsDirectionalDto.from(insets);
    }

    throw UnsupportedError(
      "${insets.runtimeType} is not suppported, use EdgeInsets or EdgeInsetsDirectional",
    );
  }

  EdgeInsetsGeometryDto merge(EdgeInsetsGeometryDto? other) {
    if (other == null) return this;

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
  String toString() {
    if (_top == _bottom && _bottom == _left && _left == _right) {
      return 'EdgeInsets.all($_left)';
    }
    if (_isDirectional) {
      return 'EdgeInsetsDirectionalDto(top: $_top, bottom: $_bottom, start: $_start, end: $_end)';
    }

    return 'EdgeInsetsDto(top: $_top, bottom: $_bottom, left: $_left, right: $_right)';
  }
}

class EdgeInsetsDto extends EdgeInsetsGeometryDto<EdgeInsets> {
  final DoubleDto? top;
  final DoubleDto? bottom;
  final DoubleDto? left;
  final DoubleDto? right;

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

  const EdgeInsetsDto.all(DoubleDto value)
      : this._(
          top: value,
          bottom: value,
          left: value,
          right: value,
        );

  const EdgeInsetsDto.symmetric({
    DoubleDto? horizontal,
    DoubleDto? vertical,
  }) : this._(
          top: vertical,
          bottom: vertical,
          left: horizontal,
          right: horizontal,
        );

  factory EdgeInsetsDto.from(EdgeInsets edgeInsets) {
    return EdgeInsetsDto._(
      top: _nullIfZero(edgeInsets.top),
      bottom: _nullIfZero(edgeInsets.bottom),
      left: _nullIfZero(edgeInsets.left),
      right: _nullIfZero(edgeInsets.right),
    );
  }

  static EdgeInsetsDto? fromNullable(EdgeInsets? edgeInsets) {
    if (edgeInsets == null) return null;

    return EdgeInsetsDto.from(edgeInsets);
  }

  @override
  DoubleDto? get _top => top;

  @override
  DoubleDto? get _bottom => bottom;

  @override
  DoubleDto? get _left => left;

  @override
  DoubleDto? get _right => right;

  @override
  DoubleDto? get _start => null;

  @override
  DoubleDto? get _end => null;

  EdgeInsetsDto copyWith({
    DoubleDto? top,
    DoubleDto? bottom,
    DoubleDto? left,
    DoubleDto? right,
  }) {
    return EdgeInsetsDto._(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }

  @override
  EdgeInsets resolve(BuildContext context) {
    final spacing = MixTheme.of(context).space;

    // TODO: Clean this up

    return EdgeInsets.only(
      top: spacing.fromValue(_top?.resolve(context)) ?? 0.0,
      bottom: spacing.fromValue(_bottom?.resolve(context)) ?? 0.0,
      left: spacing.fromValue(_left?.resolve(context)) ?? 0.0,
      right: spacing.fromValue(_right?.resolve(context)) ?? 0.0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EdgeInsetsDto &&
        other.top == _top &&
        other.bottom == _bottom &&
        other.left == _left &&
        other.right == _right;
  }

  @override
  int get hashCode {
    return _top.hashCode ^ _bottom.hashCode ^ _left.hashCode ^ _right.hashCode;
  }
}

class EdgeInsetsDirectionalDto
    extends EdgeInsetsGeometryDto<EdgeInsetsDirectional> {
  final DoubleDto? top;
  final DoubleDto? bottom;
  final DoubleDto? start;
  final DoubleDto? end;

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

  const EdgeInsetsDirectionalDto.all(DoubleDto value)
      : this._(
          top: value,
          bottom: value,
          start: value,
          end: value,
        );

  const EdgeInsetsDirectionalDto.symmetric({
    DoubleDto? horizontal,
    DoubleDto? vertical,
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
      top: _nullIfZero(edgeInsets.top),
      bottom: _nullIfZero(edgeInsets.bottom),
      start: _nullIfZero(edgeInsets.start),
      end: _nullIfZero(edgeInsets.end),
    );
  }

  @override
  DoubleDto? get _top => top;

  @override
  DoubleDto? get _bottom => bottom;

  @override
  DoubleDto? get _left => null;

  @override
  DoubleDto? get _right => null;

  @override
  DoubleDto? get _start => start;

  @override
  DoubleDto? get _end => end;

  EdgeInsetsDirectionalDto copyWith({
    DoubleDto? top,
    DoubleDto? bottom,
    DoubleDto? start,
    DoubleDto? end,
  }) {
    return EdgeInsetsDirectionalDto._(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  EdgeInsetsDirectional resolve(BuildContext context) {
    final spacing = MixTheme.of(context).space;

    return EdgeInsetsDirectional.only(
      top: spacing.fromValue(_top?.resolve(context)) ?? 0.0,
      bottom: spacing.fromValue(_bottom?.resolve(context)) ?? 0.0,
      start: spacing.fromValue(_start?.resolve(context)) ?? 0.0,
      end: spacing.fromValue(_end?.resolve(context)) ?? 0.0,
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

DoubleDto? _nullIfZero(double? value) {
  if (value == null || value == 0.0) return null;

  return DoubleDto(value);
}
