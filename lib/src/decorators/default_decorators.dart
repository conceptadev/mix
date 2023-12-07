// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../helpers/lerp_helpers.dart';
import 'decorator.dart';

class AspectRatioDecorator extends BoxDecorator<AspectRatioDecorator> {
  final double value;
  const AspectRatioDecorator(this.value, {super.key});

  @override
  AspectRatioDecorator lerp(AspectRatioDecorator? other, double t) {
    return AspectRatioDecorator(lerpDouble(value, other?.value, t) ?? value);
  }

  @override
  AspectRatioDecorator merge(AspectRatioDecorator? other) => other ?? this;

  @override
  get props => [value];

  @override
  Widget build(child, mix) =>
      AspectRatio(key: key, aspectRatio: value, child: child);
}

class VisibilityDecorator extends BoxDecorator<VisibilityDecorator> {
  final bool value;
  const VisibilityDecorator(this.value, {super.key});

  @override
  VisibilityDecorator merge(VisibilityDecorator? other) => other ?? this;

  @override
  VisibilityDecorator lerp(VisibilityDecorator? other, double t) {
    return VisibilityDecorator(other?.value ?? value);
  }

  @override
  get props => [value];

  @override
  Widget build(child, mix) =>
      Visibility(key: key, visible: value, child: child);
}

class FlexibleDecorator extends BoxDecorator<FlexibleDecorator> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleDecorator({this.flex, this.fit, super.key});

  @override
  FlexibleDecorator lerp(FlexibleDecorator? other, double t) {
    return FlexibleDecorator(
      flex: lerpInt(flex, other?.flex, t),
      fit: lerpSnap(fit, other?.fit, t),
    );
  }

  @override
  FlexibleDecorator merge(FlexibleDecorator? other) {
    return FlexibleDecorator(
      flex: other?.flex ?? flex,
      fit: other?.fit ?? fit,
    );
  }

  @override
  get props => [flex, fit];

  @override
  Widget build(child, mix) {
    return Flexible(
      key: key,
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

class OpacityDecorator extends BoxDecorator<OpacityDecorator> {
  final double value;
  const OpacityDecorator(this.value, {super.key});

  @override
  OpacityDecorator merge(OpacityDecorator? other) => other ?? this;

  @override
  OpacityDecorator lerp(OpacityDecorator? other, double t) {
    return OpacityDecorator(lerpDouble(value, other?.value, t) ?? value);
  }

  @override
  get props => [value];

  @override
  Widget build(child, mix) => Opacity(key: key, opacity: value, child: child);
}

class RotateDecorator extends BoxDecorator<RotateDecorator> {
  final int value;
  const RotateDecorator(this.value, {super.key});

  @override
  RotateDecorator merge(RotateDecorator? other) => other ?? this;

  @override
  RotateDecorator lerp(RotateDecorator? other, double t) {
    return RotateDecorator(lerpInt(value, other?.value, t));
  }

  @override
  get props => [value];

  @override
  Widget build(child, mix) =>
      RotatedBox(key: key, quarterTurns: value, child: child);
}

class ScaleDecorator extends BoxDecorator<ScaleDecorator> {
  final double value;
  const ScaleDecorator(this.value, {super.key});

  @override
  ScaleDecorator merge(ScaleDecorator? other) => other ?? this;

  @override
  ScaleDecorator lerp(ScaleDecorator? other, double t) {
    return ScaleDecorator(lerpDouble(value, other?.value, t) ?? value);
  }

  @override
  get props => [value];

  @override
  Widget build(child, mix) =>
      Transform.scale(key: key, scale: value, child: child);
}
