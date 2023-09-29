import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class FlexibleDecorator extends WidgetDecorator<FlexibleDecorator> {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleDecorator({this.flexFit, this.flex, super.key});

  @override
  get props => [flexFit, flex];
  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flexFit: other.flexFit ?? flexFit,
      flex: other.flex ?? flex,
    );
  }

  @override
  Widget build(MixData mix, Widget child) {
    return Flexible(
      key: key,
      flex: flex ?? 1,
      fit: flexFit ?? FlexFit.loose,
      child: child,
    );
  }
}
