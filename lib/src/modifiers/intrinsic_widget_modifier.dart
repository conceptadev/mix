// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/modifier.dart';
import '../factory/mix_provider_data.dart';

class IntrinsicHeightModifierSpec
    extends ModifierSpec<IntrinsicHeightModifierSpec> {
  const IntrinsicHeightModifierSpec();

  @override
  IntrinsicHeightModifierSpec lerp(
    IntrinsicHeightModifierSpec? other,
    double t,
  ) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicHeightModifierSpec copyWith() {
    // No properties to copy, return this instance
    return this;
  }

  @override
  List<Object?> get props => []; // No properties

  @override
  Widget build(Widget child) {
    return IntrinsicHeight(child: child);
  }
}

class IntrinsicHeightModifierAttribute extends ModifierAttribute<
    IntrinsicHeightModifierAttribute, IntrinsicHeightModifierSpec> {
  const IntrinsicHeightModifierAttribute();

  @override
  IntrinsicHeightModifierAttribute merge(
    IntrinsicHeightModifierAttribute? other,
  ) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicHeightModifierSpec resolve(MixData mix) {
    // Return an instance of IntrinsicHeightSpec
    return const IntrinsicHeightModifierSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicWidthModifierSpec
    extends ModifierSpec<IntrinsicWidthModifierSpec> {
  const IntrinsicWidthModifierSpec();

  @override
  IntrinsicWidthModifierSpec lerp(
    IntrinsicWidthModifierSpec? other,
    double t,
  ) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicWidthModifierSpec copyWith() {
    // No properties to copy, return this instance
    return this;
  }

  @override
  List<Object?> get props => []; // No properties

  @override
  Widget build(Widget child) {
    return IntrinsicWidth(child: child);
  }
}

class IntrinsicWidthModifierAttribute extends ModifierAttribute<
    IntrinsicWidthModifierAttribute, IntrinsicWidthModifierSpec> {
  const IntrinsicWidthModifierAttribute();

  @override
  IntrinsicWidthModifierAttribute merge(
    IntrinsicWidthModifierAttribute? other,
  ) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicWidthModifierSpec resolve(MixData mix) {
    // Return an instance of InstrinsicWidthSpec
    return const IntrinsicWidthModifierSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicHeightWidgetUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicHeightModifierAttribute> {
  const IntrinsicHeightWidgetUtility(super.builder);
  T call() => builder(const IntrinsicHeightModifierAttribute());
}

class IntrinsicWidthWidgetUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicWidthModifierAttribute> {
  const IntrinsicWidthWidgetUtility(super.builder);
  T call() => builder(const IntrinsicWidthModifierAttribute());
}
