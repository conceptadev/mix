// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class TransformDecoratorSpec extends DecoratorSpec<TransformDecoratorSpec> {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformDecoratorSpec({this.transform, this.alignment});

  @override
  TransformDecoratorSpec lerp(TransformDecoratorSpec? other, double t) {
    return TransformDecoratorSpec(
      transform: Matrix4Tween(begin: transform, end: other?.transform).lerp(t),
    );
  }

  @override
  TransformDecoratorSpec copyWith({
    Matrix4? transform,
    Alignment? alignment,
  }) {
    return TransformDecoratorSpec(
      transform: transform ?? this.transform,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  List<Object?> get props => [transform, alignment];

  @override
  Widget build(Widget child) {
    return Transform(
      transform: transform ?? Matrix4.identity(),
      alignment: alignment ?? Alignment.center,
      child: child,
    );
  }
}

class TransformDecoratorAttribute extends DecoratorAttribute<
    TransformDecoratorAttribute, TransformDecoratorSpec> {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformDecoratorAttribute({this.transform, this.alignment});

  @override
  TransformDecoratorAttribute merge(TransformDecoratorAttribute? other) {
    return TransformDecoratorAttribute(
      transform:
          other?.transform?.multiplied(transform ?? Matrix4.identity()) ??
              transform,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  TransformDecoratorSpec resolve(MixData mix) {
    return TransformDecoratorSpec(
      transform: transform,
      alignment: alignment,
    );
  }

  @override
  List<Object?> get props => [transform, alignment];
}

class TransformUtility<T extends StyleAttribute>
    extends MixUtility<T, TransformDecoratorAttribute> {
  const TransformUtility(super.builder);

  T _flip(bool x, bool y) => builder(
        TransformDecoratorAttribute(
          transform: Matrix4.diagonal3Values(
            x ? -1.0 : 1.0,
            y ? -1.0 : 1.0,
            1.0,
          ),
          alignment: Alignment.center,
        ),
      );

  T flipX() => _flip(true, false);
  T flipY() => _flip(false, true);

  T call(Matrix4 value) =>
      builder(TransformDecoratorAttribute(transform: value));

  T scale(double value) => builder(
        TransformDecoratorAttribute(
          transform: Matrix4.diagonal3Values(value, value, 1.0),
          alignment: Alignment.center,
        ),
      );

  T rotate(double value) => builder(
        TransformDecoratorAttribute(
          transform: Matrix4.rotationZ(value),
          alignment: Alignment.center,
        ),
      );
}
