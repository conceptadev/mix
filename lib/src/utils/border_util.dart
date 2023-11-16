import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';

const border = BorderUtility();

typedef BorderSideUtilityFn = BorderSideAttribute Function({
  Color? color,
  double? width,
  BorderStyle? style,
});

class BorderSideUtility<T extends BoxBorderAttribute> {
  final T Function(BorderSideAttribute side) fn;

  const BorderSideUtility(this.fn);

  T color(Color color) => call(color: color);

  T width(double width) => call(width: width);

  T style(BorderStyle style) => call(style: style);

  T strokeAlign(double strokeAlign) => call(strokeAlign: strokeAlign);

  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return fn(side);
  }
}

class BorderUtility {
  const BorderUtility();

  BorderSideUtility<BorderAttribute> get all => BorderSideUtility(_all);
  BorderSideUtility<BorderAttribute> get bottom => BorderSideUtility(_bottom);

  BorderSideUtility<BorderAttribute> get top => BorderSideUtility(_top);

  BorderSideUtility<BorderAttribute> get left => BorderSideUtility(_left);

  BorderSideUtility<BorderAttribute> get right => BorderSideUtility(_right);

  BorderSideUtility<BorderAttribute> get horizontal =>
      BorderSideUtility(_horizontal);

  BorderSideUtility<BorderAttribute> get vertical =>
      BorderSideUtility(_vertical);

  BorderSideUtility<BorderDirectionalAttribute> get start =>
      BorderSideUtility(_start);

  BorderSideUtility<BorderDirectionalAttribute> get end =>
      BorderSideUtility(_end);

  // Only method
  BorderAttribute only({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
  }) {
    return BorderAttribute(left: left, right: right, top: top, bottom: bottom);
  }

  BorderAttribute call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return BorderAttribute.all(side);
  }

  // Unified border for all sides
  BorderAttribute _all(BorderSideAttribute side) {
    return BorderAttribute.all(side);
  }

  // Specific sides
  BorderAttribute _top(BorderSideAttribute side) {
    return BorderAttribute(top: side);
  }

  BorderAttribute _bottom(BorderSideAttribute side) {
    return BorderAttribute(bottom: side);
  }

  BorderAttribute _left(BorderSideAttribute side) {
    return BorderAttribute(left: side);
  }

  BorderAttribute _right(BorderSideAttribute side) {
    return BorderAttribute(right: side);
  }

  BorderDirectionalAttribute _start(BorderSideAttribute side) {
    return BorderDirectionalAttribute(start: side);
  }

  BorderDirectionalAttribute _end(BorderSideAttribute side) {
    return BorderDirectionalAttribute(end: side);
  }

  // Symetric sides
  BorderAttribute _horizontal(BorderSideAttribute side) {
    return BorderAttribute.symmetric(horizontal: side);
  }

  BorderAttribute _vertical(BorderSideAttribute side) {
    return BorderAttribute.symmetric(vertical: side);
  }
}
