import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import 'color_dto.dart';

class BorderSideDto extends Dto<BorderSide> {
  final ColorDto? color;
  final double? width;
  final BorderStyle? style;
  final double? strokeAlign;

  final _default = const BorderSide();

  const BorderSideDto({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  factory BorderSideDto.from(BorderSide side) {
    return BorderSideDto(
      color: ColorDto(side.color),
      strokeAlign: side.strokeAlign,
      style: side.style,
      width: side.width,
    );
  }

  @override
  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return this;

    return BorderSideDto(
      color: color?.merge(other.color) ?? other.color,
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
