// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class ScaleWidgetSpec extends DecoratorSpec<ScaleWidgetSpec> {
  final double scale;
  const ScaleWidgetSpec(this.scale);

  @override
  ScaleWidgetSpec lerp(ScaleWidgetSpec? other, double t) {
    return ScaleWidgetSpec(lerpDouble(scale, other?.scale, t) ?? scale);
  }

  @override
  ScaleWidgetSpec copyWith({double? scale}) {
    return ScaleWidgetSpec(scale ?? this.scale);
  }

  @override
  List<Object?> get props => [scale];

  @override
  Widget build(Widget child) {
    return Transform.scale(scale: scale, child: child);
  }
}

class ScaleWidgetDecorator
    extends WidgetDecorator<ScaleWidgetDecorator, ScaleWidgetSpec> {
  final double scale;
  const ScaleWidgetDecorator(this.scale);

  @override
  ScaleWidgetDecorator merge(ScaleWidgetDecorator? other) {
    return ScaleWidgetDecorator(other?.scale ?? scale);
  }

  @override
  ScaleWidgetSpec resolve(MixData mix) {
    return ScaleWidgetSpec(scale);
  }

  @override
  List<Object?> get props => [scale];
}

class ScaleUtility<T extends StyleAttribute>
    extends MixUtility<T, ScaleWidgetDecorator> {
  const ScaleUtility(super.builder);
  T call(double value) => builder(ScaleWidgetDecorator(value));
}
