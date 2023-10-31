import 'package:flutter/material.dart';

import '../attributes/data_attributes.dart';
import '../core/dto/border_dto.dart';
import '../helpers/extensions/values_ext.dart';

BoxBorderAttribute border({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto.all(
    BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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

BoxBorderAttribute borderStrokeAlign(double strokeAlign) {
  return border(strokeAlign: strokeAlign);
}

BoxBorderAttribute borderTop({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto(
    top: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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

BoxBorderAttribute borderBottom({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto(
    bottom: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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

BoxBorderAttribute borderLeft({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto(
    left: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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

BoxBorderAttribute borderRight({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto(
    right: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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

BoxBorderAttribute borderStart({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto(
    start: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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

BoxBorderAttribute borderEnd({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto(
    end: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
}

BoxBorderAttribute borderEndColor(Color color) {
  return borderEnd(color: color);
}

BoxBorderAttribute borderEndWidth(double width) {
  return borderEnd(width: width);
}

BoxBorderAttribute borderEndStyle(BorderStyle style) {
  return borderEnd(style: style);
}

BoxBorderAttribute borderEndStrokeAlign(double strokeAlign) {
  return borderEnd(strokeAlign: strokeAlign);
}

BoxBorderAttribute borderHorizontal({
  Color? color,
  double? width,
  BorderStyle? style,
  double? strokeAlign,
}) {
  return BoxBorderDto.symmetric(
    horizontal: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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
  return BoxBorderDto.symmetric(
    vertical: BorderSideData(
      color: color?.toDto,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ),
  ).toAttribute;
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
