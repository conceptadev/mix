// ignore_for_file: prefer-conditional-expressions

import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../scalars/scalar_util.dart';
import 'border_attribute.dart';
import 'border_dto.dart';

class BoxBorderUtility<T> extends MixUtility<T, BoxBorderAttribute> {
  static const selfBuilder = BoxBorderUtility(MixUtility.selfBuilder);

  const BoxBorderUtility(super.builder);

  BorderUtility<T> get _border => BorderUtility(builder);

  BorderDirectionalUtility<T> get _borderDirectional =>
      BorderDirectionalUtility(builder);

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

  BorderSideUtility<T> get all {
    return BorderSideUtility(
      (side) => only(top: side, bottom: side, left: side, right: side),
    );
  }

  BorderSideUtility<T> get bottom {
    return BorderSideUtility((side) => only(bottom: side));
  }

  BorderSideUtility<T> get top {
    return BorderSideUtility((side) => only(top: side));
  }

  BorderSideUtility<T> get left {
    return BorderSideUtility((side) => only(left: side));
  }

  BorderSideUtility<T> get right {
    return BorderSideUtility((side) => only(right: side));
  }

  BorderSideUtility<T> get horizontal {
    return BorderSideUtility(
      (side) => builder(BorderAttribute.symmetric(horizontal: side)),
    );
  }

  BorderSideUtility<T> get vertical {
    return BorderSideUtility(
      (side) => builder(BorderAttribute.symmetric(vertical: side)),
    );
  }

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

  BorderSideUtility<T> get start {
    return BorderSideUtility((side) => only(start: side));
  }

  BorderSideUtility<T> get end {
    return BorderSideUtility((side) => only(end: side));
  }

  BorderSideUtility<T> get top {
    return BorderSideUtility((side) => only(top: side));
  }

  BorderSideUtility<T> get bottom {
    return BorderSideUtility((side) => only(bottom: side));
  }

  BorderSideUtility<T> get horizontal {
    return BorderSideUtility(
      (side) => builder(BorderDirectionalAttribute.symmetric(horizontal: side)),
    );
  }

  BorderSideUtility<T> get vertical {
    return BorderSideUtility(
      (side) => builder(BorderDirectionalAttribute.symmetric(vertical: side)),
    );
  }

  BorderSideUtility<T> get all {
    return BorderSideUtility(
      (side) => builder(BorderDirectionalAttribute.fromBorderSide(side)),
    );
  }

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

    return builder(side) as Value;
  }
}
