import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../../factory/mix_provider_data.dart';
import 'border_dto.dart';

@immutable
abstract class BoxBorderAttribute
    extends ResolvableAttribute<BoxBorderAttribute, BoxBorder> {
  final BoxBorderDto value;

  const BoxBorderAttribute(this.value);

  static BoxBorderAttribute from(BoxBorder border) {
    if (border is Border) {
      return BorderAttribute.only(
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
        left: BorderSideDto.from(border.left),
        right: BorderSideDto.from(border.right),
      );
    }

    if (border is BorderDirectional) {
      return BorderDirectionalAttribute.only(
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
        start: BorderSideDto.from(border.start),
        end: BorderSideDto.from(border.end),
      );
    }

    throw UnimplementedError(
      'Cannot create BoxBorderAttribute from border of type ${border.runtimeType}',
    );
  }

  static BoxBorderAttribute? maybeFrom(BoxBorder? border) {
    if (border == null) return null;

    return from(border);
  }

  BorderSideDto? get top => value.top;

  BorderSideDto? get bottom => value.bottom;

  BoxBorderAttribute Function(BoxBorderDto) get create;

  @override
  BoxBorderAttribute merge(covariant BoxBorderAttribute? other) {
    return other == null ? this : create(value.merge(other.value));
  }

  @override
  BoxBorder resolve(MixData mix) => value.resolve(mix);

  @override
  List<Object?> get props => [value];
}

class BorderAttribute extends BoxBorderAttribute {
  @override
  final create = BorderAttribute.raw;

  const BorderAttribute.raw(super.value);

  factory BorderAttribute.all({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderAttribute.fromBorderSide(
      BorderSideDto(color: color?.toDto(), style: style, width: width),
    );
  }

  factory BorderAttribute.only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) {
    return BorderAttribute.raw(
      BoxBorderDto(top: top, bottom: bottom, left: left, right: right),
    );
  }

  /// Creates a border with symmetrical vertical and horizontal sides.
  ///
  /// The `vertical` argument applies to the [_left] and [right] sides, and the
  /// `horizontal` argument applies to the [_top] and [_bottom] sides.
  factory BorderAttribute.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) {
    return BorderAttribute.only(
      top: horizontal,
      bottom: horizontal,
      left: vertical,
      right: vertical,
    );
  }

  factory BorderAttribute.fromBorderSide(BorderSideDto side) {
    return BorderAttribute.only(
      top: side,
      bottom: side,
      left: side,
      right: side,
    );
  }

  BorderSideDto? get left => value.left;
  BorderSideDto? get right => value.right;
}

class BorderDirectionalAttribute extends BoxBorderAttribute {
  @override
  final create = BorderDirectionalAttribute.raw;

  const BorderDirectionalAttribute.raw(super.value);

  factory BorderDirectionalAttribute.all({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderDirectionalAttribute.fromBorderSide(
      BorderSideDto(color: color?.toDto(), style: style, width: width),
    );
  }

  factory BorderDirectionalAttribute.only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return BorderDirectionalAttribute.raw(
      BoxBorderDto(top: top, bottom: bottom, start: start, end: end),
    );
  }

  factory BorderDirectionalAttribute.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) {
    return BorderDirectionalAttribute.only(
      top: horizontal,
      bottom: horizontal,
      start: vertical,
      end: vertical,
    );
  }

  factory BorderDirectionalAttribute.fromBorderSide(BorderSideDto side) {
    return BorderDirectionalAttribute.only(
      top: side,
      bottom: side,
      start: side,
      end: side,
    );
  }

  BorderSideDto? get start => value.start;
  BorderSideDto? get end => value.end;
}
