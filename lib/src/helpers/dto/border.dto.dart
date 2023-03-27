import 'dart:math';

import 'package:flutter/material.dart';

import '../../../mix.dart';
import 'color.dto.dart';
import 'dto.dart';

abstract class BoxBorderDto<T extends BoxBorder> extends Dto<T> {
  const BoxBorderDto();

  BorderSideDto? get _top;
  BorderSideDto? get _right;
  BorderSideDto? get _bottom;
  BorderSideDto? get _left;
  BorderSideDto? get _start;
  BorderSideDto? get _end;

  static BoxBorderDto from(BoxBorder border) {
    if (border is Border) {
      return BorderDto.from(border);
    }
    if (border is BorderDirectional) {
      return BorderDirectionalDto.from(border);
    }

    throw UnsupportedError(
      "${border.runtimeType} is not suppported, use Border or BorderDirectional",
    );
  }

  static BoxBorderDto? maybeFrom(BoxBorder? border) {
    if (border == null) {
      return null;
    }

    return from(border);
  }

  BorderSide _resolveEachSide(BuildContext context, BorderSideDto? side) {
    if (side == null) {
      return BorderSide.none;
    }

    return side.resolve(context);
  }

  BoxBorderDto merge(BoxBorderDto? other) {
    if (other == null || other == this) return this;

    if (other is BorderDirectionalDto) {
      return BorderDirectionalDto._(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        start: other.start ?? _start,
        end: other.end ?? _end,
      );
    }

    if (other is BorderDto) {
      return BorderDto._(
        top: other.top ?? _top,
        bottom: other.bottom ?? _bottom,
        left: other.left ?? _left,
        right: other.right ?? _right,
      );
    }

    throw UnsupportedError(
      "${other.runtimeType} is not supported, use EdgeInsetsDto or EdgeInsetsDirectionalDto",
    );
  }
}

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

  // Used mostly for testing
  factory BorderDto.random() {
    return BorderDto.only(
      top: BorderSideDto.random(),
      right: BorderSideDto.random(),
      bottom: BorderSideDto.random(),
      left: BorderSideDto.random(),
    );
  }

  @override
  BorderSideDto? get _top => top;

  @override
  BorderSideDto? get _bottom => bottom;

  @override
  BorderSideDto? get _left => left;

  @override
  BorderSideDto? get _right => right;

  @override
  BorderSideDto? get _start => null;

  @override
  BorderSideDto? get _end => null;

  @override
  BorderSide _resolveEachSide(BuildContext context, BorderSideDto? side) {
    if (side == null) {
      return BorderSide.none;
    }

    return side.resolve(context);
  }

  @override
  Border resolve(BuildContext context) {
    return Border(
      top: _resolveEachSide(context, top),
      right: _resolveEachSide(context, right),
      bottom: _resolveEachSide(context, bottom),
      left: _resolveEachSide(context, left),
    );
  }

  BorderDto copyWith({
    BorderSideDto? top,
    BorderSideDto? right,
    BorderSideDto? bottom,
    BorderSideDto? left,
  }) {
    return BorderDto._(
      top: this.top?.merge(top) ?? top,
      right: this.right?.merge(right) ?? right,
      bottom: this.bottom?.merge(bottom) ?? bottom,
      left: this.left?.merge(left) ?? left,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderDto &&
        other.top == top &&
        other.right == right &&
        other.bottom == bottom &&
        other.left == left;
  }

  @override
  int get hashCode {
    return top.hashCode ^ right.hashCode ^ bottom.hashCode ^ left.hashCode;
  }

  @override
  String toString() {
    return 'BorderProps(top: $top, right: $right, bottom: $bottom, left: $left)';
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

  @override
  BorderSideDto? get _top => top;

  @override
  BorderSideDto? get _bottom => bottom;

  @override
  BorderSideDto? get _left => null;

  @override
  BorderSideDto? get _right => null;

  @override
  BorderSideDto? get _start => start;

  @override
  BorderSideDto? get _end => end;

  @override
  BorderDirectional resolve(BuildContext context) {
    return BorderDirectional(
      top: _resolveEachSide(context, top),
      bottom: _resolveEachSide(context, bottom),
      start: _resolveEachSide(context, start),
      end: _resolveEachSide(context, end),
    );
  }

  BorderDirectionalDto copyWith({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return BorderDirectionalDto._(
      top: this.top?.merge(top) ?? top,
      bottom: this.bottom?.merge(bottom) ?? bottom,
      start: this.start?.merge(start) ?? start,
      end: this.end?.merge(end) ?? end,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderDirectionalDto &&
        other.top == top &&
        other.bottom == bottom &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    return top.hashCode ^ bottom.hashCode ^ start.hashCode ^ end.hashCode;
  }

  @override
  String toString() {
    return 'BorderDirectionalDto(top: $top, bottom: $bottom, right: $start, left: $end)';
  }
}

class BorderSideDto extends Dto<BorderSide> {
  final ColorDto? color;
  final double? width;
  final BorderStyle? style;

  const BorderSideDto._({
    this.color,
    this.width,
    this.style,
  });

  const BorderSideDto.only({
    this.color,
    this.width,
    this.style,
  });

  factory BorderSideDto.fromBorderSide(BorderSide side) {
    return BorderSideDto.only(
      color: ColorDto(side.color),
      width: side.width,
      style: side.style,
    );
  }

  factory BorderSideDto.random() {
    return BorderSideDto.only(
      color: ColorDto.random(),
      width: Random().nextDouble() * 4,
      style: BorderStyle.values.random(),
    );
  }

  BorderSideDto copyWith({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideDto._(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
    );
  }

  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return this;

    return BorderSideDto._(
      color: other.color ?? color,
      width: other.width ?? width,
      style: other.style ?? style,
    );
  }

  final BorderSide _default = const BorderSide();

  @override
  BorderSide resolve(BuildContext context) {
    return BorderSide(
      color: color?.resolve(context) ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }

  @override
  String toString() =>
      'BorderSideProps(color: $color, width: $width, style: $style)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderSideDto &&
        other.color == color &&
        other.width == width &&
        other.style == style;
  }

  @override
  int get hashCode {
    return color.hashCode ^ width.hashCode ^ style.hashCode;
  }
}
