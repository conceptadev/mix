// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class TransformWidgetSpec extends DecoratorSpec<TransformWidgetSpec> {
  final Matrix4? transform;
  const TransformWidgetSpec({this.transform});

  @override
  TransformWidgetSpec lerp(TransformWidgetSpec? other, double t) {
    return TransformWidgetSpec(
      transform: Matrix4Tween(begin: transform, end: other?.transform).lerp(t),
    );
  }

  @override
  TransformWidgetSpec copyWith({Matrix4? transform}) {
    return TransformWidgetSpec(transform: transform ?? this.transform);
  }

  @override
  List<Object?> get props => [transform];

  @override
  Widget build(Widget child) {
    return Transform(transform: transform ?? Matrix4.identity(), child: child);
  }
}

class TransformWidgetDecorator
    extends WidgetDecorator<TransformWidgetDecorator, TransformWidgetSpec> {
  final Matrix4? transform;
  const TransformWidgetDecorator({this.transform});

  @override
  TransformWidgetDecorator merge(TransformWidgetDecorator? other) {
    return TransformWidgetDecorator(transform: other?.transform ?? transform);
  }

  @override
  TransformWidgetSpec resolve(MixData mix) {
    return TransformWidgetSpec(transform: transform);
  }

  @override
  List<Object?> get props => [transform];
}

class TransformUtility<T extends StyleAttribute>
    extends MixUtility<T, TransformWidgetDecorator> {
  const TransformUtility(super.builder);
  T call(Matrix4 value) => builder(TransformWidgetDecorator(transform: value));
}
