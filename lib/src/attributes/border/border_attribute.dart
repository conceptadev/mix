import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import '../color_attribute.dart';

@immutable
abstract class BoxBorderAttribute<Value extends BoxBorder>
    extends ResolvableAttribute<Value> {
  final BorderSideAttribute? _top;
  final BorderSideAttribute? _bottom;

  final BorderSideAttribute? _left;
  final BorderSideAttribute? _right;

  // Directional
  final BorderSideAttribute? _start;
  final BorderSideAttribute? _end;

  const BoxBorderAttribute({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
    BorderSideAttribute? start,
    BorderSideAttribute? end,
  })  : _top = top,
        _bottom = bottom,
        _left = left,
        _right = right,
        _start = start,
        _end = end;

  BorderSideAttribute? get top => _top;
  BorderSideAttribute? get bottom => _bottom;

  bool get hasStartOrEnd => _start != null || _end != null;

  bool get hasLeftOrRight => _left != null || _right != null;

  Type? canMergeType(covariant BoxBorderAttribute other) {
    if (other is BorderAttribute && this is BorderAttribute) {
      return BorderAttribute;
    }
    if (other is BorderDirectionalAttribute &&
        this is BorderDirectionalAttribute) {
      return BorderDirectionalAttribute;
    }

    if (hasLeftOrRight && !other.hasStartOrEnd) {
      return BorderAttribute;
    }
    if (hasStartOrEnd && !other.hasLeftOrRight) {
      return BorderDirectionalAttribute;
    }

    return null;
  }

  @override
  BoxBorderAttribute<Value> merge(covariant BoxBorderAttribute<Value>? other);

  @override
  get props => [_top, _bottom, _left, _right, _start, _end];
}

class BorderAttribute extends BoxBorderAttribute<Border> {
  const BorderAttribute({
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
    BorderSideAttribute? left,
    BorderSideAttribute? right,
  }) : super(top: top, bottom: bottom, left: left, right: right);

  factory BorderAttribute.all({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    final side = BorderSideAttribute(
      color: color?.toAttribute(),
      style: style,
      width: width,
    );

    return BorderAttribute.fromBorderSide(side);
  }

  /// Creates a border with symmetrical vertical and horizontal sides.
  ///
  /// The `vertical` argument applies to the [_left] and [right] sides, and the
  /// `horizontal` argument applies to the [_top] and [_bottom] sides.
  const BorderAttribute.symmetric({
    BorderSideAttribute? vertical,
    BorderSideAttribute? horizontal,
  }) : this(
          top: horizontal,
          bottom: horizontal,
          left: vertical,
          right: vertical,
        );

  const BorderAttribute.fromBorderSide(BorderSideAttribute side)
      : this(top: side, bottom: side, left: side, right: side);

  BorderSideAttribute? get left => _left;
  BorderSideAttribute? get right => _right;

  @override
  BorderAttribute merge(covariant BorderAttribute? other) {
    return BorderAttribute(
      top: other?.top ?? _top,
      bottom: other?.bottom ?? _bottom,
      left: other?.left ?? _left,
      right: other?.right ?? _right,
    );
  }

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

class BorderDirectionalAttribute extends BoxBorderAttribute<BorderDirectional> {
  const BorderDirectionalAttribute({
    BorderSideAttribute? start,
    BorderSideAttribute? end,
    BorderSideAttribute? top,
    BorderSideAttribute? bottom,
  }) : super(top: top, bottom: bottom, start: start, end: end);

  factory BorderDirectionalAttribute.all({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BorderDirectionalAttribute.fromBorderSide(
      BorderSideAttribute(
        color: color?.toAttribute(),
        style: style,
        width: width,
      ),
    );
  }

  const BorderDirectionalAttribute.symmetric({
    BorderSideAttribute? vertical,
    BorderSideAttribute? horizontal,
  }) : this(
          start: horizontal,
          end: horizontal,
          top: vertical,
          bottom: vertical,
        );

  const BorderDirectionalAttribute.fromBorderSide(BorderSideAttribute side)
      : this(start: side, end: side, top: side, bottom: side);

  BorderSideAttribute? get start => _start;
  BorderSideAttribute? get end => _end;

  @override
  BorderDirectionalAttribute merge(
    covariant BorderDirectionalAttribute? other,
  ) {
    return BorderDirectionalAttribute(
      start: other?.start ?? _start,
      end: other?.end ?? _end,
      top: other?.top ?? _top,
      bottom: other?.bottom ?? _bottom,
    );
  }

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
class BorderSideAttribute extends ResolvableAttribute<BorderSide> {
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
