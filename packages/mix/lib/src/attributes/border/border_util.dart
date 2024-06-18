import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'border_dto.dart';

final class BoxBorderUtility<T extends Attribute>
    extends DtoUtility<T, BoxBorderDto, BoxBorder> {
  late final directional = BorderDirectionalUtility(builder);
  late final start = directional.start;
  late final end = directional.end;
  late final all = _border.all;
  late final bottom = _border.bottom;
  late final top = _border.top;
  late final left = _border.left;
  late final right = _border.right;
  late final horizontal = _border.horizontal;
  late final vertical = _border.vertical;
  late final color = all.color;
  late final width = all.width;
  late final style = all.style;

  late final _border = BorderUtility(builder);

  BoxBorderUtility(super.builder) : super(valueToDto: (value) => value.toDto());

  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return _border(
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
    return _border.only(top: top, bottom: bottom, left: left, right: right);
  }
}

final class BorderUtility<T extends Attribute>
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

  late final width = all.width;

  late final strokeAlign = all.strokeAlign;

  late final none = all.none;

  late final _directional = BorderDirectionalUtility((v) => builder(v));

  BorderUtility(super.builder) : super(valueToDto: (value) => value.toDto());

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

final class BorderDirectionalUtility<T extends Attribute>
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
      : super(valueToDto: (value) => value.toDto());

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
