import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import 'widget_decorators.dart';

final scale = ScaleUtility((d) => d);
final opacity = OpacityUtility((d) => d);
final rotate = RotateUtility((d) => d);
final clip = ClipDecoratorUtility((d) => d);
final visibility = VisibilityUtility((d) => d);
final aspectRatio = AspectRatioUtility((d) => d);
final flexible = FlexibleDecoratorUtility((d) => d);

class ScaleUtility<T extends StyleAttribute>
    extends MixUtility<T, ScaleDecorator> {
  const ScaleUtility(super.builder);
  T call(double value, {Key? key}) => builder(ScaleDecorator(value, key: key));
}

class OpacityUtility<T extends StyleAttribute>
    extends MixUtility<T, OpacityDecorator> {
  const OpacityUtility(super.builder);
  T call(double value, {Key? key}) =>
      builder(OpacityDecorator(value, key: key));
}

class RotateUtility<T extends StyleAttribute>
    extends MixUtility<T, RotateDecorator> {
  const RotateUtility(super.builder);
  T d90() => builder(const RotateDecorator(1));
  T d180() => builder(const RotateDecorator(2));
  T d270() => builder(const RotateDecorator(3));

  T call(int value, {Key? key}) => builder(RotateDecorator(value, key: key));
}

class VisibilityUtility<T extends StyleAttribute>
    extends MixUtility<T, VisibilityDecorator> {
  const VisibilityUtility(super.builder);
  T on() => builder(const VisibilityDecorator(true));
  T off() => builder(const VisibilityDecorator(false));

  // ignore: prefer-named-boolean-parameters
  T call(bool value, {Key? key}) =>
      builder(VisibilityDecorator(value, key: key));
}

class FlexibleDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexibleDecorator> {
  const FlexibleDecoratorUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight() => builder(const FlexibleDecorator(fit: FlexFit.tight));
  T loose() => builder(const FlexibleDecorator(fit: FlexFit.loose));
  T expanded() => tight();

  T call({int? flex, FlexFit? fit, Key? key}) {
    return builder(FlexibleDecorator(flex: flex, fit: fit, key: key));
  }
}

class AspectRatioUtility<T extends StyleAttribute>
    extends MixUtility<T, AspectRatioDecorator> {
  const AspectRatioUtility(super.builder);
  T call(double value, {Key? key}) =>
      builder(AspectRatioDecorator(value, key: key));
}
