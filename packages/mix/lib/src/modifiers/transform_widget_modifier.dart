// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/models/mix_data.dart';
import '../core/modifier.dart';
import '../internal/lerp_helpers.dart';

class TransformModifierSpec extends WidgetModifierSpec<TransformModifierSpec> {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformModifierSpec({this.transform, this.alignment});

  @override
  TransformModifierSpec lerp(TransformModifierSpec? other, double t) {
    return TransformModifierSpec(
      transform: lerpMatrix4(transform, other?.transform, t),
    );
  }

  @override
  TransformModifierSpec copyWith({Matrix4? transform, Alignment? alignment}) {
    return TransformModifierSpec(
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

class TransformModifierAttribute extends WidgetModifierAttribute<
    TransformModifierAttribute, TransformModifierSpec> {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformModifierAttribute({this.transform, this.alignment});

  @override
  TransformModifierAttribute merge(TransformModifierAttribute? other) {
    return TransformModifierAttribute(
      transform:
          other?.transform?.multiplied(transform ?? Matrix4.identity()) ??
              transform,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  TransformModifierSpec resolve(MixData mix) {
    return TransformModifierSpec(transform: transform, alignment: alignment);
  }

  @override
  List<Object?> get props => [transform, alignment];
}

class TransformUtility<T extends Attribute>
    extends MixUtility<T, TransformModifierAttribute> {
  const TransformUtility(super.builder);

  T _flip(bool x, bool y) => builder(
        TransformModifierAttribute(
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
      builder(TransformModifierAttribute(transform: value));

  T scale(double value) => builder(
        TransformModifierAttribute(
          transform: Matrix4.diagonal3Values(value, value, 1.0),
          alignment: Alignment.center,
        ),
      );

  T rotate(double value) => builder(
        TransformModifierAttribute(
          transform: Matrix4.rotationZ(value),
          alignment: Alignment.center,
        ),
      );
}
