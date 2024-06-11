// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/models/mix_data.dart';
import '../core/modifier.dart';
import '../internal/lerp_helpers.dart';

class RotatedBoxModifierSpec
    extends WidgetModifierSpec<RotatedBoxModifierSpec> {
  final int quarterTurns;
  const RotatedBoxModifierSpec(this.quarterTurns);

  @override
  RotatedBoxModifierSpec lerp(RotatedBoxModifierSpec? other, double t) {
    // Use lerpInt for interpolating between integers
    return RotatedBoxModifierSpec(
      lerpInt(quarterTurns, other?.quarterTurns, t) ?? quarterTurns,
    );
  }

  @override
  RotatedBoxModifierSpec copyWith({int? quarterTurns}) {
    return RotatedBoxModifierSpec(quarterTurns ?? this.quarterTurns);
  }

  @override
  List<Object?> get props => [quarterTurns];

  @override
  Widget build(Widget child) {
    return RotatedBox(quarterTurns: quarterTurns, child: child);
  }
}

class RotatedBoxModifierAttribute extends WidgetModifierAttribute<
    RotatedBoxModifierAttribute, RotatedBoxModifierSpec> {
  final int quarterTurns;
  const RotatedBoxModifierAttribute(this.quarterTurns);

  @override
  RotatedBoxModifierAttribute merge(RotatedBoxModifierAttribute? other) {
    // Merge by prioritizing the properties of the other instance if available
    return RotatedBoxModifierAttribute(other?.quarterTurns ?? quarterTurns);
  }

  @override
  RotatedBoxModifierSpec resolve(MixData mix) =>
      RotatedBoxModifierSpec(quarterTurns);

  @override
  List<Object?> get props => [quarterTurns];
}

class RotatedBoxWidgetUtility<T extends Attribute>
    extends MixUtility<T, RotatedBoxModifierAttribute> {
  const RotatedBoxWidgetUtility(super.builder);
  T d90() => builder(const RotatedBoxModifierAttribute(1));
  T d180() => builder(const RotatedBoxModifierAttribute(2));
  T d270() => builder(const RotatedBoxModifierAttribute(3));

  T call(int value) => builder(RotatedBoxModifierAttribute(value));
}
