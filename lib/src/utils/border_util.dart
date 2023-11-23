// ignore_for_file: prefer-conditional-expressions

import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../core/extensions/values_ext.dart';
import 'scalar_util.dart';

const border = BorderUtility();
const borderDirectional = BorderDirectionalUtility();

// typedef BoxBorderAttributeBuilder = BoxBorderAttribute Function(
//   BorderSideAttribute? top,
//   BorderSideAttribute? bottom,
//   BorderSideAttribute? left,
//   BorderSideAttribute? right,
//   BorderSideAttribute? start,
//   BorderSideAttribute? end,
// );

class BorderSideUtility<T> extends MixUtility<T, BorderSideAttribute> {
  const BorderSideUtility(super.builder);

  T color(Color color) => call(color: color);

  T width(double width) => call(width: width);

  T style(BorderStyle style) => call(style: style);

  T strokeAlign(double strokeAlign) => call(strokeAlign: strokeAlign);

  T call({
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

    return builder(side);
  }
}

class BoxBorderUtility<T> extends MixUtility<T, BoxBorderAttribute> {
  final _borderBuilder = const BorderUtility();
  final _borderDirectionalBuilder = const BorderDirectionalUtility();

  BoxBorderUtility(super.builder);

  T _top(BorderSideAttribute side) => only(top: side);

  T _bottom(BorderSideAttribute side) => only(bottom: side);

  T _left(BorderSideAttribute side) => only(left: side);

  T _right(BorderSideAttribute side) => only(right: side);

  T _start(BorderSideAttribute side) => only(start: side);

  T _end(BorderSideAttribute side) => only(end: side);

  T _all(BorderSideAttribute side) {
    final border = _borderBuilder.all(side);
  }

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

  BorderSideUtility<T> get start => BorderSideUtility(_start);

  BorderSideUtility<T> get end => BorderSideUtility(_end);

  BorderSideUtility<T> get horizontal => BorderSideUtility(_horizontal);

  BorderSideUtility<T> get vertical => BorderSideUtility(_vertical);

  T only({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
    BorderSideAttribute? start,
    BorderSideAttribute? end,
  }) {
    BoxBorderAttribute border;

    if (start != null || end != null) {
      border = _borderDirectionalBuilder.only(
        start: start,
        end: end,
        top: top,
        bottom: bottom,
      );
    } else {
      border = _borderBuilder.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      );
    }

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

class BorderUtility<T> extends MixUtility<T, BorderAttribute> {
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
    final border = BorderAttribute.symmetric(horizontal: side);

    return builder(border);
  }

  T _vertical(BorderSideAttribute side) {
    final border = BorderAttribute.symmetric(vertical: side);

    return builder(border);
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

  BorderAttribute call({
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

class BorderDirectionalUtility {
  const BorderDirectionalUtility();

  BorderDirectionalAttribute _all(BorderSideAttribute side) {
    return BorderDirectionalAttribute.fromBorderSide(side);
  }

  BorderDirectionalAttribute _top(BorderSideAttribute side) => only(top: side);

  BorderDirectionalAttribute _bottom(BorderSideAttribute side) =>
      only(bottom: side);

  BorderDirectionalAttribute _start(BorderSideAttribute side) =>
      only(start: side);

  BorderDirectionalAttribute _end(BorderSideAttribute side) => only(end: side);

  // Symetric sides
  BorderDirectionalAttribute _horizontal(BorderSideAttribute side) {
    return BorderDirectionalAttribute.symmetric(horizontal: side);
  }

  BorderDirectionalAttribute _vertical(BorderSideAttribute side) {
    return BorderDirectionalAttribute.symmetric(vertical: side);
  }

  BorderSideUtility<BorderDirectionalAttribute> get start =>
      BorderSideUtility(_start);

  BorderSideUtility<BorderDirectionalAttribute> get end =>
      BorderSideUtility(_end);

  BorderSideUtility<BorderDirectionalAttribute> get top =>
      BorderSideUtility(_top);

  BorderSideUtility<BorderDirectionalAttribute> get bottom =>
      BorderSideUtility(_bottom);

  BorderSideUtility<BorderDirectionalAttribute> get horizontal =>
      BorderSideUtility(_horizontal);

  BorderSideUtility<BorderDirectionalAttribute> get vertical =>
      BorderSideUtility(_vertical);

  BorderSideUtility<BorderDirectionalAttribute> get all =>
      BorderSideUtility(_all);

  BorderDirectionalAttribute only({
    BorderSideAttribute? start,
    BorderSideAttribute? end,
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
  }) {
    return BorderDirectionalAttribute(
      start: start,
      end: end,
      top: top,
      bottom: bottom,
    );
  }

  BorderDirectionalAttribute call({
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
