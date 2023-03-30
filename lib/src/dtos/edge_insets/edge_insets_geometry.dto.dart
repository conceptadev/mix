import 'package:flutter/material.dart';

import '../../helpers/equatable_mixin.dart';
import '../dto.dart';
import 'edge_insets.dto.dart';
import 'edge_insets_directional.dto.dart';

abstract class EdgeInsetsGeometryDto<T extends EdgeInsetsGeometry>
    extends Dto<T> with EquatableMixin {
  const EdgeInsetsGeometryDto();

  double? get _top;
  double? get _bottom;
  double? get _left;
  double? get _right;
  double? get _start;
  double? get _end;

  bool get _isDirectional =>
      (_start != null || _end != null) && (_left == null && _right == null);

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

  static D? maybeFrom<T extends EdgeInsetsGeometry,
      D extends EdgeInsetsGeometryDto<T>>(
    T? edgeInsets,
  ) {
    if (edgeInsets == null) return null;

    return from(edgeInsets);
  }

  EdgeInsetsGeometryDto merge(covariant EdgeInsetsGeometryDto? other) {
    if (other == null) return this;

    if (other is EdgeInsetsDirectionalDto && this is EdgeInsetsDirectionalDto) {
      return EdgeInsetsDirectionalDto.only(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        start: other.start ?? _start,
        end: other.end ?? _end,
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

double? doubleNullIfZero(double? value) {
  if (value == null || value == 0.0) return null;

  return value;
}
