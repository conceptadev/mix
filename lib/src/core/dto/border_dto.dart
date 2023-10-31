import 'package:flutter/material.dart';

import '../../attributes/visual_attributes.dart';
import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import 'color_dto.dart';

class BorderRadiusGeometryDto extends Dto<BorderRadiusGeometry> {
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

// Directional values
  final Radius? topStart;
  final Radius? topEnd;
  final Radius? bottomStart;
  final Radius? bottomEnd;

  final bool isDirectional;

  const BorderRadiusGeometryDto({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
    this.isDirectional = false,
  });

  const BorderRadiusGeometryDto.all(Radius radius)
      : topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius,
        topStart = radius,
        topEnd = radius,
        bottomStart = radius,
        bottomEnd = radius,
        isDirectional = false;

  BorderRadiusGeometryDto.horizontal({
    Radius? leftStart,
    Radius? rightEnd,
    this.isDirectional = false,
  })  : topLeft = leftStart,
        topRight = rightEnd,
        bottomLeft = leftStart,
        bottomRight = rightEnd,
        topStart = leftStart,
        topEnd = rightEnd,
        bottomStart = leftStart,
        bottomEnd = rightEnd;

  BorderRadiusGeometryDto.vertical({
    Radius? top,
    Radius? bottom,
    this.isDirectional = false,
  })  : topLeft = top,
        topRight = top,
        bottomLeft = bottom,
        bottomRight = bottom,
        topStart = top,
        topEnd = top,
        bottomStart = bottom,
        bottomEnd = bottom;

  BorderRadiusGeometryDto.circular(
    double radius, {
    this.isDirectional = false,
  })  : topLeft = Radius.circular(radius),
        topRight = Radius.circular(radius),
        bottomLeft = Radius.circular(radius),
        bottomRight = Radius.circular(radius),
        topStart = Radius.circular(radius),
        topEnd = Radius.circular(radius),
        bottomStart = Radius.circular(radius),
        bottomEnd = Radius.circular(radius);

  BorderRadiusGeometryAttribute get asAttribute =>
      BorderRadiusGeometryAttribute(this);

  BorderRadiusGeometryDto get toDirectional => copyWith(isDirectional: true);

  BorderRadiusGeometryDto copyWith({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
    bool? isDirectional,
  }) {
    return BorderRadiusGeometryDto(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      topStart: topStart ?? this.topStart,
      topEnd: topEnd ?? this.topEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      bottomEnd: bottomEnd ?? this.bottomEnd,
      isDirectional: isDirectional ?? this.isDirectional,
    );
  }

  @override
  BorderRadiusGeometryDto merge(BorderRadiusGeometryDto? other) {
    if (other == null) return this;
    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional border radius attributes",
      );
    }

    return BorderRadiusGeometryDto(
      topLeft: other.topLeft ?? topLeft,
      topRight: other.topRight ?? topRight,
      bottomLeft: other.bottomLeft ?? bottomLeft,
      bottomRight: other.bottomRight ?? bottomRight,
      topStart: other.topStart ?? topStart,
      topEnd: other.topEnd ?? topEnd,
      bottomStart: other.bottomStart ?? bottomStart,
      bottomEnd: other.bottomEnd ?? bottomEnd,
      isDirectional: other.isDirectional,
    );
  }

  @override
  BorderRadiusGeometry resolve(MixData mix) {
    return isDirectional
        ? BorderRadiusDirectional.only(
            topStart: topStart ?? Radius.zero,
            topEnd: topEnd ?? Radius.zero,
            bottomStart: bottomStart ?? Radius.zero,
            bottomEnd: bottomEnd ?? Radius.zero,
          )
        : BorderRadius.only(
            topLeft: topLeft ?? Radius.zero,
            topRight: topRight ?? Radius.zero,
            bottomLeft: bottomLeft ?? Radius.zero,
            bottomRight: bottomRight ?? Radius.zero,
          );
  }

  @override
  get props => [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
        topStart,
        topEnd,
        bottomStart,
        bottomEnd,
        isDirectional,
      ];
}

class BoxBorderDto extends Dto<BoxBorder> {
  final BorderSideDto? top;
  final BorderSideDto? start;
  final BorderSideDto? end;
  final BorderSideDto? bottom;
  final BorderSideDto? left;
  final BorderSideDto? right;

  final bool isDirectional;

  const BoxBorderDto({
    this.top,
    this.start,
    this.end,
    this.bottom,
    this.left,
    this.right,
    this.isDirectional = false,
  });

  const BoxBorderDto.fromBorderSide(
    BorderSideDto side, {
    this.isDirectional = false,
  })  : top = side,
        right = side,
        bottom = side,
        left = side,
        start = side,
        end = side;

  const BoxBorderDto.all(BorderSideDto side, {this.isDirectional = false})
      : top = side,
        right = side,
        bottom = side,
        left = side,
        start = side,
        end = side;

  const BoxBorderDto.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
    this.isDirectional = false,
  })  : top = horizontal,
        right = vertical,
        bottom = horizontal,
        left = vertical,
        start = vertical,
        end = vertical;

  BoxBorderAttribute get toAttribute => BoxBorderAttribute(this);

  @override
  BoxBorderDto merge(BoxBorderDto? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional box border attributes",
      );
    }

    return BoxBorderDto(
      top: other.top ?? top,
      start: other.start ?? start,
      end: other.end ?? end,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
    );
  }

  @override
  BoxBorder resolve(MixData mix) {
    return isDirectional
        ? BorderDirectional(
            top: top?.resolve(mix) ?? BorderSide.none,
            start: start?.resolve(mix) ?? BorderSide.none,
            end: end?.resolve(mix) ?? BorderSide.none,
            bottom: bottom?.resolve(mix) ?? BorderSide.none,
          )
        : Border(
            top: top?.resolve(mix) ?? BorderSide.none,
            right: right?.resolve(mix) ?? BorderSide.none,
            bottom: bottom?.resolve(mix) ?? BorderSide.none,
            left: left?.resolve(mix) ?? BorderSide.none,
          );
  }

  @override
  get props => [top, start, end, bottom, left, right, isDirectional];
}

class BorderSideDto extends Dto<BorderSide> {
  final ColorDto? color;
  final double? width;
  final BorderStyle? style;
  final double? strokeAlign;

  const BorderSideDto({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  BorderSideDto copyWith({
    ColorDto? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return BorderSideDto(
      color: color ?? this.color,
      strokeAlign: strokeAlign ?? this.strokeAlign,
      style: style ?? this.style,
      width: width ?? this.width,
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
    const defaultValue = BorderSide();

    return BorderSide(
      color: color?.resolve(mix) ?? defaultValue.color,
      width: width ?? defaultValue.width,
      style: style ?? defaultValue.style,
      strokeAlign: strokeAlign ?? defaultValue.strokeAlign,
    );
  }

  @override
  get props => [color, width, style, strokeAlign];
}
