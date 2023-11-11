import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';

BorderAttribute border({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  final side = borderSide(
    color: color,
    width: width,
    style: style,
    strokeAlign: strokeAlign,
  );

  return BorderAttribute(left: side, right: side, top: side, bottom: side);
}

const borderOnly = BorderAttribute.new;

BorderDirectionalAttribute borderDirectional({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  final side = borderSide(
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

const borderDirectionalOnly = BorderDirectionalAttribute.new;

BorderAttribute borderTop({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    top: borderSide(
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
    bottom: borderSide(
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
    left: borderSide(
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
    right: borderSide(
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
    start: borderSide(
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
    end: borderSide(
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
    horizontal: borderSide(
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
    vertical: borderSide(
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

BorderSideAttribute borderSide({
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
