import 'package:flutter/material.dart';

import '../../theme/mix_theme.dart';
import 'double.dto.dart';
import 'dto.dart';

class EdgeInsetsDto extends Dto<EdgeInsets> {
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

  static DoubleDto? _nullIfZero(double? value) {
    // Edgeinsets set default value of 0.0
    if (value == null || value == 0.0) return null;

    return DoubleDto(value);
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
      top: spacing.fromValue(top?.resolve(context)) ?? 0.0,
      bottom: spacing.fromValue(bottom?.resolve(context)) ?? 0.0,
      left: spacing.fromValue(left?.resolve(context)) ?? 0.0,
      right: spacing.fromValue(right?.resolve(context)) ?? 0.0,
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
  String toString() {
    return 'EdgeInsetsDto(top: $top, bottom: $bottom, left: $left, right: $right)';
  }
}
