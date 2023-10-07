import 'package:flutter/material.dart';

import '../color/color_dto.dart';
import 'border_side_attribute.dart';
import 'box_border_attribute.dart';

BoxBorderAttribute border({Color? color, double? width, BorderStyle? style}) {
  return BoxBorderAttribute.fromSide(
    BorderSideAttribute.only(
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
    top: BorderSideAttribute.only(
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
    bottom: BorderSideAttribute.only(
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
    left: BorderSideAttribute.only(
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
    right: BorderSideAttribute.only(
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
    horizontal: BorderSideAttribute.only(
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
    vertical: BorderSideAttribute.only(
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
    start: BorderSideAttribute.only(
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
    end: BorderSideAttribute.only(
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
