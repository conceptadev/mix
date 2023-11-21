import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';
import 'scalar_util.dart';

const border = BorderUtility(BoxBorderAttribute.from);

typedef BorderSideUtilityFn = BorderSideDto Function({
  Color? color,
  double? width,
  BorderStyle? style,
});

class BorderSideUtility extends MixUtility<BoxBorderAttribute, BorderSideDto> {
  const BorderSideUtility(super.builder);

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

    return builder(side);
  }
}

class BorderUtility extends MixUtility<BoxBorderAttribute, BoxBorderDto> {
  const BorderUtility(super.builder);

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
  BoxBorderAttribute only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    assert((right == null && left == null) || (start == null && end == null),
        'Cannot have both right and left and start and end parameters');

    BoxBorderDto dto;
    dto = start != null || end != null
        ? BorderDirectionalDto(
            start: start,
            end: end,
            top: top,
            bottom: bottom,
          )
        : BorderDto(top: top, bottom: bottom, left: left, right: right);
    return builder(dto);
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
    final dto = BorderDto.symmetric(horizontal: side);

    return builder(dto);
  }

  BoxBorderAttribute _vertical(BorderSideDto side) {
    final dto = BorderDto.symmetric(vertical: side);

    return builder(dto);
  }
}
