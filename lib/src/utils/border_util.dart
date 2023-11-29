// ignore_for_file: prefer-conditional-expressions

import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../attributes/border/border_dto.dart';
import '../core/extensions/values_ext.dart';
import 'scalar_util.dart';

class BoxBorderUtility<T> extends MixUtility<T, BoxBorderAttribute> {
  static const selfBuilder = BoxBorderUtility(MixUtility.selfBuilder);

  const BoxBorderUtility(super.builder);

  BorderUtility<T> get _border => BorderUtility(as);

  BorderDirectionalUtility<T> get _borderDirectional =>
      BorderDirectionalUtility(as);

  BorderSideUtility<T> get all => _border.all;

  BorderSideUtility<T> get bottom => _border.bottom;

  BorderSideUtility<T> get top => _border.top;

  BorderSideUtility<T> get left => _border.left;

  BorderSideUtility<T> get right => _border.right;

  BorderSideUtility<T> get start => _borderDirectional.start;

  BorderSideUtility<T> get end => _borderDirectional.end;

  BorderSideUtility<T> get horizontal => _border.horizontal;

  BorderSideUtility<T> get vertical => _border.vertical;

  BorderDirectionalUtility<T> get directional => _borderDirectional;

  T only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return start != null || end != null
        ? _borderDirectional.only(
            start: start,
            end: end,
            top: top,
            bottom: bottom,
          )
        : _border.only(top: top, bottom: bottom, left: left, right: right);
  }

  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return all(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

class BorderUtility<T> extends MixUtility<T, BorderAttribute> {
  static const selfBuilder = BorderUtility(MixUtility.selfBuilder);

  const BorderUtility(super.builder);

  // Specific sides
  T _top(BorderSideDto side) => only(top: side);

  T _bottom(BorderSideDto side) => only(bottom: side);

  T _left(BorderSideDto side) => only(left: side);

  T _right(BorderSideDto side) => only(right: side);

  T _all(BorderSideDto side) => only(
        top: side,
        bottom: side,
        left: side,
        right: side,
      );

  // Symetric sides
  T _horizontal(BorderSideDto side) {
    return as(BorderAttribute.symmetric(horizontal: side));
  }

  T _vertical(BorderSideDto side) {
    return as(BorderAttribute.symmetric(vertical: side));
  }

  BorderSideUtility<T> get all => BorderSideUtility(_all);
  BorderSideUtility<T> get bottom => BorderSideUtility(_bottom);

  BorderSideUtility<T> get top => BorderSideUtility(_top);

  BorderSideUtility<T> get left => BorderSideUtility(_left);

  BorderSideUtility<T> get right => BorderSideUtility(_right);

  BorderSideUtility<T> get horizontal => BorderSideUtility(_horizontal);

  BorderSideUtility<T> get vertical => BorderSideUtility(_vertical);

  T only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) {
    final border = BorderAttribute.only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );

    return as(border);
  }

  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return all(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

class BorderDirectionalUtility<T>
    extends MixUtility<T, BorderDirectionalAttribute> {
  static final selfBuilder = BorderDirectionalUtility((value) => value);

  const BorderDirectionalUtility(super.builder);

  T _all(BorderSideDto side) {
    final border = BorderDirectionalAttribute.fromBorderSide(side);

    return as(border);
  }

  T _top(BorderSideDto side) => only(top: side);

  T _bottom(BorderSideDto side) => only(bottom: side);

  T _start(BorderSideDto side) => only(start: side);

  T _end(BorderSideDto side) => only(end: side);

  // Symetric sides
  T _horizontal(BorderSideDto side) {
    final border = BorderDirectionalAttribute.symmetric(horizontal: side);

    return as(border);
  }

  T _vertical(BorderSideDto side) {
    final border = BorderDirectionalAttribute.symmetric(vertical: side);

    return as(border);
  }

  BorderSideUtility<T> get start => BorderSideUtility(_start);

  BorderSideUtility<T> get end => BorderSideUtility(_end);

  BorderSideUtility<T> get top => BorderSideUtility(_top);

  BorderSideUtility<T> get bottom => BorderSideUtility(_bottom);

  BorderSideUtility<T> get horizontal => BorderSideUtility(_horizontal);

  BorderSideUtility<T> get vertical => BorderSideUtility(_vertical);

  BorderSideUtility<T> get all => BorderSideUtility(_all);

  T only({
    BorderSideDto? start,
    BorderSideDto? end,
    BorderSideDto? top,
    BorderSideDto? bottom,
  }) {
    final border = BorderDirectionalAttribute.only(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );

    return as(border);
  }

  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return all(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

class BorderSideUtility<T> extends MixUtility<T, BorderSideDto> {
  const BorderSideUtility(super.builder);

  T color(Color color) => call(color: color);

  T width(double width) => call(width: width);

  T style(BorderStyle style) => call(style: style);

  T strokeAlign(double strokeAlign) => call(strokeAlign: strokeAlign);

  Value call<Value extends T>({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideDto(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return as(side) as Value;
  }
}
