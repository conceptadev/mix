// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/modifier.dart';
import '../factory/mix_provider_data.dart';

/// A modifier that wraps a widget with the [AspectRatio] widget.
///
/// The [AspectRatio] widget sizes its child to match a given aspect ratio.
class AspectRatioDecoratorAttribute extends DecoratorAttribute<
    AspectRatioDecoratorAttribute, AspectRatioDecoratorSpec> {
  /// The aspect ratio to use when sizing the child.
  ///
  /// For example, a 16:9 aspect ratio would have a value of 16.0 / 9.0.
  final double aspectRatio;
  const AspectRatioDecoratorAttribute(this.aspectRatio);

  @override
  AspectRatioDecoratorAttribute merge(AspectRatioDecoratorAttribute? other) {
    return AspectRatioDecoratorAttribute(other?.aspectRatio ?? aspectRatio);
  }

  @override
  AspectRatioDecoratorSpec resolve(MixData mix) {
    return AspectRatioDecoratorSpec(aspectRatio);
  }

  @override
  get props => [aspectRatio];
}

class AspectRatioDecoratorSpec extends DecoratorSpec<AspectRatioDecoratorSpec> {
  final double aspectRatio;
  const AspectRatioDecoratorSpec(this.aspectRatio);

  @override
  AspectRatioDecoratorSpec lerp(AspectRatioDecoratorSpec? other, double t) {
    return AspectRatioDecoratorSpec(
      lerpDouble(aspectRatio, other?.aspectRatio, t) ?? aspectRatio,
    );
  }

  @override
  AspectRatioDecoratorSpec copyWith({double? aspectRatio}) {
    return AspectRatioDecoratorSpec(aspectRatio ?? this.aspectRatio);
  }

  @override
  get props => [aspectRatio];

  @override
  Widget build(Widget child) {
    return AspectRatio(aspectRatio: aspectRatio, child: child);
  }
}

class AspectRatioUtility<T extends Attribute>
    extends MixUtility<T, AspectRatioDecoratorAttribute> {
  const AspectRatioUtility(super.builder);
  T call(double value) {
    return builder(AspectRatioDecoratorAttribute(value));
  }
}
