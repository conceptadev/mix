import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';
import 'color_attribute.dart';

@immutable
class BorderRadiusGeometryAttribute
    extends VisualAttribute<BorderRadiusGeometry> {
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

  // Directional values
  final Radius? topStart;
  final Radius? topEnd;
  final Radius? bottomStart;
  final Radius? bottomEnd;

  const BorderRadiusGeometryAttribute({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.topStart,
    this.topEnd,
    this.bottomStart,
    this.bottomEnd,
  });

  bool get isDirectional => topStart != null || topEnd != null;

  BorderRadiusGeometryAttribute copyWith({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    return BorderRadiusGeometryAttribute(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      topStart: topStart ?? this.topStart,
      topEnd: topEnd ?? this.topEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      bottomEnd: bottomEnd ?? this.bottomEnd,
    );
  }

  @override
  BorderRadiusGeometryAttribute merge(BorderRadiusGeometryAttribute? other) {
    if (other == null) return this;
    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional border radius attributes",
      );
    }

    return BorderRadiusGeometryAttribute(
      topLeft: other.topLeft ?? topLeft,
      topRight: other.topRight ?? topRight,
      bottomLeft: other.bottomLeft ?? bottomLeft,
      bottomRight: other.bottomRight ?? bottomRight,
      topStart: other.topStart ?? topStart,
      topEnd: other.topEnd ?? topEnd,
      bottomStart: other.bottomStart ?? bottomStart,
      bottomEnd: other.bottomEnd ?? bottomEnd,
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
      ];
}

@immutable
class BoxBorderAttribute extends VisualAttribute<BoxBorder> {
  final BorderSideAttribute? top;
  final BorderSideAttribute? start;
  final BorderSideAttribute? end;
  final BorderSideAttribute? bottom;
  final BorderSideAttribute? left;
  final BorderSideAttribute? right;

  const BoxBorderAttribute({
    this.top,
    this.start,
    this.end,
    this.bottom,
    this.left,
    this.right,
  });

  bool get isDirectional => start != null || end != null;

  @override
  BoxBorderAttribute merge(BoxBorderAttribute? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional box border attributes",
      );
    }

    return BoxBorderAttribute(
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
  get props => [top, start, end, bottom, left, right];
}

@immutable
class BorderSideAttribute extends VisualAttribute<BorderSide> {
  final ColorAttribute? color;
  final double? width;
  final BorderStyle? style;
  final double? strokeAlign;

  const BorderSideAttribute({
    this.color,
    this.strokeAlign,
    this.style,
    this.width,
  });

  BorderSideAttribute copyWith({
    ColorAttribute? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return BorderSideAttribute(
      color: color ?? this.color,
      strokeAlign: strokeAlign ?? this.strokeAlign,
      style: style ?? this.style,
      width: width ?? this.width,
    );
  }

  @override
  BorderSideAttribute merge(BorderSideAttribute? other) {
    if (other == null) return this;

    return BorderSideAttribute(
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
