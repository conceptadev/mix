import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';

const border = BorderUtility();

typedef BorderSideUtilityFn = BorderSideDto Function({
  Color? color,
  double? width,
  BorderStyle? style,
});

class BorderSideUtility {
  final BoxBorderAttribute Function(BorderSideDto side) fn;

  const BorderSideUtility(this.fn);

  BoxBorderAttribute color(Color color) => call(color: color);

  BoxBorderAttribute width(double width) => call(width: width);

  BoxBorderAttribute style(BorderStyle style) => call(style: style);

  BoxBorderAttribute strokeAlign(double strokeAlign) =>
      call(strokeAlign: strokeAlign);

  BoxBorderAttribute call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideDto(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return fn(side);
  }
}

class BorderUtility<T extends BoxBorderAttribute<Dto, Value>,
    Dto extends BoxBorderDto<Value>, Value extends BoxBorder> {
  const BorderUtility();

  BorderSideUtility get all => BorderSideUtility(_all);
  BorderSideUtility get bottom => BorderSideUtility(_bottom);

  BorderSideUtility get top => BorderSideUtility(_top);

  BorderSideUtility get left => BorderSideUtility(_left);

  BorderSideUtility get right => BorderSideUtility(_right);

  BorderSideUtility get horizontal => BorderSideUtility(_horizontal);

  BorderSideUtility get vertical => BorderSideUtility(_vertical);

  BorderSideUtility get start => BorderSideUtility(_start);

  BorderSideUtility get end => BorderSideUtility(_end);

  // Only method
  BorderAttribute only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) {
    return BorderAttribute(
      BorderDto(left: left, right: right, top: top, bottom: bottom),
    );
  }

  BoxBorderAttribute call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideDto(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return _all(side);
  }

  // Unified border for all sides
  BoxBorderAttribute _all(BorderSideDto side) {
    return only(top: side, bottom: side, left: side, right: side);
  }

  // Specific sides
  BoxBorderAttribute _top(BorderSideDto side) {
    return only(top: side);
  }

  BoxBorderAttribute _bottom(BorderSideDto side) {
    return only(bottom: side);
  }

  BoxBorderAttribute _left(BorderSideDto side) {
    return only(left: side);
  }

  BoxBorderAttribute _right(BorderSideDto side) {
    return only(right: side);
  }

  BoxBorderAttribute _start(BorderSideDto side) {
    return only(start: side);
  }

  BoxBorderAttribute _end(BorderSideDto side) {
    return only(end: side);
  }

  // Symetric sides
  BoxBorderAttribute _horizontal(BorderSideDto side) {
    return BorderDto.symmetric(horizontal: side);
  }

  BoxBorderAttribute _vertical(BorderSideDto side) {
    return BoxBorderAttribute.symmetric(vertical: side);
  }
}
