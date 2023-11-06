import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';

BorderAttribute border({
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

  return BorderAttribute(left: side, right: side, top: side, bottom: side);
}

BorderDirectionalAttribute borderDirectional({
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

  return BorderDirectionalAttribute(
    start: side,
    end: side,
    top: side,
    bottom: side,
  );
}

BoxBorderAttribute borderColor(Color color) {
  return border(color: color);
}

BoxBorderAttribute borderDirectionalColor(Color color) {
  return borderDirectional(color: color);
}

BoxBorderAttribute borderWidth(double width) {
  return border(width: width);
}

BoxBorderAttribute borderDirectionalWidth(double width) {
  return borderDirectional(width: width);
}

BoxBorderAttribute borderStyle(BorderStyle style) {
  return border(style: style);
}

BoxBorderAttribute borderDirectionalStyle(BorderStyle style) {
  return borderDirectional(style: style);
}

BoxBorderAttribute borderStrokeAlign(double strokeAlign) {
  return border(strokeAlign: strokeAlign);
}

BoxBorderAttribute borderDirectionalStrokeAlign(double strokeAlign) {
  return borderDirectional(strokeAlign: strokeAlign);
}

BorderAttribute borderTop({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    top: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderTopColor(Color color) {
  return borderTop(color: color);
}

BoxBorderAttribute borderTopWidth(double width) {
  return borderTop(width: width);
}

BoxBorderAttribute borderTopStyle(BorderStyle style) {
  return borderTop(style: style);
}

BoxBorderAttribute borderTopStrokeAlign(double strokeAlign) {
  return borderTop(strokeAlign: strokeAlign);
}

BorderAttribute borderBottom({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    bottom: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderBottomColor(Color color) {
  return borderBottom(color: color);
}

BoxBorderAttribute borderBottomWidth(double width) {
  return borderBottom(width: width);
}

BoxBorderAttribute borderBottomStyle(BorderStyle style) {
  return borderBottom(style: style);
}

BoxBorderAttribute borderBottomStrokeAlign(double strokeAlign) {
  return borderBottom(strokeAlign: strokeAlign);
}

BorderAttribute borderLeft({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    left: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderLeftColor(Color color) {
  return borderLeft(color: color);
}

BoxBorderAttribute borderLeftWidth(double width) {
  return borderLeft(width: width);
}

BoxBorderAttribute borderLeftStyle(BorderStyle style) {
  return borderLeft(style: style);
}

BoxBorderAttribute borderLeftStrokeAlign(double strokeAlign) {
  return borderLeft(strokeAlign: strokeAlign);
}

BorderAttribute borderRight({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderAttribute(
    right: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderRightColor(Color color) {
  return borderRight(color: color);
}

BoxBorderAttribute borderRightWidth(double width) {
  return borderRight(width: width);
}

BoxBorderAttribute borderRightStyle(BorderStyle style) {
  return borderRight(style: style);
}

BoxBorderAttribute borderRightStrokeAlign(double strokeAlign) {
  return borderRight(strokeAlign: strokeAlign);
}

BorderDirectionalAttribute borderStart({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderDirectionalAttribute(
    start: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderStartColor(Color color) {
  return borderStart(color: color);
}

BoxBorderAttribute borderStartWidth(double width) {
  return borderStart(width: width);
}

BoxBorderAttribute borderStartStyle(BorderStyle style) {
  return borderStart(style: style);
}

BoxBorderAttribute borderStartStrokeAlign(double strokeAlign) {
  return borderStart(strokeAlign: strokeAlign);
}

BorderDirectionalAttribute borderEnd({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BorderDirectionalAttribute(
    end: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BorderDirectionalAttribute borderEndColor(Color color) {
  return borderEnd(color: color);
}

BorderDirectionalAttribute borderEndWidth(double width) {
  return borderEnd(width: width);
}

BorderDirectionalAttribute borderEndStyle(BorderStyle style) {
  return borderEnd(style: style);
}

BorderDirectionalAttribute borderEndStrokeAlign(double strokeAlign) {
  return borderEnd(strokeAlign: strokeAlign);
}

BoxBorderAttribute borderHorizontal({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return borderSymetric(
    horizontal: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderHorizontalColor(Color color) {
  return borderHorizontal(color: color);
}

BoxBorderAttribute borderHorizontalWidth(double width) {
  return borderHorizontal(width: width);
}

BoxBorderAttribute borderHorizontalStyle(BorderStyle style) {
  return borderHorizontal(style: style);
}

BoxBorderAttribute borderHorizontalStrokeAlign(double strokeAlign) {
  return borderHorizontal(strokeAlign: strokeAlign);
}

BoxBorderAttribute borderVertical({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return borderSymetric(
    vertical: BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  );
}

BoxBorderAttribute borderVerticalColor(Color color) {
  return borderVertical(color: color);
}

BoxBorderAttribute borderVerticalWidth(double width) {
  return borderVertical(width: width);
}

BoxBorderAttribute borderVerticalStyle(BorderStyle style) {
  return borderVertical(style: style);
}

BoxBorderAttribute borderVerticalStrokeAlign(double strokeAlign) {
  return borderVertical(strokeAlign: strokeAlign);
}

BorderAttribute borderSymetric({
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

BorderDirectionalAttribute borderDirectionalSymetric({
  BorderSideAttribute? vertical,
  BorderSideAttribute? horizontal,
}) {
  return BorderDirectionalAttribute(
    start: vertical,
    end: vertical,
    top: horizontal,
    bottom: horizontal,
  );
}
