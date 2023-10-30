import 'package:flutter/material.dart';

import '../../attributes/value_attributes.dart';
import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import 'dtos.dart';
import 'radius_dto.dart';

class BorderRadiusGeometryDto extends Dto<BorderRadiusGeometry> {
  final RadiusDto? topLeft;
  final RadiusDto? topRight;
  final RadiusDto? bottomLeft;
  final RadiusDto? bottomRight;

// Directional values
  final RadiusDto? topStart;
  final RadiusDto? topEnd;
  final RadiusDto? bottomStart;
  final RadiusDto? bottomEnd;

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

  const BorderRadiusGeometryDto.all(RadiusDto radius)
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
    RadiusDto? leftStart,
    RadiusDto? rightEnd,
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
    RadiusDto? top,
    RadiusDto? bottom,
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
    DoubleDto radius, {
    this.isDirectional = false,
  })  : topLeft = RadiusDto.circular(radius),
        topRight = RadiusDto.circular(radius),
        bottomLeft = RadiusDto.circular(radius),
        bottomRight = RadiusDto.circular(radius),
        topStart = RadiusDto.circular(radius),
        topEnd = RadiusDto.circular(radius),
        bottomStart = RadiusDto.circular(radius),
        bottomEnd = RadiusDto.circular(radius);

  BorderRadiusGeometryAttribute get asAttribute =>
      BorderRadiusGeometryAttribute(this);

  BorderRadiusGeometryDto get toDirectional => copyWith(isDirectional: true);

  BorderRadiusGeometryDto copyWith({
    RadiusDto? topLeft,
    RadiusDto? topRight,
    RadiusDto? bottomLeft,
    RadiusDto? bottomRight,
    RadiusDto? topStart,
    RadiusDto? topEnd,
    RadiusDto? bottomStart,
    RadiusDto? bottomEnd,
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
      topLeft: topLeft?.merge(other.topLeft) ?? other.topLeft,
      topRight: topRight?.merge(other.topRight) ?? other.topRight,
      bottomLeft: bottomLeft?.merge(other.bottomLeft) ?? other.bottomLeft,
      bottomRight: bottomRight?.merge(other.bottomRight) ?? other.bottomRight,
      topStart: topStart?.merge(other.topStart) ?? other.topStart,
      topEnd: topEnd?.merge(other.topEnd) ?? other.topEnd,
      bottomStart: bottomStart?.merge(other.bottomStart) ?? other.bottomStart,
      bottomEnd: bottomEnd?.merge(other.bottomEnd) ?? other.bottomEnd,
      isDirectional: other.isDirectional,
    );
  }

  @override
  BorderRadiusGeometry resolve(MixData mix) {
    return isDirectional
        ? BorderRadiusDirectional.only(
            topStart: topStart?.resolve(mix) ?? Radius.zero,
            topEnd: topEnd?.resolve(mix) ?? Radius.zero,
            bottomStart: bottomStart?.resolve(mix) ?? Radius.zero,
            bottomEnd: bottomEnd?.resolve(mix) ?? Radius.zero,
          )
        : BorderRadius.only(
            topLeft: topLeft?.resolve(mix) ?? Radius.zero,
            topRight: topRight?.resolve(mix) ?? Radius.zero,
            bottomLeft: bottomLeft?.resolve(mix) ?? Radius.zero,
            bottomRight: bottomRight?.resolve(mix) ?? Radius.zero,
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
  final DoubleDto? width;
  final BorderStyle? style;
  final DoubleDto? strokeAlign;

  const BorderSideDto({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  BorderSideDto copyWith({
    ColorDto? color,
    DoubleDto? width,
    BorderStyle? style,
    DoubleDto? strokeAlign,
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
      strokeAlign: strokeAlign?.merge(other.strokeAlign) ?? other.strokeAlign,
      style: other.style ?? style,
      width: width?.merge(other.width) ?? other.width,
    );
  }

  @override
  BorderSide resolve(MixData mix) {
    const defaultValue = BorderSide();

    return BorderSide(
      color: color?.resolve(mix) ?? defaultValue.color,
      width: width?.resolve(mix) ?? defaultValue.width,
      style: style ?? defaultValue.style,
      strokeAlign: strokeAlign?.resolve(mix) ?? defaultValue.strokeAlign,
    );
  }

  @override
  get props => [color, width, style, strokeAlign];
}
