import 'package:flutter/material.dart';

import '../dto.dart';
import 'edge_insets.dto.dart';
import 'edge_insets_directional.dto.dart';

abstract class EdgeInsetsGeometryDto<T extends EdgeInsetsGeometry>
    extends ResolvableAttribute<T> {
  const EdgeInsetsGeometryDto();
  @Deprecated('Dont use this anymore')
  static D
      from<T extends EdgeInsetsGeometry, D extends EdgeInsetsGeometryDto<T>>(
    T edgeInsets,
  ) {
    if (edgeInsets is EdgeInsets) {
      return EdgeInsetsDto.from(edgeInsets) as D;
    }
    if (edgeInsets is EdgeInsetsDirectional) {
      return EdgeInsetsDirectionalDto.from(edgeInsets) as D;
    }

    throw UnsupportedError(
      "${edgeInsets.runtimeType} is not suppported, use EdgeInsets or EdgeInsetsDirectional",
    );
  }

  @Deprecated('Dont use this anymore')
  static D? maybeFrom<T extends EdgeInsetsGeometry,
      D extends EdgeInsetsGeometryDto<T>>(T? edgeInsets) {
    if (edgeInsets == null) return null;

    return from(edgeInsets);
  }

  double? get _top;
  double? get _bottom;
  double? get _left;
  double? get _right;
  double? get _start;
  double? get _end;

  @override
  EdgeInsetsGeometryDto merge(covariant EdgeInsetsGeometryDto? other) {
    if (other == null) return this;

    if (other is EdgeInsetsDirectionalDto && this is EdgeInsetsDirectionalDto) {
      return EdgeInsetsDirectionalDto.only(
        bottom: other.bottom ?? _bottom,
        end: other.end ?? _end,
        start: other.start ?? _start,
        top: other.top ?? _top,
      );
    }
    if (other is EdgeInsetsDto && this is EdgeInsetsDto) {
      return EdgeInsetsDto.only(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        left: other.left ?? _left,
        right: other.right ?? _right,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is not supported, use EdgeInsetsDto or EdgeInsetsDirectionalDto, and both mergeable types must be the same",
    );
  }

  @override
  get props => [_top, _bottom, _left, _right, _start, _end];
}

double? doubleNullIfZero(double? value) {
  if (value == null || value == 0.0) return null;

  return value;
}
