import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mix/src/attributes/base_attribute.dart';

part 'space.freezed.dart';

class SpaceUtility<T extends SpaceAttribute> {
  const SpaceUtility();

  T all(double space) => builder(
        left: space,
        top: space,
        right: space,
        bottom: space,
      );

  T horizontal(double space) => builder(
        left: space,
        right: space,
      );
  T vertical(double space) => builder(
        top: space,
        bottom: space,
      );
  T left(double space) => builder(left: space);
  T top(double space) => builder(top: space);
  T right(double space) => builder(right: space);
  T bottom(double space) => builder(bottom: space);

  T builder({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return SpaceAttribute.create(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }
}

/// Space Attribute
@freezed
class SpaceAttribute extends Attribute<EdgeInsets> with _$SpaceAttribute {
  const SpaceAttribute._();

  /// Defaut constructor
  factory SpaceAttribute({
    final double? left,
    final double? top,
    final double? right,
    final double? bottom,
  }) = _SpaceAttribute;

  /// Margin constructor
  factory SpaceAttribute.margin({
    final double? left,
    final double? top,
    final double? right,
    final double? bottom,
  }) = MarginAttribute;

  /// Padding constructor
  factory SpaceAttribute.padding({
    final double? left,
    final double? top,
    final double? right,
    final double? bottom,
  }) = PaddingAttribute;
  @override
  EdgeInsets get value {
    return EdgeInsets.only(
      left: left ?? 0.0,
      right: right ?? 0.0,
      top: top ?? 0.0,
      bottom: bottom ?? 0.0,
    );
  }

  /// Create instance a class of SpaceeAttrtibute
  static T create<T extends SpaceAttribute>({
    final double? left,
    final double? top,
    final double? right,
    final double? bottom,
  }) {
    assert(T != SpaceAttribute);
    switch (T) {
      case MarginAttribute:
        return MarginAttribute(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ) as T;
      case PaddingAttribute:
        return PaddingAttribute(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ) as T;

      default:
        throw Exception('Cannot create SpaceAttribute of $T');
    }
  }
}

/// Builder
T mergeSpaceAttribute<T extends SpaceAttribute>(T? attribute, T other) {
  assert(T != SpaceAttribute);

  /// Create new object if null
  attribute ??= SpaceAttribute.create<T>();
  return attribute.copyWith(
    left: other.left ?? attribute.left,
    top: other.top ?? attribute.top,
    bottom: other.bottom ?? attribute.bottom,
    right: other.right ?? attribute.right,
  ) as T;
}
