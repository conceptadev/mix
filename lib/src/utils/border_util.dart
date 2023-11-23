// ignore_for_file: prefer-conditional-expressions

import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../core/extensions/values_ext.dart';
import 'scalar_util.dart';

final border = BoxBorderUtility.selfBuilder;

class BoxBorderUtility<T> extends MixUtility<T, BoxBorderAttribute> {
  static final selfBuilder = BoxBorderUtility((value) => value);

  late BorderUtility<T> _borderBuilder;
  late BorderDirectionalUtility<T> _borderDirectionalBuilder;

  BoxBorderUtility(super.builder) {
    _borderBuilder = BorderUtility(builder);
    _borderDirectionalBuilder = BorderDirectionalUtility(builder);
  }

  BorderSideUtility<T> get all => _borderBuilder.all;

  BorderSideUtility<T> get bottom => _borderBuilder.bottom;

  BorderSideUtility<T> get top => _borderBuilder.top;

  BorderSideUtility<T> get left => _borderBuilder.left;

  BorderSideUtility<T> get right => _borderBuilder.right;

  BorderSideUtility<T> get start => _borderDirectionalBuilder.start;

  BorderSideUtility<T> get end => _borderDirectionalBuilder.end;

  BorderSideUtility<T> get horizontal => _borderBuilder.horizontal;

  BorderSideUtility<T> get vertical => _borderBuilder.vertical;

  T only({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
    BorderSideAttribute? start,
    BorderSideAttribute? end,
  }) {
    return start != null || end != null
        ? _borderDirectionalBuilder.only(
            start: start,
            end: end,
            top: top,
            bottom: bottom,
          )
        : _borderBuilder.only(
            top: top,
            bottom: bottom,
            left: left,
            right: right,
          );
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
  static final selfBuilder = BorderUtility((value) => value);

  const BorderUtility(super.builder);

  // Specific sides
  T _top(BorderSideAttribute side) => only(top: side);

  T _bottom(BorderSideAttribute side) => only(bottom: side);

  T _left(BorderSideAttribute side) => only(left: side);

  T _right(BorderSideAttribute side) => only(right: side);

  T _all(BorderSideAttribute side) => only(
        top: side,
        bottom: side,
        left: side,
        right: side,
      );

  // Symetric sides
  T _horizontal(BorderSideAttribute side) {
    return builder(BorderAttribute.symmetric(horizontal: side));
  }

  T _vertical(BorderSideAttribute side) {
    return builder(BorderAttribute.symmetric(vertical: side));
  }

  BorderSideUtility<T> get all => BorderSideUtility(_all);
  BorderSideUtility<T> get bottom => BorderSideUtility(_bottom);

  BorderSideUtility<T> get top => BorderSideUtility(_top);

  BorderSideUtility<T> get left => BorderSideUtility(_left);

  BorderSideUtility<T> get right => BorderSideUtility(_right);

  BorderSideUtility<T> get horizontal => BorderSideUtility(_horizontal);

  BorderSideUtility<T> get vertical => BorderSideUtility(_vertical);

  T only({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
  }) {
    final border = BorderAttribute(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );

    return builder(border);
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

  T _all(BorderSideAttribute side) {
    final border = BorderDirectionalAttribute.fromBorderSide(side);

    return builder(border);
  }

  T _top(BorderSideAttribute side) => only(top: side);

  T _bottom(BorderSideAttribute side) => only(bottom: side);

  T _start(BorderSideAttribute side) => only(start: side);

  T _end(BorderSideAttribute side) => only(end: side);

  // Symetric sides
  T _horizontal(BorderSideAttribute side) {
    final border = BorderDirectionalAttribute.symmetric(horizontal: side);

    return builder(border);
  }

  T _vertical(BorderSideAttribute side) {
    final border = BorderDirectionalAttribute.symmetric(vertical: side);

    return builder(border);
  }

  BorderSideUtility<T> get start => BorderSideUtility(_start);

  BorderSideUtility<T> get end => BorderSideUtility(_end);

  BorderSideUtility<T> get top => BorderSideUtility(_top);

  BorderSideUtility<T> get bottom => BorderSideUtility(_bottom);

  BorderSideUtility<T> get horizontal => BorderSideUtility(_horizontal);

  BorderSideUtility<T> get vertical => BorderSideUtility(_vertical);

  BorderSideUtility<T> get all => BorderSideUtility(_all);

  T only({
    BorderSideAttribute? start,
    BorderSideAttribute? end,
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
  }) {
    final border = BorderDirectionalAttribute(
      start: start,
      end: end,
      top: top,
      bottom: bottom,
    );

    return builder(border);
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

class BorderSideUtility<T> extends MixUtility<T, BorderSideAttribute> {
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
    final side = BorderSideAttribute(
      color: color?.toAttribute(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return builder(side) as Value;
  }
}
