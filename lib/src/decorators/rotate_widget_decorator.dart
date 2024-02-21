// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class RotateWidgetSpec extends DecoratorSpec<RotateWidgetSpec> {
  final int quarterTurns;
  const RotateWidgetSpec(this.quarterTurns);

  @override
  RotateWidgetSpec lerp(RotateWidgetSpec? other, double t) {
    // Use lerpInt for interpolating between integers
    return RotateWidgetSpec(
      lerpInt(quarterTurns, other?.quarterTurns ?? quarterTurns, t),
    );
  }

  @override
  RotateWidgetSpec copyWith({int? quarterTurns}) {
    return RotateWidgetSpec(quarterTurns ?? this.quarterTurns);
  }

  @override
  List<Object?> get props => [quarterTurns];

  @override
  Widget build(Widget child) {
    return RotatedBox(quarterTurns: quarterTurns, child: child);
  }
}

class RotateWidgetDecorator
    extends WidgetDecorator<RotateWidgetDecorator, RotateWidgetSpec> {
  final int quarterTurns;
  const RotateWidgetDecorator(this.quarterTurns);

  @override
  RotateWidgetDecorator merge(RotateWidgetDecorator? other) {
    // Merge by prioritizing the properties of the other instance if available
    return RotateWidgetDecorator(other?.quarterTurns ?? quarterTurns);
  }

  @override
  RotateWidgetSpec resolve(MixData mix) => RotateWidgetSpec(quarterTurns);

  @override
  List<Object?> get props => [quarterTurns];
}

class RotateUtility<T extends StyleAttribute>
    extends MixUtility<T, RotateWidgetDecorator> {
  const RotateUtility(super.builder);
  T d90() => builder(const RotateWidgetDecorator(1));
  T d180() => builder(const RotateWidgetDecorator(2));
  T d270() => builder(const RotateWidgetDecorator(3));

  T call(int value) => builder(RotateWidgetDecorator(value));
}
