import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';

BorderAttribute border({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  final side = _borderSide(
    color: color,
    width: width,
    style: style,
    strokeAlign: strokeAlign,
  );

  return BorderAttribute(left: side, right: side, top: side, bottom: side);
}

BorderDirectionalAttribute borderDirectional({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  final side = _borderSide(
    color: color,
    width: width,
    style: style,
    strokeAlign: strokeAlign,
  );

  return BorderDirectionalAttribute(
    start: side,
    end: side,
    top: side,
    bottom: side,
  );
}

BorderAttribute borderTop({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    top: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderAttribute borderBottom({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    bottom: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderAttribute borderLeft({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    left: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderAttribute borderRight({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    right: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderDirectionalAttribute borderStart({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderDirectionalAttribute(
    start: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderDirectionalAttribute borderEnd({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderDirectionalAttribute(
    end: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderAttribute borderHorizontal({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return _borderSymetric(
    horizontal: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderAttribute borderVertical({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return _borderSymetric(
    vertical: _borderSide(
      color: color,
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    ),
  );
}

BorderAttribute _borderSymetric({
  BorderSideAttribute? vertical,
  BorderSideAttribute? horizontal,
}) {
  return BorderAttribute(
    left: vertical,
    right: vertical,
    top: horizontal,
    bottom: horizontal,
  );
}

BorderSideAttribute _borderSide({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderSideAttribute(
    color: color?.toAttribute(),
    strokeAlign: strokeAlign,
    style: style,
    width: width,
  );
}
