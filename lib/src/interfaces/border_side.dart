import 'package:flutter/material.dart';
import 'package:mix/src/interfaces/interface.dart';

class IBorderSide extends DataInterface<BorderSide> {
  const IBorderSide({
    this.color,
    this.width,
    this.style,
  });

  final Color? color;
  final double? width;
  final BorderStyle? style;

  IBorderSide merge(IBorderSide? other) {
    if (other == null) {
      return this;
    }
    return IBorderSide(
      color: other.color ?? color,
      width: other.width ?? width,
      style: other.style ?? style,
    );
  }

  final BorderSide _default = const BorderSide();

  @override
  BorderSide generate() {
    return BorderSide(
      color: color ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }
}
