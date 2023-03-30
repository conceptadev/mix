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
      : top = value,
        bottom = value,
        left = value,
        right = value;

  const EdgeInsetsDto.symmetric({
    double? horizontal,
    double? vertical,
  })  : top = vertical,
        bottom = vertical,
        left = horizontal,
        right = horizontal;

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
    final tokenResolver = MixTokenResolver(context);

    return EdgeInsets.only(
      top: tokenResolver.space(_top ?? 0.0),
      bottom: tokenResolver.space(_bottom ?? 0.0),
      left: tokenResolver.space(_left ?? 0.0),
      right: tokenResolver.space(_right ?? 0.0),
    );
  }

  @override
  List<Object?> get props => [top, bottom, left, right];
}
