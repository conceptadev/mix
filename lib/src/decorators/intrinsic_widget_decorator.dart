// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class IntrinsicHeightDecoratorSpec
    extends DecoratorSpec<IntrinsicHeightDecoratorSpec> {
  const IntrinsicHeightDecoratorSpec();

  @override
  IntrinsicHeightDecoratorSpec lerp(
      IntrinsicHeightDecoratorSpec? other, double t) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicHeightDecoratorSpec copyWith() {
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

class IntrinsicHeightDecoratorAttribute extends DecoratorAttribute<
    IntrinsicHeightDecoratorAttribute, IntrinsicHeightDecoratorSpec> {
  const IntrinsicHeightDecoratorAttribute();

  @override
  IntrinsicHeightDecoratorAttribute merge(
    IntrinsicHeightDecoratorAttribute? other,
  ) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicHeightDecoratorSpec resolve(MixData mix) {
    // Return an instance of IntrinsicHeightSpec
    return const IntrinsicHeightDecoratorSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicWidthDecoratorSpec
    extends DecoratorSpec<IntrinsicWidthDecoratorSpec> {
  const IntrinsicWidthDecoratorSpec();

  @override
  IntrinsicWidthDecoratorSpec lerp(
      IntrinsicWidthDecoratorSpec? other, double t) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicWidthDecoratorSpec copyWith() {
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

class IntrinsicWidthDecoratorAttribute extends DecoratorAttribute<
    IntrinsicWidthDecoratorAttribute, IntrinsicWidthDecoratorSpec> {
  const IntrinsicWidthDecoratorAttribute();

  @override
  IntrinsicWidthDecoratorAttribute merge(
    IntrinsicWidthDecoratorAttribute? other,
  ) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicWidthDecoratorSpec resolve(MixData mix) {
    // Return an instance of InstrinsicWidthSpec
    return const IntrinsicWidthDecoratorSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicHeightWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, IntrinsicHeightDecoratorAttribute> {
  const IntrinsicHeightWidgetUtility(super.builder);
  T call() => builder(const IntrinsicHeightDecoratorAttribute());
}

class IntrinsicWidthWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, IntrinsicWidthDecoratorAttribute> {
  const IntrinsicWidthWidgetUtility(super.builder);
  T call() => builder(const IntrinsicWidthDecoratorAttribute());
}
