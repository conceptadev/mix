import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import '../color_attribute.dart';

@immutable
abstract class BoxBorderDto<Value extends BoxBorder> extends Dto<Value> {
  final BorderSideDto? _top;
  final BorderSideDto? _bottom;

  final BorderSideDto? _left;
  final BorderSideDto? _right;

  // Directional
  final BorderSideDto? _start;
  final BorderSideDto? _end;

  const BoxBorderDto({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
    BorderSideDto? start,
    BorderSideDto? end,
  })  : _top = top,
        _bottom = bottom,
        _left = left,
        _right = right,
        _start = start,
        _end = end;

  BorderSideDto? get top => _top;
  BorderSideDto? get bottom => _bottom;

  bool get hasStartOrEnd => _start != null || _end != null;

  bool get hasLeftOrRight => _left != null || _right != null;

  Type? canMergeType(covariant BoxBorderDto other) {
    if (other is BorderDto && this is BorderDto) return BorderDto;
    if (other is BorderDirectionalDto && this is BorderDirectionalDto) {
      return BorderDirectionalDto;
    }

    if (hasLeftOrRight && !other.hasStartOrEnd) {
      return BorderDto;
    }
    if (hasStartOrEnd && !other.hasLeftOrRight) {
      return BorderDirectionalDto;
    }

    return null;
  }

  @override
  BoxBorderDto merge(covariant BoxBorderDto? other) {
    if (other == null) return this;

    final mergeableType = canMergeType(other);

    if (mergeableType == BorderDto) {
      return BorderDto(
        top: other._top ?? _top,
        bottom: other._bottom ?? _bottom,
        left: other._left ?? _left,
        right: other._right ?? _right,
      );
    }

    if (mergeableType == BorderDirectionalDto) {
      return BorderDirectionalDto(
        start: other._start ?? _start,
        end: other._end ?? _end,
        top: other._top ?? _top,
        bottom: other._bottom ?? _bottom,
      );
    }

    return other;
  }

  @override
  get props => [_top, _bottom, _left, _right, _start, _end];
}

class BorderDto extends BoxBorderDto<Border> {
  const BorderDto({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) : super(top: top, bottom: bottom, left: left, right: right);

  const BorderDto.all(BorderSideDto side)
      : this(top: side, bottom: side, left: side, right: side);

  /// Creates a border with symmetrical vertical and horizontal sides.
  ///
  /// The `vertical` argument applies to the [_left] and [right] sides, and the
  /// `horizontal` argument applies to the [_top] and [_bottom] sides.
  const BorderDto.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) : this(
          top: horizontal,
          bottom: horizontal,
          left: vertical,
          right: vertical,
        );

  BorderSideDto? get left => _left;
  BorderSideDto? get right => _right;

  @override
  Border resolve(MixData mix) {
    const defaultValue = Border();

    return Border(
      top: _top?.resolve(mix) ?? defaultValue.top,
      right: _right?.resolve(mix) ?? defaultValue.right,
      bottom: _bottom?.resolve(mix) ?? defaultValue.bottom,
      left: _left?.resolve(mix) ?? defaultValue.left,
    );
  }
}

class BorderDirectionalDto extends BoxBorderDto<BorderDirectional> {
  const BorderDirectionalDto({
    BorderSideDto? start,
    BorderSideDto? end,
    BorderSideDto? top,
    BorderSideDto? bottom,
  }) : super(top: top, bottom: bottom, start: start, end: end);

  const BorderDirectionalDto.all(BorderSideDto side)
      : this(start: side, end: side, top: side, bottom: side);

  const BorderDirectionalDto.symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) : this(
          start: horizontal,
          end: horizontal,
          top: vertical,
          bottom: vertical,
        );

  BorderSideDto? get start => _start;
  BorderSideDto? get end => _end;

  @override
  BorderDirectional resolve(MixData mix) {
    const defaultValue = BorderDirectional();

    return BorderDirectional(
      top: _top?.resolve(mix) ?? defaultValue.top,
      start: _start?.resolve(mix) ?? defaultValue.start,
      end: _end?.resolve(mix) ?? defaultValue.end,
      bottom: _bottom?.resolve(mix) ?? defaultValue.bottom,
    );
  }
}

@immutable
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
      color: other.color ?? color,
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

abstract class BoxBorderAttribute<T extends BoxBorderDto<Value>,
    Value extends BoxBorder> extends ResolvableAttribute<T, Value> {
  const BoxBorderAttribute(super.value);

  static BoxBorderAttribute from(BoxBorderDto dto) {
    if (dto is BorderDto) return BorderAttribute(dto);
    if (dto is BorderDirectionalDto) return BorderDirectionalAttribute(dto);

    throw Exception('Cannot create BoxBorderAttribute from $dto');
  }

  @visibleForTesting
  BorderSideDto? get top => value.top;

  @visibleForTesting
  BorderSideDto? get bottom => value._bottom;
  @override
  BoxBorderAttribute merge(covariant BoxBorderAttribute? other) {
    return other == null ? this : from(value.merge(other.value));
  }

  @override
  Value resolve(MixData mix) => value.resolve(mix);
}

class BorderAttribute extends BoxBorderAttribute<BorderDto, Border> {
  const BorderAttribute(super.value);

  @visibleForTesting
  BorderSideDto? get left => value.left;

  @visibleForTesting
  BorderSideDto? get right => value.right;
}

class BorderDirectionalAttribute
    extends BoxBorderAttribute<BorderDirectionalDto, BorderDirectional> {
  const BorderDirectionalAttribute(super.value);

  @visibleForTesting
  BorderSideDto? get start => value.start;

  @visibleForTesting
  BorderSideDto? get end => value.end;
}
