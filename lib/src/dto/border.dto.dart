import 'package:flutter/material.dart';
import 'package:mix/src/dto/dto.dart';

class BorderDto extends Dto<Border> {
  final BorderSideProps? top;
  final BorderSideProps? right;
  final BorderSideProps? bottom;
  final BorderSideProps? left;

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

  const BorderDto.fromBorderSide(BorderSideProps side)
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
      BorderSideProps.only(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  factory BorderDto.fromBorder(Border border) {
    return BorderDto.only(
      top: BorderSideProps.fromBorderSide(border.top),
      right: BorderSideProps.fromBorderSide(border.right),
      bottom: BorderSideProps.fromBorderSide(border.bottom),
      left: BorderSideProps.fromBorderSide(border.left),
    );
  }

  BorderSide _createEachSide(BuildContext context, BorderSideProps? side) {
    if (side == null) {
      return BorderSide.none;
    }
    return side.create(context);
  }

  @override
  Border create(BuildContext context) {
    return Border(
      top: _createEachSide(context, top),
      right: _createEachSide(context, right),
      bottom: _createEachSide(context, bottom),
      left: _createEachSide(context, left),
    );
  }

  BorderDto merge(BorderDto? other) {
    if (other == null) return this;

    return copyWith(
      top: other.top,
      right: other.right,
      bottom: other.bottom,
      left: other.left,
    );
  }

  BorderDto copyWith({
    BorderSideProps? top,
    BorderSideProps? right,
    BorderSideProps? bottom,
    BorderSideProps? left,
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

class BorderSideProps extends Dto<BorderSide> {
  final Color? color;
  final double? width;
  final BorderStyle? style;

  const BorderSideProps._({
    this.color,
    this.width,
    this.style,
  });

  const BorderSideProps.only({
    this.color,
    this.width,
    this.style,
  });

  factory BorderSideProps.fromBorderSide(BorderSide side) {
    return BorderSideProps.only(
      color: side.color,
      width: side.width,
      style: side.style,
    );
  }

  BorderSideProps copyWith({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideProps._(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
    );
  }

  BorderSideProps merge(BorderSideProps? other) {
    if (other == null) return this;
    return BorderSideProps._(
      color: other.color ?? color,
      width: other.width ?? width,
      style: other.style ?? style,
    );
  }

  final BorderSide _default = const BorderSide();

  @override
  BorderSide create(BuildContext context) {
    return BorderSide(
      color: color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }

  @override
  String toString() =>
      'BorderSideProps(color: $color, width: $width, style: $style)';
}
