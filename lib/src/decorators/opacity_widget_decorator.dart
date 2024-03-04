// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

/// A decorator that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
class OpacityDecoratorSpec extends DecoratorSpec<OpacityDecoratorSpec> {
  /// The [opacity] argument must not be null and
  /// must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityDecoratorSpec(this.opacity);

  @override
  OpacityDecoratorSpec lerp(OpacityDecoratorSpec? other, double t) {
    return OpacityDecoratorSpec(
        lerpDouble(opacity, other?.opacity, t) ?? opacity);
  }

  @override
  OpacityDecoratorSpec copyWith({double? opacity}) {
    return OpacityDecoratorSpec(opacity ?? this.opacity);
  }

  @override
  get props => [opacity];

  @override
  Widget build(Widget child) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'The opacity must be between 0.0 and 1.0 (inclusive).',
    );

    return Opacity(opacity: opacity, child: child);
  }
}

class OpacityDecoratorAttribute extends DecoratorAttribute<
    OpacityDecoratorAttribute, OpacityDecoratorSpec> {
  final double opacity;
  const OpacityDecoratorAttribute(this.opacity);

  @override
  OpacityDecoratorAttribute merge(OpacityDecoratorAttribute? other) {
    return OpacityDecoratorAttribute(other?.opacity ?? opacity);
  }

  @override
  OpacityDecoratorSpec resolve(MixData mix) {
    return OpacityDecoratorSpec(opacity);
  }

  @override
  get props => [opacity];
}

class OpacityUtility<T extends StyleAttribute>
    extends MixUtility<T, OpacityDecoratorAttribute> {
  const OpacityUtility(super.builder);
  T call(double value) => builder(OpacityDecoratorAttribute(value));
}
