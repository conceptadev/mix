import 'package:flutter/material.dart';
import 'dto.dart';
import '../../theme/mix_theme.dart';

class EdgeInsetsDto extends Dto<EdgeInsets> {
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

  static double? _nullIfZero(double? value) {
    if (value == 0.0) return null;

    return value;
  }

  factory EdgeInsetsDto.fromEdgeInsets(EdgeInsets edgeInsets) {
    return EdgeInsetsDto._(
      top: _nullIfZero(edgeInsets.top),
      bottom: _nullIfZero(edgeInsets.bottom),
      left: _nullIfZero(edgeInsets.left),
      right: _nullIfZero(edgeInsets.right),
    );
  }

  EdgeInsetsDto merge(EdgeInsetsDto? other) {
    if (other == null || other == this) return this;

    return EdgeInsetsDto._(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
    );
  }

  @override
  EdgeInsets resolve(BuildContext context) {
    final spacing = MixTheme.of(context).space;

    return EdgeInsets.only(
      top: spacing.fromValue(top) ?? 0.0,
      bottom: spacing.fromValue(bottom) ?? 0.0,
      left: spacing.fromValue(left) ?? 0.0,
      right: spacing.fromValue(right) ?? 0.0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EdgeInsetsDto &&
        other.top == top &&
        other.bottom == bottom &&
        other.left == left &&
        other.right == right;
  }

  @override
  int get hashCode {
    return top.hashCode ^ bottom.hashCode ^ left.hashCode ^ right.hashCode;
  }

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
  String toString() {
    return 'EdgeInsetsDto(top: $top, bottom: $bottom, left: $left, right: $right)';
  }
}
