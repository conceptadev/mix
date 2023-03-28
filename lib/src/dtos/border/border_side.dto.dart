import 'package:flutter/material.dart';

import '../color.dto.dart';
import '../dto.dart';

class BorderSideDto extends Dto<BorderSide> {
  final ColorDto? color;
  final double? width;
  final BorderStyle? style;

  const BorderSideDto._({
    this.color,
    this.width,
    this.style,
  });

  const BorderSideDto.only({
    this.color,
    this.width,
    this.style,
  });

  factory BorderSideDto.fromBorderSide(BorderSide side) {
    return BorderSideDto.only(
      color: ColorDto(side.color),
      width: side.width,
      style: side.style,
    );
  }

  BorderSideDto copyWith({
    ColorDto? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderSideDto._(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
    );
  }

  BorderSideDto merge(BorderSideDto? other) {
    if (other == null) return this;

    return BorderSideDto._(
      color: other.color ?? color,
      width: other.width ?? width,
      style: other.style ?? style,
    );
  }

  final BorderSide _default = const BorderSide();

  @override
  BorderSide resolve(BuildContext context) {
    return BorderSide(
      color: color?.resolve(context) ?? _default.color,
      width: width ?? _default.width,
      style: style ?? _default.style,
    );
  }

  @override
  String toString() =>
      'BorderSideProps(color: $color, width: $width, style: $style)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BorderSideDto &&
        other.color == color &&
        other.width == width &&
        other.style == style;
  }

  @override
  int get hashCode {
    return color.hashCode ^ width.hashCode ^ style.hashCode;
  }
}
