import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'border_dto.dart';

class BorderSideUtility<T extends Attribute>
    extends DtoUtility<T, BorderSideDto, BorderSide> {
  late final color = ColorUtility((v) => only(color: v));

  late final style = BorderStyleUtility((v) => only(style: v));

  BorderSideUtility(super.builder) : super(valueToDto: BorderSideDto.from);

  T width(double v) => call(width: v);

  T strokeAlign(double v) => call(strokeAlign: v);

  T none() => call(style: BorderStyle.none);

  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return only(
      color: ColorDto.maybeFrom(color),
      width: width,
      style: style,
      strokeAlign: strokeAlign,
    );
  }

  @override
  T only({
    ColorDto? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return builder(
      BorderSideDto(
        color: color,
        strokeAlign: strokeAlign,
        style: style,
        width: width,
      ),
    );
  }
}

class BorderUtility<T extends Attribute>
    extends DtoUtility<T, BoxBorderDto, BoxBorder> {
  late final start = _directional.start;

  late final end = _directional.end;

  late final all = BorderSideUtility((v) => builder(_fromBorderSide(v)));

  late final bottom = BorderSideUtility((v) => only(bottom: v));

  late final top = BorderSideUtility((v) => only(top: v));

  late final left = BorderSideUtility((v) => only(left: v));

  late final right = BorderSideUtility((v) => only(right: v));

  late final vertical =
      BorderSideUtility((v) => builder(_symmetric(vertical: v)));

  late final horizontal = BorderSideUtility(
    (v) => builder(_symmetric(horizontal: v)),
  );

  late final color = all.color;

  late final style = all.style;

  late final _directional = BorderDirectionalUtility((v) => builder(v));

  BorderUtility(super.builder) : super(valueToDto: BoxBorderDto.from);

  BoxBorderDto _symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) {
    return BoxBorderDto(
      top: horizontal,
      bottom: horizontal,
      left: vertical,
      right: vertical,
    );
  }

  BoxBorderDto _fromBorderSide(BorderSideDto side) {
    return BoxBorderDto(top: side, bottom: side, left: side, right: side);
  }

  T width(double width) => all.width(width);

  T strokeAlign(double strokeAlign) => all.strokeAlign(strokeAlign);

  T none() => all.none();

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

  @override
  T only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) {
    return builder(
      BoxBorderDto(top: top, bottom: bottom, left: left, right: right),
    );
  }
}

class BorderDirectionalUtility<T extends Attribute>
    extends DtoUtility<T, BoxBorderDto, BoxBorder> {
  late final all = BorderSideUtility((v) => builder(_fromBorderSide(v)));

  late final bottom = BorderSideUtility((v) => only(bottom: v));

  late final top = BorderSideUtility((v) => only(top: v));

  late final start = BorderSideUtility((v) => only(start: v));

  late final end = BorderSideUtility((v) => only(end: v));

  late final vertical =
      BorderSideUtility((v) => builder(_symmetric(vertical: v)));

  late final horizontal = BorderSideUtility(
    (v) => builder(_symmetric(horizontal: v)),
  );

  BorderDirectionalUtility(super.builder)
      : super(valueToDto: BoxBorderDto.from);

  BoxBorderDto _symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) {
    return BoxBorderDto(
      top: horizontal,
      bottom: horizontal,
      start: vertical,
      end: vertical,
    );
  }

  BoxBorderDto _fromBorderSide(BorderSideDto side) {
    return BoxBorderDto(top: side, bottom: side, start: side, end: side);
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

  @override
  T only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return builder(
      BoxBorderDto(top: top, bottom: bottom, start: start, end: end),
    );
  }
}
