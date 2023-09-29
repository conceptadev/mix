import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
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

  double? get _top => top;

  double? get _bottom => bottom;

  /*
  double? get _left => null;

  double? get _right => null;
  */

  double? get _start => start;

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
  EdgeInsetsDirectional resolve(MixData mix) {
    return EdgeInsetsDirectional.only(
      top: mix.resolveToken.space(_top ?? 0.0),
      bottom: mix.resolveToken.space(_bottom ?? 0.0),
      start: mix.resolveToken.space(_start ?? 0.0),
      end: mix.resolveToken.space(_end ?? 0.0),
    );
  }

  @override
  get props => [top, bottom, start, end];
}
