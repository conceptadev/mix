import 'package:flutter/material.dart';
import 'package:mix/src/mappers/class_properties.dart';

class BorderProps extends Properties<Border> {
  final BorderSideProps? top;
  final BorderSideProps? right;
  final BorderSideProps? bottom;
  final BorderSideProps? left;

  const BorderProps._({
    this.bottom,
    this.left,
    this.right,
    this.top,
  });

  const BorderProps.only({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  const BorderProps.fromBorderSide(BorderSideProps side)
      : this.only(
          top: side,
          right: side,
          bottom: side,
          left: side,
        );

  factory BorderProps.all({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderProps.fromBorderSide(
      BorderSideProps.only(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  factory BorderProps.fromBorder(Border border) {
    return BorderProps.only(
      top: BorderSideProps.fromBorderSide(border.top),
      right: BorderSideProps.fromBorderSide(border.right),
      bottom: BorderSideProps.fromBorderSide(border.bottom),
      left: BorderSideProps.fromBorderSide(border.left),
    );
  }

  BorderSide _createEachSide(BorderSideProps? side) {
    if (side == null) {
      return BorderSide.none;
    }
    return side.create();
  }

  @override
  Border create() {
    return Border(
      top: _createEachSide(top),
      right: _createEachSide(right),
      bottom: _createEachSide(bottom),
      left: _createEachSide(left),
    );
  }

  BorderProps merge(BorderProps? other) {
    if (other == null) return this;

    return copyWith(
      top: other.top,
      right: other.right,
      bottom: other.bottom,
      left: other.left,
    );
  }

  BorderProps copyWith({
    BorderSideProps? top,
    BorderSideProps? right,
    BorderSideProps? bottom,
    BorderSideProps? left,
  }) {
    return BorderProps._(
      top: this.top?.merge(top) ?? top,
      right: this.right?.merge(right) ?? right,
      bottom: this.bottom?.merge(bottom) ?? bottom,
      left: this.left?.merge(left) ?? left,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderProps &&
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

class BorderSideProps extends Properties<BorderSide> {
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
  BorderSide create() {
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
