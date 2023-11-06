import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import '../color_attribute.dart';

@immutable
abstract class BoxBorderAttribute<T extends BoxBorder>
    extends VisualAttribute<T> {
  final BorderSideAttribute? top;

  final BorderSideAttribute? bottom;

  const BoxBorderAttribute({this.top, this.bottom});

  @override
  BoxBorderAttribute merge(covariant BoxBorderAttribute? other);

  @override
  T resolve(MixData mix);

  @override
  get props => [top, bottom];
}

class BorderAttribute extends BoxBorderAttribute<Border> {
  final BorderSideAttribute? left;
  final BorderSideAttribute? right;

  const BorderAttribute({this.left, this.right, super.top, super.bottom});

  const BorderAttribute.all(BorderSideAttribute side)
      : this(left: side, right: side, top: side, bottom: side);

  const BorderAttribute.symmetric({
    BorderSideAttribute? vertical,
    BorderSideAttribute? horizontal,
  }) : this(
          left: vertical,
          right: vertical,
          top: horizontal,
          bottom: horizontal,
        );

  @override
  BorderAttribute merge(BoxBorderAttribute<Border>? other) {
    if (other == null) return this;
    final otherAttribute = other as BorderAttribute; // cast the other instance

    return BorderAttribute(
      left: left?.merge(otherAttribute.left) ?? otherAttribute.left,
      right: right?.merge(otherAttribute.right) ?? otherAttribute.right,
      top: top?.merge(other.top) ?? other.top,
      bottom: bottom?.merge(other.bottom) ?? other.bottom,
    );
  }

  @override
  Border resolve(MixData mix) {
    return Border(
      top: top?.resolve(mix) ?? BorderSide.none,
      right: right?.resolve(mix) ?? BorderSide.none,
      bottom: bottom?.resolve(mix) ?? BorderSide.none,
      left: left?.resolve(mix) ?? BorderSide.none,
    );
  }

  @override
  List<Object?> get props => [top, bottom, left, right];
}

class BorderDirectionalAttribute extends BoxBorderAttribute<BorderDirectional> {
  final BorderSideAttribute? start;
  final BorderSideAttribute? end;

  const BorderDirectionalAttribute({
    this.start,
    this.end,
    super.top,
    super.bottom,
  });

  const BorderDirectionalAttribute.all(BorderSideAttribute side)
      : this(start: side, end: side, top: side, bottom: side);

  const BorderDirectionalAttribute.symmetric({
    BorderSideAttribute? vertical,
    BorderSideAttribute? horizontal,
  }) : this(
          start: horizontal,
          end: horizontal,
          top: vertical,
          bottom: vertical,
        );
  @override
  BorderDirectionalAttribute merge(
    BoxBorderAttribute<BorderDirectional>? other,
  ) {
    if (other == null) return this;
    final otherAttribute =
        other as BorderDirectionalAttribute; // cast the other instance

    return BorderDirectionalAttribute(
      start: start?.merge(otherAttribute.start) ?? otherAttribute.start,
      end: end?.merge(otherAttribute.end) ?? otherAttribute.end,
      top: top?.merge(other.top) ?? other.top,
      bottom: bottom?.merge(other.bottom) ?? other.bottom,
    );
  }

  @override
  BorderDirectional resolve(MixData mix) {
    return BorderDirectional(
      top: top?.resolve(mix) ?? BorderSide.none,
      start: start?.resolve(mix) ?? BorderSide.none,
      end: end?.resolve(mix) ?? BorderSide.none,
      bottom: bottom?.resolve(mix) ?? BorderSide.none,
    );
  }

  @override
  List<Object?> get props => [top, bottom, start, end];
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
