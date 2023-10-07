// ignore_for_file: no-equal-arguments

import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';
import 'border_side_attribute.dart';

class BoxBorderAttribute extends ResolvableAttribute<BoxBorder> {
  final BorderSideAttribute? _top;
  final BorderSideAttribute? _right;

  final BorderSideAttribute? _bottom;
  final BorderSideAttribute? _left;

// Directional properties.
  final BorderSideAttribute? _start;
  final BorderSideAttribute? _end;

  const BoxBorderAttribute._({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
    BorderSideAttribute? start,
    BorderSideAttribute? end,
  })  : _bottom = bottom,
        _left = left,
        _right = right,
        _top = top,
        _start = start,
        _end = end;

  const BoxBorderAttribute.only({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
  })  : _bottom = bottom,
        _left = left,
        _right = right,
        _top = top,
        _start = null,
        _end = null;

  const BoxBorderAttribute.directionalOnly({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? start,
    BorderSideAttribute? end,
  })  : _bottom = bottom,
        _left = null,
        _right = null,
        _top = top,
        _start = start,
        _end = end;

  const BoxBorderAttribute.symmetric({
    BorderSideAttribute? vertical,
    BorderSideAttribute? horizontal,
  })  : _bottom = vertical,
        _left = horizontal,
        _right = horizontal,
        _top = vertical,
        _start = null,
        _end = null;

  const BoxBorderAttribute.fromSide(BorderSideAttribute side)
      : _bottom = side,
        _left = side,
        _right = side,
        _top = side,
        _start = null,
        _end = null;

  factory BoxBorderAttribute.from(BoxBorder border) {
    if (border is Border) {
      return BoxBorderAttribute._(
        top: BorderSideAttribute.from(border.top),
        bottom: BorderSideAttribute.from(border.bottom),
        left: BorderSideAttribute.from(border.left),
        right: BorderSideAttribute.from(border.right),
      );
    }

    if (border is BorderDirectional) {
      return BoxBorderAttribute._(
        top: BorderSideAttribute.from(border.top),
        bottom: BorderSideAttribute.from(border.bottom),
        start: BorderSideAttribute.from(border.start),
        end: BorderSideAttribute.from(border.end),
      );
    }

    throw UnsupportedError(
      "${border.runtimeType} is not suppported, use Border or BorderDirectional",
    );
  }

  bool get _isDirectional => _start != null || _end != null;

  @override
  BoxBorderAttribute merge(covariant BoxBorderAttribute? other) {
    if (other == null || other == this) return this;

    if (_isDirectional != other._isDirectional) {
      throw ArgumentError(
        "Cannot merge directional and non-directional borders",
      );
    }

    return BoxBorderAttribute._(
      top: _top?.merge(other._top) ?? other._top,
      bottom: _bottom?.merge(other._bottom) ?? other._bottom,
      left: _left?.merge(other._left) ?? other._left,
      right: _right?.merge(other._right) ?? other._right,
      start: _start?.merge(other._start) ?? other._start,
      end: _end?.merge(other._end) ?? other._end,
    );
  }

  @override
  BoxBorder resolve(MixData mix) {
    return _isDirectional
        ? BorderDirectional(
            top: _top?.resolve(mix) ?? BorderSide.none,
            start: _start?.resolve(mix) ?? BorderSide.none,
            end: _end?.resolve(mix) ?? BorderSide.none,
            bottom: _bottom?.resolve(mix) ?? BorderSide.none,
          )
        : Border(
            top: _top?.resolve(mix) ?? BorderSide.none,
            right: _right?.resolve(mix) ?? BorderSide.none,
            bottom: _bottom?.resolve(mix) ?? BorderSide.none,
            left: _left?.resolve(mix) ?? BorderSide.none,
          );
  }

  @override
  get props => [_top, _right, _bottom, _left, _start, _end];
}
