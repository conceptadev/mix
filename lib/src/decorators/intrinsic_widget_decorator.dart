// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class IntrinsicHeightWidgetSpec
    extends DecoratorSpec<IntrinsicHeightWidgetSpec> {
  const IntrinsicHeightWidgetSpec();

  @override
  IntrinsicHeightWidgetSpec lerp(IntrinsicHeightWidgetSpec? other, double t) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicHeightWidgetSpec copyWith() {
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

class IntrinsicHeightWidgetDecorator extends WidgetDecorator<
    IntrinsicHeightWidgetDecorator, IntrinsicHeightWidgetSpec> {
  const IntrinsicHeightWidgetDecorator();

  @override
  IntrinsicHeightWidgetDecorator merge(IntrinsicHeightWidgetDecorator? other) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicHeightWidgetSpec resolve(MixData mix) {
    // Return an instance of IntrinsicHeightSpec
    return const IntrinsicHeightWidgetSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicWidthWidgetSpec extends DecoratorSpec<IntrinsicWidthWidgetSpec> {
  const IntrinsicWidthWidgetSpec();

  @override
  IntrinsicWidthWidgetSpec lerp(IntrinsicWidthWidgetSpec? other, double t) {
    // No properties to interpolate, return this instance
    return this;
  }

  @override
  IntrinsicWidthWidgetSpec copyWith() {
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

class IntrinsicWidthWidgetDecorator extends WidgetDecorator<
    IntrinsicWidthWidgetDecorator, IntrinsicWidthWidgetSpec> {
  const IntrinsicWidthWidgetDecorator();

  @override
  IntrinsicWidthWidgetDecorator merge(IntrinsicWidthWidgetDecorator? other) {
    // Since there are no properties to merge, return this instance
    return this;
  }

  @override
  IntrinsicWidthWidgetSpec resolve(MixData mix) {
    // Return an instance of InstrinsicWidthSpec
    return const IntrinsicWidthWidgetSpec();
  }

  @override
  List<Object?> get props => []; // No properties to include in props
}

class IntrinsicHeightWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, IntrinsicHeightWidgetDecorator> {
  const IntrinsicHeightWidgetUtility(super.builder);
  T call() => builder(const IntrinsicHeightWidgetDecorator());
}

class IntrinsicWidthWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, IntrinsicWidthWidgetDecorator> {
  const IntrinsicWidthWidgetUtility(super.builder);
  T call() => builder(const IntrinsicWidthWidgetDecorator());
}
