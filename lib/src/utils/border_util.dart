import 'package:flutter/material.dart';

import '../attributes/border/border_attribute.dart';
import '../helpers/extensions/values_ext.dart';
import 'scalar_util.dart';

const border = BorderUtility();

class BorderSideUtility<T extends BoxBorderAttribute<BoxBorderDto, BoxBorder>>
    extends MixUtility<T, BorderSideDto> {
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
    final side = BorderSideDto(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return builder(side);
  }
}

class BorderUtility extends MixUtility<BorderAttribute, BorderDto> {
  final _directional = const BorderDirectionalUtility();
  const BorderUtility() : super(BorderAttribute.new);

  BorderSideUtility<BorderAttribute> get all => BorderSideUtility(_all);
  BorderSideUtility<BorderAttribute> get bottom => BorderSideUtility(_bottom);

  BorderSideUtility<BorderAttribute> get top => BorderSideUtility(_top);

  BorderSideUtility<BorderAttribute> get left => BorderSideUtility(_left);

  BorderSideUtility<BorderAttribute> get right => BorderSideUtility(_right);

  BorderSideUtility<BorderAttribute> get horizontal =>
      BorderSideUtility(_horizontal);

  BorderSideUtility<BorderAttribute> get vertical =>
      BorderSideUtility(_vertical);

  BorderSideUtility<BorderDirectionalAttribute> get start => _directional.start;

  BorderSideUtility<BorderDirectionalAttribute> get end => _directional.end;

  BorderAttribute only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) {
    return builder(
      BorderDto(top: top, bottom: bottom, left: left, right: right),
    );
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

  // Unified border for all sides
  BorderAttribute _all(BorderSideDto side) =>
      only(top: side, bottom: side, left: side, right: side);

  // Specific sides
  BorderAttribute _top(BorderSideDto side) => only(top: side);

  BorderAttribute _bottom(BorderSideDto side) => only(bottom: side);

  BorderAttribute _left(BorderSideDto side) => only(left: side);

  BorderAttribute _right(BorderSideDto side) => only(right: side);

  // Symetric sides
  BorderAttribute _horizontal(BorderSideDto side) {
    final dto = BorderDto.symmetric(horizontal: side);

    return BorderAttribute(dto);
  }

  BorderAttribute _vertical(BorderSideDto side) {
    final dto = BorderDto.symmetric(vertical: side);

    return BorderAttribute(dto);
  }
}

class BorderDirectionalUtility
    extends MixUtility<BorderDirectionalAttribute, BorderDirectionalDto> {
  const BorderDirectionalUtility() : super(BorderDirectionalAttribute.new);

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
    BorderSideDto? start,
    BorderSideDto? end,
    BorderSideDto? top,
    BorderSideDto? bottom,
  }) {
    final border = BorderDirectionalDto(
      start: start,
      end: end,
      top: top,
      bottom: bottom,
    );

    return BorderDirectionalAttribute(border);
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

  BorderDirectionalAttribute _all(BorderSideDto side) {
    return BorderDirectionalAttribute(BorderDirectionalDto.all(side));
  }

  BorderDirectionalAttribute _top(BorderSideDto side) => only(top: side);

  BorderDirectionalAttribute _bottom(BorderSideDto side) => only(bottom: side);

  BorderDirectionalAttribute _start(BorderSideDto side) => only(start: side);

  BorderDirectionalAttribute _end(BorderSideDto side) => only(end: side);

  // Symetric sides
  BorderDirectionalAttribute _horizontal(BorderSideDto side) {
    return BorderDirectionalAttribute(
      BorderDirectionalDto.symmetric(horizontal: side),
    );
  }

  BorderDirectionalAttribute _vertical(BorderSideDto side) {
    return BorderDirectionalAttribute(
      BorderDirectionalDto.symmetric(vertical: side),
    );
  }
}
