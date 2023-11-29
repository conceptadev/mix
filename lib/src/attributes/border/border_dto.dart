// ignore_for_file: prefer-returning-conditional-expressions

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_attribute.dart';

@immutable
class BoxBorderDto extends Dto<BoxBorderDto, BoxBorder> {
  final BorderSideDto? top;
  final BorderSideDto? bottom;

  final BorderSideDto? left;
  final BorderSideDto? right;

  // Directional
  final BorderSideDto? start;
  final BorderSideDto? end;

  const BoxBorderDto({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
  });

  bool get _hasStartOrEnd => start != null || end != null;

  bool get _hasLeftOrRight => left != null || right != null;

  bool get isDirectional => _hasStartOrEnd && !_hasLeftOrRight;

  Type? checkMergeType(BoxBorderDto other) {
    if (_hasLeftOrRight && !other._hasStartOrEnd) {
      return Border;
    }
    if (_hasStartOrEnd && !other._hasLeftOrRight) {
      return BorderDirectional;
    }

    return null;
  }

  @override
  BoxBorderDto merge(BoxBorderDto? other) {
    if (other == null) return this;
    final type = checkMergeType(other);
    assert(type != null, 'Cannot merge Border with BoxBorderDirectional');
    if (type == Border) {
      return BoxBorderDto(
        top: other.top ?? top,
        bottom: other.bottom ?? bottom,
        left: other.left ?? left,
        right: other.right ?? right,
      );
    }

    if (type == BorderDirectional) {
      return BoxBorderDto(
        top: other.top ?? top,
        bottom: other.bottom ?? bottom,
        start: other.start ?? start,
        end: other.end ?? end,
      );
    }

    return other;
  }

  @override
  BoxBorder resolve(MixData mix) {
    if (isDirectional) {
      return BorderDirectional(
        top: top?.resolve(mix) ?? BorderSide.none,
        start: start?.resolve(mix) ?? BorderSide.none,
        end: end?.resolve(mix) ?? BorderSide.none,
        bottom: bottom?.resolve(mix) ?? BorderSide.none,
      );
    }

    return Border(
      top: top?.resolve(mix) ?? BorderSide.none,
      right: right?.resolve(mix) ?? BorderSide.none,
      bottom: bottom?.resolve(mix) ?? BorderSide.none,
      left: left?.resolve(mix) ?? BorderSide.none,
    );
  }

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
class BorderSideDto extends Dto<BorderSideDto, BorderSide> {
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

  static BorderSideDto from(BorderSide side) {
    return BorderSideDto(
      color: ColorDto(side.color),
      strokeAlign: side.strokeAlign,
      style: side.style,
      width: side.width,
    );
  }

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
