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
class OpacityWidgetSpec extends DecoratorSpec<OpacityWidgetSpec> {
  /// The [opacity] argument must not be null and
  /// must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityWidgetSpec(this.opacity);

  @override
  OpacityWidgetSpec lerp(OpacityWidgetSpec? other, double t) {
    return OpacityWidgetSpec(lerpDouble(opacity, other?.opacity, t) ?? opacity);
  }

  @override
  OpacityWidgetSpec copyWith({double? opacity}) {
    return OpacityWidgetSpec(opacity ?? this.opacity);
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

class OpacityWidgetDecorator
    extends WidgetDecorator<OpacityWidgetDecorator, OpacityWidgetSpec> {
  final double opacity;
  const OpacityWidgetDecorator(this.opacity);

  @override
  OpacityWidgetDecorator merge(OpacityWidgetDecorator? other) {
    return OpacityWidgetDecorator(other?.opacity ?? opacity);
  }

  @override
  OpacityWidgetSpec resolve(MixData mix) {
    return OpacityWidgetSpec(opacity);
  }

  @override
  get props => [opacity];
}

class OpacityUtility<T extends StyleAttribute>
    extends MixUtility<T, OpacityWidgetDecorator> {
  const OpacityUtility(super.builder);
  T call(double value) => builder(OpacityWidgetDecorator(value));
}
