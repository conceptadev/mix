// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

final class BoxBorderMixUtility<T extends Attribute>
    extends DtoUtility<T, BoxBorderMix, BoxBorder> {
  late final directional = BorderDirectionalUtility(builder);
  late final all = _border.all;
  late final bottom = _border.bottom;
  late final top = _border.top;
  late final left = _border.left;
  late final right = _border.right;
  late final horizontal = _border.horizontal;
  late final vertical = _border.vertical;
  late final start = directional.start;
  late final end = directional.end;

  late final color = _border.color;
  late final width = _border.width;
  late final style = _border.style;
  late final strokeAlign = _border.strokeAlign;

  late final none = _border.none;

  late final _border = BorderUtility(builder);

  BoxBorderMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

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
    BorderSideMix? top,
    BorderSideMix? bottom,
    BorderSideMix? left,
    BorderSideMix? right,
  }) {
    return builder(
      BorderMix(top: top, bottom: bottom, left: left, right: right),
    );
  }
}

final class BorderUtility<T extends Attribute>
    extends DtoUtility<T, BorderMix, Border> {
  late final all = BorderSideMixUtility((v) => builder(BorderMix.all(v)));

  late final bottom = BorderSideMixUtility((v) => only(bottom: v));

  late final top = BorderSideMixUtility((v) => only(top: v));

  late final left = BorderSideMixUtility((v) => only(left: v));

  late final right = BorderSideMixUtility((v) => only(right: v));

  late final vertical = BorderSideMixUtility(
    (v) => builder(BorderMix.vertical(v)),
  );

  late final horizontal = BorderSideMixUtility(
    (v) => builder(BorderMix.horizontal(v)),
  );

  late final color = all.color;

  late final style = all.style;

  late final width = all.width;

  late final strokeAlign = all.strokeAlign;

  BorderUtility(super.builder) : super(valueToDto: (value) => value.toDto());

  T none() => builder(const BorderMix.none());

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
    BorderSideMix? top,
    BorderSideMix? bottom,
    BorderSideMix? left,
    BorderSideMix? right,
  }) {
    return builder(
      BorderMix(top: top, bottom: bottom, left: left, right: right),
    );
  }
}

final class BorderDirectionalUtility<T extends Attribute>
    extends DtoUtility<T, BorderDirectionalMix, BorderDirectional> {
  late final all =
      BorderSideMixUtility((v) => builder(BorderDirectionalMix.all(v)));

  late final bottom = BorderSideMixUtility((v) => only(bottom: v));

  late final top = BorderSideMixUtility((v) => only(top: v));

  late final start = BorderSideMixUtility((v) => only(start: v));

  late final end = BorderSideMixUtility((v) => only(end: v));

  late final vertical =
      BorderSideMixUtility((v) => builder(BorderDirectionalMix.vertical(v)));

  late final horizontal =
      BorderSideMixUtility((v) => builder(BorderDirectionalMix.horizontal(v)));

  BorderDirectionalUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T none() => builder(const BorderDirectionalMix.none());

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
    BorderSideMix? top,
    BorderSideMix? bottom,
    BorderSideMix? start,
    BorderSideMix? end,
  }) {
    return builder(
      BorderDirectionalMix(top: top, bottom: bottom, start: start, end: end),
    );
  }
}
