// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class RotatedBoxWidgetSpec extends DecoratorSpec<RotatedBoxWidgetSpec> {
  final int quarterTurns;
  const RotatedBoxWidgetSpec(this.quarterTurns);

  @override
  RotatedBoxWidgetSpec lerp(RotatedBoxWidgetSpec? other, double t) {
    // Use lerpInt for interpolating between integers
    return RotatedBoxWidgetSpec(
      lerpInt(quarterTurns, other?.quarterTurns ?? quarterTurns, t),
    );
  }

  @override
  RotatedBoxWidgetSpec copyWith({int? quarterTurns}) {
    return RotatedBoxWidgetSpec(quarterTurns ?? this.quarterTurns);
  }

  @override
  List<Object?> get props => [quarterTurns];

  @override
  Widget build(Widget child) {
    return RotatedBox(quarterTurns: quarterTurns, child: child);
  }
}

class RotatedBoxWidgetDecorator
    extends WidgetDecorator<RotatedBoxWidgetDecorator, RotatedBoxWidgetSpec> {
  final int quarterTurns;
  const RotatedBoxWidgetDecorator(this.quarterTurns);

  @override
  RotatedBoxWidgetDecorator merge(RotatedBoxWidgetDecorator? other) {
    // Merge by prioritizing the properties of the other instance if available
    return RotatedBoxWidgetDecorator(other?.quarterTurns ?? quarterTurns);
  }

  @override
  RotatedBoxWidgetSpec resolve(MixData mix) =>
      RotatedBoxWidgetSpec(quarterTurns);

  @override
  List<Object?> get props => [quarterTurns];
}

class RotatedBoxWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, RotatedBoxWidgetDecorator> {
  const RotatedBoxWidgetUtility(super.builder);
  T d90() => builder(const RotatedBoxWidgetDecorator(1));
  T d180() => builder(const RotatedBoxWidgetDecorator(2));
  T d270() => builder(const RotatedBoxWidgetDecorator(3));

  T call(int value) => builder(RotatedBoxWidgetDecorator(value));
}
