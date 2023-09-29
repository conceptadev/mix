import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../color.dto.dart';
import 'border_side.dto.dart';
import 'box_border.dto.dart';

class BorderDto extends BoxBorderDto<Border> {
  final BorderSideDto? top;
  final BorderSideDto? right;
  final BorderSideDto? bottom;
  final BorderSideDto? left;

  const BorderDto._({this.bottom, this.left, this.right, this.top});

  const BorderDto.only({this.top, this.right, this.bottom, this.left});

  const BorderDto.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) : this.only(
          top: vertical,
          right: horizontal,
          bottom: vertical,
          left: horizontal,
        );

  const BorderDto.fromBorderSide(BorderSideDto side)
      : this.only(top: side, right: side, bottom: side, left: side);

  factory BorderDto.all({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderDto.fromBorderSide(
      BorderSideDto.only(color: color, width: width, style: style),
    );
  }

  factory BorderDto.from(Border border) {
    return BorderDto.only(
      top: BorderSideDto.from(border.top),
      right: BorderSideDto.from(border.right),
      bottom: BorderSideDto.from(border.bottom),
      left: BorderSideDto.from(border.left),
    );
  }

  @override
  get props => [_top, _right, _bottom, _left];
  BorderSideDto? get _top => top;

  BorderSideDto? get _bottom => bottom;

  BorderSideDto? get _left => left;

  BorderSideDto? get _right => right;

  @override
  Border resolve(MixData mix) {
    return Border(
      top: _top?.resolve(mix) ?? BorderSide.none,
      right: _right?.resolve(mix) ?? BorderSide.none,
      bottom: _bottom?.resolve(mix) ?? BorderSide.none,
      left: _left?.resolve(mix) ?? BorderSide.none,
    );
  }

  BorderDto copyWith({
    BorderSideDto? top,
    BorderSideDto? right,
    BorderSideDto? bottom,
    BorderSideDto? left,
  }) {
    return BorderDto._(
      bottom: _bottom?.merge(bottom) ?? bottom,
      left: _left?.merge(left) ?? left,
      right: _right?.merge(right) ?? right,
      top: _top?.merge(top) ?? top,
    );
  }
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
      top: BorderSideDto.from(border.top),
      bottom: BorderSideDto.from(border.bottom),
      start: BorderSideDto.from(border.start),
      end: BorderSideDto.from(border.end),
    );
  }

  const BorderDirectionalDto.only({
    this.top,
    this.bottom,
    this.start,
    this.end,
  });

  const BorderDirectionalDto.fromBorderSide(BorderSideDto side)
      : this.only(top: side, bottom: side, start: side, end: side);

  factory BorderDirectionalDto.all({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderDirectionalDto.fromBorderSide(
      BorderSideDto.only(color: color, width: width, style: style),
    );
  }

  factory BorderDirectionalDto.fromBorder(BorderDirectional border) {
    return BorderDirectionalDto.only(
      top: BorderSideDto.from(border.top),
      bottom: BorderSideDto.from(border.bottom),
      start: BorderSideDto.from(border.start),
      end: BorderSideDto.from(border.end),
    );
  }

  @override
  get props => [_top, _bottom, _start, _end];
  BorderSideDto? get _top => top;

  BorderSideDto? get _bottom => bottom;

  BorderSideDto? get _start => start;

  BorderSideDto? get _end => end;

  static BorderDirectionalDto? maybeFrom(BorderDirectional? border) {
    if (border == null) {
      return null;
    }

    return BorderDirectionalDto.from(border);
  }

  @override
  BorderDirectional resolve(MixData mix) {
    return BorderDirectional(
      top: _top?.resolve(mix) ?? BorderSide.none,
      start: _start?.resolve(mix) ?? BorderSide.none,
      end: _end?.resolve(mix) ?? BorderSide.none,
      bottom: _bottom?.resolve(mix) ?? BorderSide.none,
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
}
