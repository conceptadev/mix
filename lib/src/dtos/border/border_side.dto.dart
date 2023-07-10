import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../color.dto.dart';
import '../dto.dart';

class BorderSideDto extends Dto<BorderSide> {
  final ColorDto? color;
  final double? width;
  final BorderStyle? style;

  final double? strokeAlign;

  const BorderSideDto._({
    this.color,
    this.width,
    this.style,
    this.strokeAlign,
  });

  const BorderSideDto.only({
    this.color,
    this.width,
    this.style,
    this.strokeAlign,
  });

  factory BorderSideDto.from(BorderSide side) {
    return BorderSideDto.only(
      color: ColorDto(side.color),
      width: side.width,
      style: side.style,
      strokeAlign: side.strokeAlign,
    );
  }

  BorderSideDto copyWith({
    ColorDto? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return BorderSideDto._(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
      strokeAlign: strokeAlign ?? this.strokeAlign,
    );
  }

  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return this;

    return copyWith(
      color: other.color,
      width: other.width,
      style: other.style,
      strokeAlign: other.strokeAlign,
    );
  }

  final BorderSide _default = const BorderSide();

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
