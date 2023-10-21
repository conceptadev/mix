// ignore_for_file: no-equal-arguments

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'border/border_side.dto.dart';
import 'style_attribute.dart';

class BoxBorderAttribute extends StyleAttribute<BoxBorder> {
  final BorderSideDto? _top;
  final BorderSideDto? _right;

  final BorderSideDto? _bottom;
  final BorderSideDto? _left;

// Directional properties.
  final BorderSideDto? _start;
  final BorderSideDto? _end;

  const BoxBorderAttribute._({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
    BorderSideDto? start,
    BorderSideDto? end,
  })  : _bottom = bottom,
        _left = left,
        _right = right,
        _top = top,
        _start = start,
        _end = end;

  const BoxBorderAttribute.only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  })  : _bottom = bottom,
        _left = left,
        _right = right,
        _top = top,
        _start = null,
        _end = null;

  const BoxBorderAttribute.directionalOnly({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? start,
    BorderSideDto? end,
  })  : _bottom = bottom,
        _left = null,
        _right = null,
        _top = top,
        _start = start,
        _end = end;

  const BoxBorderAttribute.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  })  : _bottom = vertical,
        _left = horizontal,
        _right = horizontal,
        _top = vertical,
        _start = null,
        _end = null;

  const BoxBorderAttribute.fromSide(BorderSideDto side)
      : _bottom = side,
        _left = side,
        _right = side,
        _top = side,
        _start = null,
        _end = null;

  factory BoxBorderAttribute.from(BoxBorder border) {
    if (border is Border) {
      return BoxBorderAttribute._(
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
        left: BorderSideDto.from(border.left),
        right: BorderSideDto.from(border.right),
      );
    }

    if (border is BorderDirectional) {
      return BoxBorderAttribute._(
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
        start: BorderSideDto.from(border.start),
        end: BorderSideDto.from(border.end),
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
