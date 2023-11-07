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

BorderAttribute borderColor(Color color) {
  return border(color: color);
}

BorderDirectionalAttribute borderDirectionalColor(Color color) {
  return borderDirectional(color: color);
}

BorderAttribute borderWidth(double width) {
  return border(width: width);
}

BorderDirectionalAttribute borderDirectionalWidth(double width) {
  return borderDirectional(width: width);
}

BorderAttribute borderStyle(BorderStyle style) {
  return border(style: style);
}

BorderDirectionalAttribute borderDirectionalStyle(BorderStyle style) {
  return borderDirectional(style: style);
}

BorderAttribute borderStrokeAlign(double strokeAlign) {
  return border(strokeAlign: strokeAlign);
}

BorderDirectionalAttribute borderDirectionalStrokeAlign(double strokeAlign) {
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

BorderAttribute borderTopColor(Color color) {
  return borderTop(color: color);
}

BorderAttribute borderTopWidth(double width) {
  return borderTop(width: width);
}

BorderAttribute borderTopStyle(BorderStyle style) {
  return borderTop(style: style);
}

BorderAttribute borderTopStrokeAlign(double strokeAlign) {
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

BorderAttribute borderBottomColor(Color color) {
  return borderBottom(color: color);
}

BorderAttribute borderBottomWidth(double width) {
  return borderBottom(width: width);
}

BorderAttribute borderBottomStyle(BorderStyle style) {
  return borderBottom(style: style);
}

BorderAttribute borderBottomStrokeAlign(double strokeAlign) {
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

BorderAttribute borderLeftColor(Color color) {
  return borderLeft(color: color);
}

BorderAttribute borderLeftWidth(double width) {
  return borderLeft(width: width);
}

BorderAttribute borderLeftStyle(BorderStyle style) {
  return borderLeft(style: style);
}

BorderAttribute borderLeftStrokeAlign(double strokeAlign) {
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

BorderAttribute borderRightColor(Color color) {
  return borderRight(color: color);
}

BorderAttribute borderRightWidth(double width) {
  return borderRight(width: width);
}

BorderAttribute borderRightStyle(BorderStyle style) {
  return borderRight(style: style);
}

BorderAttribute borderRightStrokeAlign(double strokeAlign) {
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

BorderDirectionalAttribute borderStartColor(Color color) {
  return borderStart(color: color);
}

BorderDirectionalAttribute borderStartWidth(double width) {
  return borderStart(width: width);
}

BorderDirectionalAttribute borderStartStyle(BorderStyle style) {
  return borderStart(style: style);
}

BorderDirectionalAttribute borderStartStrokeAlign(double strokeAlign) {
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

BorderAttribute borderHorizontal({
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

BorderAttribute borderHorizontalColor(Color color) {
  return borderHorizontal(color: color);
}

BorderAttribute borderHorizontalWidth(double width) {
  return borderHorizontal(width: width);
}

BorderAttribute borderHorizontalStyle(BorderStyle style) {
  return borderHorizontal(style: style);
}

BorderAttribute borderHorizontalStrokeAlign(double strokeAlign) {
  return borderHorizontal(strokeAlign: strokeAlign);
}

BorderAttribute borderVertical({
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

BorderAttribute borderVerticalColor(Color color) {
  return borderVertical(color: color);
}

BorderAttribute borderVerticalWidth(double width) {
  return borderVertical(width: width);
}

BorderAttribute borderVerticalStyle(BorderStyle style) {
  return borderVertical(style: style);
}

BorderAttribute borderVerticalStrokeAlign(double strokeAlign) {
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
