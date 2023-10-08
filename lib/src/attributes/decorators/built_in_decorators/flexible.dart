import 'package:flutter/material.dart';

import '../../../factory/mix_provider_data.dart';
import '../decorator.dart';

const flexible = _flexible;

@Deprecated('Use flexible or expanded')
const flex = _flexible;

@Deprecated('Use flexible instead')
const expanded = _expanded;

FlexibleDecorator _expanded({int? flex}) {
  return FlexibleDecorator(flex: flex, flexFit: FlexFit.tight);
}

FlexibleDecorator _flexible({int? flex}) {
  return FlexibleDecorator(flex: flex, flexFit: FlexFit.loose);
}

class FlexibleDecorator extends Decorator {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleDecorator({this.flex, this.flexFit});

  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flex: other.flex ?? flex,
      flexFit: other.flexFit ?? flexFit,
    );
  }

  @override
  get props => [flexFit, flex];
  @override
  Widget build(Widget child, MixData mix) {
    return Flexible(
      key: mergeKey,
      flex: flex ?? 1,
      fit: flexFit ?? FlexFit.loose,
      child: child,
    );
  }
}
