import 'package:flutter/material.dart';

import '../color/color.dto.dart';
import 'border_side.dto.dart';
import 'box_border.attribute.dart';

BoxBorderAttribute border({Color? color, double? width, BorderStyle? style}) {
  return BoxBorderAttribute.fromSide(
    BorderSideDto.only(
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
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
      color: color == null ? null : ColorDto(color),
      style: style,
      width: width,
    ),
  );
}

@Deprecated('Use border(color:color) instead')
BoxBorderAttribute borderColor(Color color) {
  return border(color: color);
}

@Deprecated('Use border(width:width) instead')
BoxBorderAttribute borderWidth(double width) {
  return border(width: width);
}

@Deprecated('Use border(style:style) instead')
BoxBorderAttribute borderStyle(BorderStyle style) {
  return border(style: style);
}
