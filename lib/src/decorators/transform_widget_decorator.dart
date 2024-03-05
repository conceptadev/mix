// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class TransformDecoratorSpec extends DecoratorSpec<TransformDecoratorSpec> {
  final Matrix4? transform;
  const TransformDecoratorSpec({this.transform});

  @override
  TransformDecoratorSpec lerp(TransformDecoratorSpec? other, double t) {
    return TransformDecoratorSpec(
      transform: Matrix4Tween(begin: transform, end: other?.transform).lerp(t),
    );
  }

  @override
  TransformDecoratorSpec copyWith({Matrix4? transform}) {
    return TransformDecoratorSpec(transform: transform ?? this.transform);
  }

  @override
  List<Object?> get props => [transform];

  @override
  Widget build(Widget child) {
    return Transform(transform: transform ?? Matrix4.identity(), child: child);
  }
}

class TransformDecoratorAttribute extends DecoratorAttribute<
    TransformDecoratorAttribute, TransformDecoratorSpec> {
  final Matrix4? transform;
  const TransformDecoratorAttribute({this.transform});

  @override
  TransformDecoratorAttribute merge(TransformDecoratorAttribute? other) {
    return TransformDecoratorAttribute(
      transform: other?.transform ?? transform,
    );
  }

  @override
  TransformDecoratorSpec resolve(MixData mix) {
    return TransformDecoratorSpec(transform: transform);
  }

  @override
  List<Object?> get props => [transform];
}

class TransformUtility<T extends StyleAttribute>
    extends MixUtility<T, TransformDecoratorAttribute> {
  const TransformUtility(super.builder);
  T call(Matrix4 value) =>
      builder(TransformDecoratorAttribute(transform: value));
}
