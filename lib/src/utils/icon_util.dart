import 'package:flutter/material.dart';

import '../core/dto/color_dto.dart';
import '../core/dto/double_dto.dart';
import '../specs/icon_attribute.dart';

const icon = _icon;
const iconSize = _iconSize;
const iconColor = _iconColor;

IconAttributes _icon({Color? color, double? size}) {
  return IconAttributes(
    color: ColorDto.maybeFrom(color),
    size: DoubleDto.maybeFrom(size),
  );
}

IconAttributes _iconSize(double size) {
  return IconAttributes(size: DoubleDto(size));
}

IconAttributes _iconColor(Color color) {
  return IconAttributes(color: ColorDto(color));
}
