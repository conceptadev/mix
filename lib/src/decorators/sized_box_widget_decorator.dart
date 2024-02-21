// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class SizedBoxWidgetSpec extends DecoratorSpec<SizedBoxWidgetSpec> {
  final double? width;
  final double? height;

  const SizedBoxWidgetSpec({this.width, this.height});

  @override
  SizedBoxWidgetSpec lerp(SizedBoxWidgetSpec? other, double t) {
    return SizedBoxWidgetSpec(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
    );
  }

  @override
  SizedBoxWidgetSpec copyWith({double? width, double? height}) {
    return SizedBoxWidgetSpec(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  get props => [width, height];

  @override
  Widget build(Widget child) {
    return SizedBox(width: width, height: height, child: child);
  }
}

class SizedBoxWidgetDecorator
    extends WidgetDecorator<SizedBoxWidgetDecorator, SizedBoxWidgetSpec> {
  final double? width;
  final double? height;

  const SizedBoxWidgetDecorator({this.width, this.height});

  @override
  SizedBoxWidgetSpec resolve(MixData mix) {
    return SizedBoxWidgetSpec(width: width, height: height);
  }

  @override
  SizedBoxWidgetDecorator merge(SizedBoxWidgetDecorator? other) {
    return SizedBoxWidgetDecorator(
      width: other?.width ?? width,
      height: other?.height ?? height,
    );
  }

  @override
  get props => [width, height];
}

class SizedBoxDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, SizedBoxWidgetDecorator> {
  const SizedBoxDecoratorUtility(super.builder);

  T call({double? width, double? height}) {
    return builder(SizedBoxWidgetDecorator(width: width, height: height));
  }
}
