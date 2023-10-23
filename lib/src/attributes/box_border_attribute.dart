// ignore_for_file: no-equal-arguments

import 'package:flutter/material.dart';

import '../core/dto/border_side_dto.dart';
import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class BoxBorderAttribute<T extends BoxBorder>
    extends StyleAttribute<T> {
  final BorderSideDto? top;
  final BorderSideDto? bottom;

  const BoxBorderAttribute({this.top, this.bottom});

  static BoxBorderAttribute from(BoxBorder border) {
    if (border is Border) {
      return BorderAttribute(
        left: BorderSideDto.from(border.left),
        right: BorderSideDto.from(border.right),
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
      );
    }
    if (border is BorderDirectional) {
      return BorderDirectionalAttribute(
        start: BorderSideDto.from(border.start),
        end: BorderSideDto.from(border.end),
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
      );
    }

    throw UnsupportedError(
      'BoxBorderAttribute.from only supports Border and BorderDirectional',
    );
  }

  @override
  BoxBorderAttribute<T> merge(covariant BoxBorderAttribute<T>? other);

  @override
  T resolve(MixData mix);
}

class BorderAttribute extends BoxBorderAttribute<Border> {
  final BorderSideDto? left;
  final BorderSideDto? right;

  const BorderAttribute({this.left, this.right, super.top, super.bottom});

  const BorderAttribute.all(BorderSideDto side)
      : left = side,
        right = side,
        super(top: side, bottom: side);

  @override
  BorderAttribute merge(BorderAttribute? other) {
    if (other == null) return this;

    return BorderAttribute(
      left: left ?? other.left,
      right: right ?? other.right,
      top: top ?? other.top,
      bottom: bottom ?? other.bottom,
    );
  }

  @override
  Border resolve(MixData mix) {
    return Border(
      top: top?.resolve(mix) ?? BorderSide.none,
      right: right?.resolve(mix) ?? BorderSide.none,
      bottom: bottom?.resolve(mix) ?? BorderSide.none,
      left: left?.resolve(mix) ?? BorderSide.none,
    );
  }

  @override
  get props => [top, bottom, left, right];
}

class BorderDirectionalAttribute extends BoxBorderAttribute<BorderDirectional> {
  final BorderSideDto? start;
  final BorderSideDto? end;

  const BorderDirectionalAttribute({
    this.start,
    this.end,
    super.top,
    super.bottom,
  });

  const BorderDirectionalAttribute.all(BorderSideDto side)
      : start = side,
        end = side,
        super(top: side, bottom: side);

  @override
  BorderDirectionalAttribute merge(BorderDirectionalAttribute? other) {
    if (other == null) return this;

    return BorderDirectionalAttribute(
      start: start ?? other.start,
      end: end ?? other.end,
      top: top ?? other.top,
      bottom: bottom ?? other.bottom,
    );
  }

  @override
  BorderDirectional resolve(MixData mix) {
    return BorderDirectional(
      top: top?.resolve(mix) ?? BorderSide.none,
      start: start?.resolve(mix) ?? BorderSide.none,
      end: end?.resolve(mix) ?? BorderSide.none,
      bottom: bottom?.resolve(mix) ?? BorderSide.none,
    );
  }

  @override
  get props => [top, bottom, start, end];
}
