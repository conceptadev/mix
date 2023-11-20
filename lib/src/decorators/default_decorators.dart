import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_provider_data.dart';
import 'decorator.dart';

class AspectRatioDecorator extends WrapDecorator<double> {
  const AspectRatioDecorator(super.aspectRatio);

  @override
  Widget build(Widget child, double value) =>
      AspectRatio(aspectRatio: value, child: child);
}

class FlexibleDecorator extends WrapDecorator<FlexibleDto>
    with Mergeable<FlexibleDecorator> {
  const FlexibleDecorator(super.value);

  @override
  FlexibleDecorator merge(FlexibleDecorator? other) {
    return FlexibleDecorator(value.merge(other?.value));
  }

  @override
  Widget build(child, value) {
    return Flexible(
      flex: value.flex ?? 1,
      fit: value.flexFit ?? FlexFit.loose,
      child: child,
    );
  }
}

class FlexibleDto extends Dto<Flexible> {
  final int? flex;
  final FlexFit? flexFit;
  const FlexibleDto({required this.flex, required this.flexFit});

  @override
  FlexibleDto merge(FlexibleDto? other) {
    return FlexibleDto(
      flex: other?.flex ?? flex,
      flexFit: other?.flexFit ?? flexFit,
    );
  }

  @override
  Flexible resolve(MixData mix) {
    return Flexible(
      flex: flex ?? 1,
      fit: flexFit ?? FlexFit.loose,
      child: const SizedBox(),
    );
  }

  @override
  get props => [flex, flexFit];
}

class OpacityDecorator extends WrapDecorator<double> {
  const OpacityDecorator(super.value);

  @override
  get props => [value];

  @override
  Widget build(child, value) => Opacity(opacity: value, child: child);
}

class RotateDecorator extends WrapDecorator<int> {
  const RotateDecorator(super.value);

  @override
  Widget build(child, value) => RotatedBox(quarterTurns: value, child: child);
}

class ScaleDecorator extends WrapDecorator<double> {
  const ScaleDecorator(super.value);

  @override
  Widget build(child, value) => Transform.scale(scale: value, child: child);
}
