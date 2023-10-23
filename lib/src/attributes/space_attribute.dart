import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/style_attribute.dart';
import '../factory/exports.dart';

abstract class SpaceAttribute extends StyleAttribute<EdgeInsetsGeometry> {
  final EdgeInsetsDto edgeInsets;
  const SpaceAttribute(this.edgeInsets);

  @override
  get props => [edgeInsets];
}

class EdgeInsetsDto extends Dto<EdgeInsetsGeometry> {
  final double? _top;
  final double? _bottom;
  final double? _left;
  final double? _right;

  // Directional
  final double? _start;
  final double? _end;

  const EdgeInsetsDto({
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

  const EdgeInsetsDto.only({
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

  const EdgeInsetsDto.directionalOnly({
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

  const EdgeInsetsDto.all(double value)
      : _top = value,
        _bottom = value,
        _left = value,
        _right = value,
        _start = null,
        _end = null;

  const EdgeInsetsDto.directionalAll(double value)
      : _top = value,
        _bottom = value,
        _start = value,
        _end = value,
        _left = null,
        _right = null;

  const EdgeInsetsDto.symmetric({double? horizontal, double? vertical})
      : _top = vertical,
        _bottom = vertical,
        _left = horizontal,
        _right = horizontal,
        _start = null,
        _end = null;

  const EdgeInsetsDto.directionalSymmetric({
    double? horizontal,
    double? vertical,
  })  : _top = vertical,
        _bottom = vertical,
        _start = horizontal,
        _end = horizontal,
        _left = null,
        _right = null;

  factory EdgeInsetsDto.from(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsets) {
      return EdgeInsetsDto.only(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
      );
    }

    if (edgeInsets is EdgeInsetsDirectional) {
      return EdgeInsetsDto.directionalOnly(
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
  EdgeInsetsDto merge(EdgeInsetsDto? other) {
    if (other == null) return this;

    if (other._isDirectional != _isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return EdgeInsetsDto(
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
    final resolvedTop = mix.resolver.space(_top ?? 0.0);
    final resolvedBottom = mix.resolver.space(_bottom ?? 0.0);

    return _isDirectional
        ? EdgeInsetsDirectional.only(
            start: mix.resolver.space(_start ?? 0.0),
            top: resolvedTop,
            end: mix.resolver.space(_end ?? 0.0),
            bottom: resolvedBottom,
          )
        : EdgeInsets.only(
            left: mix.resolver.space(_left ?? 0.0),
            top: resolvedTop,
            right: mix.resolver.space(_right ?? 0.0),
            bottom: resolvedBottom,
          );
  }

  @override
  get props => [_top, _bottom, _left, _right, _start, _end];
}

class PaddingAttribute extends SpaceAttribute {
  const PaddingAttribute(super.edgeInsets);

  factory PaddingAttribute.from(EdgeInsetsGeometry edgeInsets) {
    return PaddingAttribute(EdgeInsetsDto.from(edgeInsets));
  }

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    if (other == null) return this;

    return PaddingAttribute(edgeInsets.merge(other.edgeInsets));
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    return edgeInsets.resolve(mix);
  }
}

class MarginAttribute extends SpaceAttribute {
  const MarginAttribute(super.edgeInsets);

  factory MarginAttribute.from(EdgeInsetsGeometry edgeInsets) {
    return MarginAttribute(EdgeInsetsDto.from(edgeInsets));
  }

  @override
  MarginAttribute merge(MarginAttribute? other) {
    if (other == null) return this;

    return MarginAttribute(edgeInsets.merge(other.edgeInsets));
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    return edgeInsets.resolve(mix);
  }
}
