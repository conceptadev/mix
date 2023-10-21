import 'package:flutter/material.dart';

import '../attributes/box_border_attribute.dart';
import '../core/dto/border_side_dto.dart';
import '../core/dto/color_dto.dart';

BoxBorderAttribute border({Color? color, double? width, BorderStyle? style}) {
  return BoxBorderAttribute.fromSide(
    BorderSideDto.only(
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
  return BoxBorderAttribute.only(
    top: BorderSideDto.only(
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
  return BoxBorderAttribute.only(
    bottom: BorderSideDto.only(
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
  return BoxBorderAttribute.only(
    left: BorderSideDto.only(
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
  return BoxBorderAttribute.only(
    right: BorderSideDto.only(
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
  return BoxBorderAttribute.symmetric(
    horizontal: BorderSideDto.only(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderVertical({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BoxBorderAttribute.symmetric(
    vertical: BorderSideDto.only(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderStart({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BoxBorderAttribute.directionalOnly(
    start: BorderSideDto.only(
      color: ColorDto.maybeFrom(color),
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderEnd({
  Color? color,
  double? width,
  BorderStyle? style,
}) {
  return BoxBorderAttribute.directionalOnly(
    end: BorderSideDto.only(
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
