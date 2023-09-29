import 'package:flutter/material.dart';

import '../dto.dart';
import 'border.dto.dart';
import 'border_side.dto.dart';

abstract class BoxBorderDto<T extends BoxBorder> extends Dto<T> {
  const BoxBorderDto();

  static D from<T extends BoxBorder, D extends BoxBorderDto<T>>(T border) {
    if (border is Border) {
      return BorderDto.from(border) as D;
    }
    if (border is BorderDirectional) {
      return BorderDirectionalDto.from(border) as D;
    }

    throw UnsupportedError(
      "${border.runtimeType} is not suppported, use Border or BorderDirectional",
    );
  }

  static D? maybeFrom<T extends BoxBorder, D extends BoxBorderDto<T>>(
    T? border,
  ) {
    return border == null ? null : from(border);
  }

  BorderSideDto? get _top;
  BorderSideDto? get _bottom;
  BorderSideDto? get _left;
  BorderSideDto? get _right;
  BorderSideDto? get _start;
  BorderSideDto? get _end;

  BoxBorderDto merge(BoxBorderDto? other) {
    if (other == null || other == this) return this;

    if (other is BorderDirectionalDto) {
      return BorderDirectionalDto.only(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        start: other.start ?? _start,
        end: other.end ?? _end,
      );
    }

    if (other is BorderDto) {
      return BorderDto.only(
        top: other.top ?? _top,
        right: other.right ?? _right,
        bottom: other.bottom ?? _bottom,
        left: other.left ?? _left,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is not supported, use EdgeInsetsDto or EdgeInsetsDirectionalDto",
    );
  }
}
