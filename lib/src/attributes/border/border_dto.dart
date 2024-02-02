// ignore_for_file: prefer-returning-conditional-expressions

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';

@immutable
class BoxBorderDto extends Dto<BoxBorder> with Mergeable<BoxBorderDto> {
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

  static BoxBorderDto from(BoxBorder border) {
    if (border is Border) {
      return BoxBorderDto(
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
        left: BorderSideDto.from(border.left),
        right: BorderSideDto.from(border.right),
      );
    }

    if (border is BorderDirectional) {
      return BoxBorderDto(
        top: BorderSideDto.from(border.top),
        bottom: BorderSideDto.from(border.bottom),
        start: BorderSideDto.from(border.start),
        end: BorderSideDto.from(border.end),
      );
    }

    throw ArgumentError.value(
      border,
      'border',
      'Border type is not supported',
    );
  }

  static BoxBorderDto? maybeFrom(BoxBorder? border) {
    return border == null ? null : from(border);
  }

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
        top: top?.merge(other.top) ?? other.top,
        bottom: bottom?.merge(other.bottom) ?? other.bottom,
        left: left?.merge(other.left) ?? other.left,
        right: right?.merge(other.right) ?? other.right,
      );
    }

    if (type == BorderDirectional) {
      return BoxBorderDto(
        top: top?.merge(other.top) ?? other.top,
        bottom: bottom?.merge(other.bottom) ?? other.bottom,
        start: start?.merge(other.start) ?? other.start,
        end: end?.merge(other.end) ?? other.end,
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
class BorderSideDto extends Dto<BorderSide> with Mergeable<BorderSideDto> {
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

  static BorderSideDto? maybeFrom(BorderSide? side) {
    return side == null ? null : from(side);
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
