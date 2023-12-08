import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import 'widget_directives.dart';

class ScaleUtility<T extends StyleAttribute>
    extends MixUtility<T, ScaleDirective> {
  const ScaleUtility(super.builder);
  T call(double value, {Key? key}) => builder(ScaleDirective(value, key: key));
}

class OpacityUtility<T extends StyleAttribute>
    extends MixUtility<T, OpacityDirective> {
  const OpacityUtility(super.builder);
  T call(double value, {Key? key}) =>
      builder(OpacityDirective(value, key: key));
}

class RotateUtility<T extends StyleAttribute>
    extends MixUtility<T, RotateDirective> {
  const RotateUtility(super.builder);
  T get d90 => builder(const RotateDirective(1));
  T get d180 => builder(const RotateDirective(2));
  T get d270 => builder(const RotateDirective(3));

  T call(int value, {Key? key}) => builder(RotateDirective(value, key: key));
}

class VisibilityUtility<T extends StyleAttribute>
    extends MixUtility<T, VisibilityDirective> {
  const VisibilityUtility(super.builder);
  T get on => builder(const VisibilityDirective(true));
  T get off => builder(const VisibilityDirective(false));

  // ignore: prefer-named-boolean-parameters
  T call(bool value, {Key? key}) =>
      builder(VisibilityDirective(value, key: key));
}

class FlexibleDirectiveUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexibleDirective> {
  const FlexibleDirectiveUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight() => builder(const FlexibleDirective(fit: FlexFit.tight));
  T loose() => builder(const FlexibleDirective(fit: FlexFit.loose));
  T expanded() => tight();

  T call({int? flex, FlexFit? fit, Key? key}) {
    return builder(FlexibleDirective(flex: flex, fit: fit, key: key));
  }
}

class AspectRatioUtility<T extends StyleAttribute>
    extends MixUtility<T, AspectRatioDirective> {
  const AspectRatioUtility(super.builder);
  T call(double value, {Key? key}) =>
      builder(AspectRatioDirective(value, key: key));
}
