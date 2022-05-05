import 'package:flutter/material.dart';
import 'package:mix/src/dto/dto.dart';
import 'package:mix/src/theme/refs/color_token.dart';

class BorderDto extends Dto<Border> {
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
    Color? color,
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

  factory BorderDto.fromBorder(Border border) {
    return BorderDto.only(
      top: BorderSideDto.fromBorderSide(border.top),
      right: BorderSideDto.fromBorderSide(border.right),
      bottom: BorderSideDto.fromBorderSide(border.bottom),
      left: BorderSideDto.fromBorderSide(border.left),
    );
  }

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

  BorderDto merge(BorderDto? other) {
    if (other == null || other == this) return this;

    return copyWith(
      top: other.top,
      right: other.right,
      bottom: other.bottom,
      left: other.left,
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

class BorderSideDto extends Dto<BorderSide> {
  final Color? color;
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
      color: side.color,
      width: side.width,
      style: side.style,
    );
  }

  BorderSideDto copyWith({
    Color? color,
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
    Color? _color = color;

    if (_color is ColorToken) {
      _color = _color.resolve(context);
    }

    return BorderSide(
      color: _color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }

  @override
  String toString() =>
      'BorderSideProps(color: $color, width: $width, style: $style)';
}
