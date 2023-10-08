import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';
import 'border_color.attribute.dart';

class BorderSideDto extends ResolvableDto<BorderSide> {
  final BorderColorAttribute? color;
  final double? width;
  final BorderStyle? style;

  final double? strokeAlign;

  final _default = const BorderSide();

  const BorderSideDto._({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  const BorderSideDto.only({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  factory BorderSideDto.from(BorderSide side) {
    return BorderSideDto.only(
      color: BorderColorAttribute(side.color),
      strokeAlign: side.strokeAlign,
      style: side.style,
      width: side.width,
    );
  }

  @override
  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return this;

    return BorderSideDto._(
      color: other.color ?? color,
      strokeAlign: other.strokeAlign ?? strokeAlign,
      style: other.style ?? style,
      width: other.width ?? width,
    );
  }

  @override
  BorderSide resolve(MixData mix) {
    return BorderSide(
      color: color?.resolve(mix) ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
      strokeAlign: strokeAlign ?? _default.strokeAlign,
    );
  }

  @override
  get props => [color, width, style, strokeAlign];
}
