import 'package:flutter/material.dart';

class BorderSideProps {
  Color? color;
  double? width;
  BorderStyle? style;

  BorderSideProps({
    this.color,
    this.width,
    this.style,
  });

  BorderSideProps copyWith({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideProps(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
    );
  }

  BorderSideProps merge(BorderSideProps other) {
    return BorderSideProps(
      color: other.color ?? color,
      width: other.width ?? width,
      style: other.style ?? style,
    );
  }

  final BorderSide _default = const BorderSide();

  Border toBorder() {
    return Border.all(
      color: color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }

  BorderSide toBorderSide() {
    return BorderSide(
      color: color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }
}
