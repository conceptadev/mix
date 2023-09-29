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
    this.bottom,
    this.end,
    this.start,
    this.top,
  });

  const EdgeInsetsDirectionalDto.only({
    this.bottom,
    this.end,
    this.start,
    this.top,
  });

  const EdgeInsetsDirectionalDto.all(double value)
      : this._(bottom: value, end: value, start: value, top: value);

  const EdgeInsetsDirectionalDto.symmetric({
    double? horizontal,
    double? vertical,
  }) : this._(
          bottom: vertical,
          end: horizontal,
          start: horizontal,
          top: vertical,
        );

  factory EdgeInsetsDirectionalDto.from(EdgeInsetsDirectional edgeInsets) {
    return EdgeInsetsDirectionalDto._(
      bottom: doubleNullIfZero(edgeInsets.bottom),
      end: doubleNullIfZero(edgeInsets.end),
      start: doubleNullIfZero(edgeInsets.start),
      top: doubleNullIfZero(edgeInsets.top),
    );
  }

  @override
  get props => [top, bottom, start, end];
  double? get _top => top;

  double? get _bottom => bottom;

  /*
  double? get _left => null;

  double? get _right => null;
  */

  double? get _start => start;

  double? get _end => end;

  EdgeInsetsDirectionalDto copyWith({
    double? bottom,
    double? end,
    double? start,
    double? top,
  }) {
    return EdgeInsetsDirectionalDto._(
      bottom: bottom ?? this.bottom,
      end: end ?? this.end,
      start: start ?? this.start,
      top: top ?? this.top,
    );
  }

  @override
  EdgeInsetsDirectionalDto merge(EdgeInsetsDirectionalDto? other) {
    if (other == null) return this;

    return copyWith(
      bottom: other.bottom,
      end: other.end,
      start: other.start,
      top: other.top,
    );
  }

  @override
  EdgeInsetsDirectional resolve(MixData mix) {
    return EdgeInsetsDirectional.only(
      start: mix.resolveToken.space(_start ?? 0.0),
      top: mix.resolveToken.space(_top ?? 0.0),
      end: mix.resolveToken.space(_end ?? 0.0),
      bottom: mix.resolveToken.space(_bottom ?? 0.0),
    );
  }
}
