import 'package:flutter/material.dart';

import '../../dtos/dto.dart';
import '../../factory/exports.dart';

class PaddingAttribute extends ResolvableAttribute<EdgeInsetsGeometry> {
  final double? _top;
  final double? _bottom;
  final double? _left;
  final double? _right;
  final double? _start;
  final double? _end;

  const PaddingAttribute({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  })  : _top = top,
        _bottom = bottom,
        _left = left,
        _right = right,
        _start = start,
        _end = end;

  const PaddingAttribute.only({
    double? top,
    double? bottom,
    double? left,
    double? right,
  })  : _top = top,
        _bottom = bottom,
        _left = left,
        _right = right,
        _start = null,
        _end = null;

  const PaddingAttribute.directionalOnly({
    double? top,
    double? bottom,
    double? start,
    double? end,
  })  : _top = top,
        _bottom = bottom,
        _start = start,
        _end = end,
        _left = null,
        _right = null;

  const PaddingAttribute.all(double value)
      : _top = value,
        _bottom = value,
        _left = value,
        _right = value,
        _start = null,
        _end = null;

  const PaddingAttribute.directionalAll(double value)
      : _top = value,
        _bottom = value,
        _start = value,
        _end = value,
        _left = null,
        _right = null;

  const PaddingAttribute.symmetric({double? horizontal, double? vertical})
      : _top = vertical,
        _bottom = vertical,
        _left = horizontal,
        _right = horizontal,
        _start = null,
        _end = null;

  const PaddingAttribute.directionalSymmetric({
    double? horizontal,
    double? vertical,
  })  : _top = vertical,
        _bottom = vertical,
        _start = horizontal,
        _end = horizontal,
        _left = null,
        _right = null;

  factory PaddingAttribute.edgeInsets(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsets) {
      return PaddingAttribute.only(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
      );
    }

    if (edgeInsets is EdgeInsetsDirectional) {
      return PaddingAttribute.directionalOnly(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        start: edgeInsets.start,
        end: edgeInsets.end,
      );
    }

    throw UnsupportedError(
      "${edgeInsets.runtimeType} is not suppported, use EdgeInsets or EdgeInsetsDirectional",
    );
  }

  @visibleForTesting
  double? get top => _top;

  @visibleForTesting
  double? get bottom => _bottom;

  @visibleForTesting
  double? get left => _left;

  @visibleForTesting
  double? get right => _right;

  @visibleForTesting
  double? get start => _start;

  @visibleForTesting
  double? get end => _end;

  bool get _isDirectional => _start != null || _end != null;

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional padding attributes",
      );
    }

    return PaddingAttribute(
      top: other._top ?? _top,
      bottom: other._bottom ?? _bottom,
      left: other._left ?? _left,
      right: other._right ?? _right,
      start: other._start ?? _start,
      end: other._end ?? _end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    final top = mix.resolveToken.space(_top ?? 0.0);
    final bottom = mix.resolveToken.space(_bottom ?? 0.0);

    return _isDirectional
        ? EdgeInsetsDirectional.only(
            start: mix.resolveToken.space(_start ?? 0.0),
            top: top,
            end: mix.resolveToken.space(_end ?? 0.0),
            bottom: bottom,
          )
        : EdgeInsets.only(
            left: mix.resolveToken.space(_left ?? 0.0),
            top: top,
            right: mix.resolveToken.space(_right ?? 0.0),
            bottom: bottom,
          );
  }

  @override
  get props => [_top, _bottom, _left, _right, _start, _end];
}
