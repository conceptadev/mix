// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class RotatedBoxDecoratorSpec extends DecoratorSpec<RotatedBoxDecoratorSpec> {
  final int quarterTurns;
  const RotatedBoxDecoratorSpec(this.quarterTurns);

  @override
  RotatedBoxDecoratorSpec lerp(RotatedBoxDecoratorSpec? other, double t) {
    // Use lerpInt for interpolating between integers
    return RotatedBoxDecoratorSpec(
      lerpInt(quarterTurns, other?.quarterTurns ?? quarterTurns, t),
    );
  }

  @override
  RotatedBoxDecoratorSpec copyWith({int? quarterTurns}) {
    return RotatedBoxDecoratorSpec(quarterTurns ?? this.quarterTurns);
  }

  @override
  List<Object?> get props => [quarterTurns];

  @override
  Widget build(Widget child) {
    return RotatedBox(quarterTurns: quarterTurns, child: child);
  }
}

class RotatedBoxDecoratorAttribute extends DecoratorAttribute<
    RotatedBoxDecoratorAttribute, RotatedBoxDecoratorSpec> {
  final int quarterTurns;
  const RotatedBoxDecoratorAttribute(this.quarterTurns);

  @override
  RotatedBoxDecoratorAttribute merge(RotatedBoxDecoratorAttribute? other) {
    // Merge by prioritizing the properties of the other instance if available
    return RotatedBoxDecoratorAttribute(other?.quarterTurns ?? quarterTurns);
  }

  @override
  RotatedBoxDecoratorSpec resolve(MixData mix) =>
      RotatedBoxDecoratorSpec(quarterTurns);

  @override
  List<Object?> get props => [quarterTurns];
}

class RotatedBoxWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, RotatedBoxDecoratorAttribute> {
  const RotatedBoxWidgetUtility(super.builder);
  T d90() => builder(const RotatedBoxDecoratorAttribute(1));
  T d180() => builder(const RotatedBoxDecoratorAttribute(2));
  T d270() => builder(const RotatedBoxDecoratorAttribute(3));

  T call(int value) => builder(RotatedBoxDecoratorAttribute(value));
}
