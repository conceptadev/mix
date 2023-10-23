// ignore_for_file: no-equal-arguments

import 'package:flutter/material.dart';

import '../attributes/box_border_attribute.dart';
import '../core/dto/border_side_dto.dart';
import '../core/dto/color_dto.dart';

BoxBorderAttribute border({Color? color, double? width, BorderStyle? style}) {
  return BorderAttribute.all(
    BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderTop({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BorderAttribute(
    top: BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderBottom({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BorderAttribute(
    bottom: BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderLeft({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BorderAttribute(
    left: BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderRight({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BorderAttribute(
    right: BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderHorizontal({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  final horizontal = BorderSideDto(
    color: ColorDto.maybeFrom(color),
    style: style,
    width: width,
  );

  return BorderAttribute(left: horizontal, right: horizontal);
}

BoxBorderAttribute borderVertical({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  final vertical = BorderSideDto(
    color: ColorDto.maybeFrom(color),
    style: style,
    width: width,
  );

  return BorderAttribute(top: vertical, bottom: vertical);
}

BorderDirectionalAttribute borderStart({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BorderDirectionalAttribute(
    start: BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BorderDirectionalAttribute borderEnd({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BorderDirectionalAttribute(
    end: BorderSideDto(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderColor(Color color) {
  return border(color: color);
}

BoxBorderAttribute borderWidth(double width) {
  return border(width: width);
}

BoxBorderAttribute borderStyle(BorderStyle style) {
  return border(style: style);
}
