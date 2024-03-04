// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class ScaleDecoratorSpec extends DecoratorSpec<ScaleDecoratorSpec> {
  final double scale;
  const ScaleDecoratorSpec(this.scale);

  @override
  ScaleDecoratorSpec lerp(ScaleDecoratorSpec? other, double t) {
    return ScaleDecoratorSpec(lerpDouble(scale, other?.scale, t) ?? scale);
  }

  @override
  ScaleDecoratorSpec copyWith({double? scale}) {
    return ScaleDecoratorSpec(scale ?? this.scale);
  }

  @override
  List<Object?> get props => [scale];

  @override
  Widget build(Widget child) {
    return Transform.scale(scale: scale, child: child);
  }
}

class ScaleDecoratorAttribute
    extends DecoratorAttribute<ScaleDecoratorAttribute, ScaleDecoratorSpec> {
  final double scale;
  const ScaleDecoratorAttribute(this.scale);

  @override
  ScaleDecoratorAttribute merge(ScaleDecoratorAttribute? other) {
    return ScaleDecoratorAttribute(other?.scale ?? scale);
  }

  @override
  ScaleDecoratorSpec resolve(MixData mix) {
    return ScaleDecoratorSpec(scale);
  }

  @override
  List<Object?> get props => [scale];
}

class ScaleUtility<T extends StyleAttribute>
    extends MixUtility<T, ScaleDecoratorAttribute> {
  const ScaleUtility(super.builder);
  T call(double value) => builder(ScaleDecoratorAttribute(value));
}
