import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

const flexible = _flexible;
const expanded = _expanded;

FlexibleDecorator _expanded({int? flex}) {
  return FlexibleDecorator(flex: flex, flexFit: FlexFit.tight);
}

FlexibleDecorator _flexible({int? flex}) {
  return FlexibleDecorator(flex: flex, flexFit: FlexFit.loose);
}

class FlexibleDecorator extends ParentDecorator<FlexibleDecoratorSpec> {
  final int? _flex;
  final FlexFit? _flexFit;
  const FlexibleDecorator({int? flex, FlexFit? flexFit})
      : _flex = flex,
        _flexFit = flexFit;

  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flex: other._flex ?? _flex,
      flexFit: other._flexFit ?? _flexFit,
    );
  }

  @override
  FlexibleDecoratorSpec resolve(MixData mix) {
    return FlexibleDecoratorSpec(flex: _flex, flexFit: _flexFit);
  }

  @override
  get props => [_flexFit, _flex];

  @override
  Widget build(child, value) {
    return Flexible(flex: value.flex, fit: value.flexFit, child: child);
  }
}

class FlexibleDecoratorSpec {
  final int flex;
  final FlexFit flexFit;
  const FlexibleDecoratorSpec({int? flex, FlexFit? flexFit})
      : flex = flex ?? 1,
        flexFit = flexFit ?? FlexFit.loose;
}
