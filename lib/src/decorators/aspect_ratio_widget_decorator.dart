// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

/// A decorator that wraps a widget with the [AspectRatio] widget.
///
/// The [AspectRatio] widget sizes its child to match a given aspect ratio.
class AspectRatioWidgetDecorator
    extends WidgetDecorator<AspectRatioWidgetDecorator, AspectRatioWidgetSpec> {
  /// The aspect ratio to use when sizing the child.
  ///
  /// For example, a 16:9 aspect ratio would have a value of 16.0 / 9.0.
  final double aspectRatio;
  const AspectRatioWidgetDecorator(this.aspectRatio);

  @override
  AspectRatioWidgetDecorator merge(AspectRatioWidgetDecorator? other) {
    return AspectRatioWidgetDecorator(other?.aspectRatio ?? aspectRatio);
  }

  @override
  AspectRatioWidgetSpec resolve(MixData mix) {
    return AspectRatioWidgetSpec(aspectRatio);
  }

  @override
  get props => [aspectRatio];
}

class AspectRatioWidgetSpec extends DecoratorSpec<AspectRatioWidgetSpec> {
  final double aspectRatio;
  const AspectRatioWidgetSpec(this.aspectRatio);

  @override
  AspectRatioWidgetSpec lerp(AspectRatioWidgetSpec? other, double t) {
    return AspectRatioWidgetSpec(
      lerpDouble(aspectRatio, other?.aspectRatio, t) ?? aspectRatio,
    );
  }

  @override
  AspectRatioWidgetSpec copyWith({double? aspectRatio}) {
    return AspectRatioWidgetSpec(aspectRatio ?? this.aspectRatio);
  }

  @override
  get props => [aspectRatio];

  @override
  Widget build(Widget child) {
    return AspectRatio(aspectRatio: aspectRatio, child: child);
  }
}

class AspectRatioUtility<T extends StyleAttribute>
    extends MixUtility<T, AspectRatioWidgetDecorator> {
  const AspectRatioUtility(super.builder);
  T call(double value) {
    return builder(AspectRatioWidgetDecorator(value));
  }
}
