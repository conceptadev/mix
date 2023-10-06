import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../color.dto.dart';
import '../dto.dart';

class BorderSideDto extends ResolvableAttribute<BorderSide> {
  final ColorDto? color;
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
      color: ColorDto(side.color),
      strokeAlign: side.strokeAlign,
      style: side.style,
      width: side.width,
    );
  }

  BorderSideDto copyWith({
    ColorDto? color,
    double? strokeAlign,
    BorderStyle? style,
    double? width,
  }) {
    return BorderSideDto._(
      color: color ?? this.color,
      strokeAlign: strokeAlign ?? this.strokeAlign,
      style: style ?? this.style,
      width: width ?? this.width,
    );
  }

  @override
  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return this;

    return copyWith(
      color: other.color,
      strokeAlign: other.strokeAlign,
      style: other.style,
      width: other.width,
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
