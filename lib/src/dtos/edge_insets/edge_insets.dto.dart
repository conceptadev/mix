import 'package:flutter/material.dart';

import '../../theme/mix_theme.dart';
import 'edge_insets_geometry.dto.dart';

class EdgeInsetsDto extends EdgeInsetsGeometryDto<EdgeInsets> {
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

  factory EdgeInsetsDto.from(EdgeInsets edgeInsets) {
    return EdgeInsetsDto._(
      top: doubleNullIfZero(edgeInsets.top),
      bottom: doubleNullIfZero(edgeInsets.bottom),
      left: doubleNullIfZero(edgeInsets.left),
      right: doubleNullIfZero(edgeInsets.right),
    );
  }

  // Helper utility for internal API use and cleaner conditional checking
  static EdgeInsetsDto? maybeFrom(EdgeInsets? edgeInsets) {
    if (edgeInsets == null) return null;

    return EdgeInsetsDto.from(edgeInsets);
  }

  double? get _top => top;

  double? get _bottom => bottom;

  double? get _left => left;

  double? get _right => right;

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

  @override
  EdgeInsetsDto merge(EdgeInsetsDto? other) {
    if (other == null) return this;

    return copyWith(
      top: other.top,
      bottom: other.bottom,
      left: other.left,
      right: other.right,
    );
  }

  @override
  EdgeInsets resolve(BuildContext context) {
    final spacing = MixTheme.of(context).space;

    // TODO: Clean this up

    return EdgeInsets.only(
      top: spacing.fromValue(_top) ?? 0.0,
      bottom: spacing.fromValue(_bottom) ?? 0.0,
      left: spacing.fromValue(_left) ?? 0.0,
      right: spacing.fromValue(_right) ?? 0.0,
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
