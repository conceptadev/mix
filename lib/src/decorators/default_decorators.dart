import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'decorator.dart';

class AspectRatioDecorator extends ParentDecorator<double> {
  final double aspectRatio;
  const AspectRatioDecorator(this.aspectRatio);

  @override
  AspectRatioDecorator merge(AspectRatioDecorator other) {
    return AspectRatioDecorator(other.aspectRatio);
  }

  @override
  double resolve(MixData mix) => aspectRatio;

  @override
  get props => [aspectRatio];

  @override
  Widget build(Widget child, double data) =>
      AspectRatio(aspectRatio: data, child: child);
}

class FlexibleDecorator extends ParentDecorator<FlexibleDecoratorSpec> {
  final int? flex;
  final FlexFit? flexFit;
  const FlexibleDecorator({this.flex, this.flexFit});

  const FlexibleDecorator.tight([this.flex]) : flexFit = FlexFit.tight;
  const FlexibleDecorator.loose([this.flex]) : flexFit = FlexFit.loose;

  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flex: other.flex ?? flex,
      flexFit: other.flexFit ?? flexFit,
    );
  }

  @override
  FlexibleDecoratorSpec resolve(MixData mix) {
    return FlexibleDecoratorSpec(flex: flex, flexFit: flexFit);
  }

  @override
  get props => [flexFit, flex];

  @override
  Widget build(child, data) {
    return Flexible(
      flex: data.flex ?? 1,
      fit: data.flexFit ?? FlexFit.loose,
      child: child,
    );
  }
}

class FlexibleDecoratorSpec {
  final int? flex;
  final FlexFit? flexFit;
  const FlexibleDecoratorSpec({required this.flex, required this.flexFit});
}

class OpacityDecorator extends ParentDecorator<double> {
  final double value;
  const OpacityDecorator(this.value);

  @override
  OpacityDecorator merge(OpacityDecorator? other) {
    return OpacityDecorator(other?.value ?? value);
  }

  @override
  double resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, data) => Opacity(opacity: data, child: child);
}

class RotateDecorator extends ParentDecorator<int> {
  final int value;
  const RotateDecorator(this.value);

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(other.value);
  }

  @override
  int resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, data) => RotatedBox(quarterTurns: data, child: child);
}

class ScaleDecorator extends ParentDecorator<double> {
  final double scale;
  const ScaleDecorator(this.scale);

  @override
  ScaleDecorator merge(ScaleDecorator? other) {
    return ScaleDecorator(other?.scale ?? scale);
  }

  @override
  double resolve(MixData mix) => scale;

  @override
  get props => [scale];

  @override
  Widget build(child, data) => Transform.scale(scale: data, child: child);
}
