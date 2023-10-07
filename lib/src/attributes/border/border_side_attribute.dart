import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';
import '../resolvable_attribute.dart';

class BorderSideAttribute extends ResolvableAttribute<BorderSide> {
  final ColorDto? color;
  final double? width;
  final BorderStyle? style;

  final double? strokeAlign;

  final _default = const BorderSide();

  const BorderSideAttribute._({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  const BorderSideAttribute.only({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  factory BorderSideAttribute.from(BorderSide side) {
    return BorderSideAttribute.only(
      color: ColorDto(side.color),
      strokeAlign: side.strokeAlign,
      style: side.style,
      width: side.width,
    );
  }

  @override
  BorderSideAttribute merge(BorderSideAttribute? other) {
    if (other == null) return this;

    return BorderSideAttribute._(
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
