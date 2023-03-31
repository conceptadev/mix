import 'package:flutter/material.dart';

import '../color.dto.dart';
import 'border_side.dto.dart';
import 'box_border.dto.dart';

class BorderDto extends BoxBorderDto<Border> {
  final BorderSideDto? top;
  final BorderSideDto? right;
  final BorderSideDto? bottom;
  final BorderSideDto? left;

  const BorderDto._({
    this.bottom,
    this.left,
    this.right,
    this.top,
  });

  const BorderDto.only({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  const BorderDto.fromBorderSide(BorderSideDto side)
      : this.only(
          top: side,
          right: side,
          bottom: side,
          left: side,
        );

  factory BorderDto.all({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderDto.fromBorderSide(
      BorderSideDto.only(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  factory BorderDto.from(Border border) {
    return BorderDto.only(
      top: BorderSideDto.fromBorderSide(border.top),
      right: BorderSideDto.fromBorderSide(border.right),
      bottom: BorderSideDto.fromBorderSide(border.bottom),
      left: BorderSideDto.fromBorderSide(border.left),
    );
  }

  BorderSideDto? get _top => top;

  BorderSideDto? get _bottom => bottom;

  BorderSideDto? get _left => left;

  BorderSideDto? get _right => right;

  @override
  Border resolve(BuildContext context) {
    return Border(
      top: _top?.resolve(context) ?? BorderSide.none,
      right: _right?.resolve(context) ?? BorderSide.none,
      bottom: _bottom?.resolve(context) ?? BorderSide.none,
      left: _left?.resolve(context) ?? BorderSide.none,
    );
  }

  BorderDto copyWith({
    BorderSideDto? top,
    BorderSideDto? right,
    BorderSideDto? bottom,
    BorderSideDto? left,
  }) {
    return BorderDto._(
      top: _top?.merge(top) ?? top,
      right: _right?.merge(right) ?? right,
      bottom: _bottom?.merge(bottom) ?? bottom,
      left: _left?.merge(left) ?? left,
    );
  }

  @override
  get props => [_top, _right, _bottom, _left];
}

class BorderDirectionalDto extends BoxBorderDto<BorderDirectional> {
  final BorderSideDto? top;
  final BorderSideDto? bottom;
  final BorderSideDto? start;
  final BorderSideDto? end;

  const BorderDirectionalDto._({
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  factory BorderDirectionalDto.from(BorderDirectional border) {
    return BorderDirectionalDto.only(
      top: BorderSideDto.fromBorderSide(border.top),
      bottom: BorderSideDto.fromBorderSide(border.bottom),
      start: BorderSideDto.fromBorderSide(border.start),
      end: BorderSideDto.fromBorderSide(border.end),
    );
  }

  static BorderDirectionalDto? maybeFrom(BorderDirectional? border) {
    if (border == null) {
      return null;
    }

    return BorderDirectionalDto.from(border);
  }

  const BorderDirectionalDto.only({
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  const BorderDirectionalDto.fromBorderSide(BorderSideDto side)
      : this.only(
          top: side,
          bottom: side,
          start: side,
          end: side,
        );

  factory BorderDirectionalDto.all({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderDirectionalDto.fromBorderSide(
      BorderSideDto.only(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  factory BorderDirectionalDto.fromBorder(BorderDirectional border) {
    return BorderDirectionalDto.only(
      top: BorderSideDto.fromBorderSide(border.top),
      bottom: BorderSideDto.fromBorderSide(border.bottom),
      start: BorderSideDto.fromBorderSide(border.start),
      end: BorderSideDto.fromBorderSide(border.end),
    );
  }

  BorderSideDto? get _top => top;

  BorderSideDto? get _bottom => bottom;

  BorderSideDto? get _start => start;

  BorderSideDto? get _end => end;

  @override
  BorderDirectional resolve(BuildContext context) {
    return BorderDirectional(
      top: _top?.resolve(context) ?? BorderSide.none,
      bottom: _bottom?.resolve(context) ?? BorderSide.none,
      start: _start?.resolve(context) ?? BorderSide.none,
      end: _end?.resolve(context) ?? BorderSide.none,
    );
  }

  BorderDirectionalDto copyWith({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return BorderDirectionalDto._(
      top: _top?.merge(top) ?? top,
      bottom: _bottom?.merge(bottom) ?? bottom,
      start: _start?.merge(start) ?? start,
      end: _end?.merge(end) ?? end,
    );
  }

  @override
  get props => [_top, _bottom, _start, _end];
}
