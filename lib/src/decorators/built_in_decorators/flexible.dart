import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

class FlexibleDecorator extends WidgetDecorator<FlexibleDecorator> {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleDecorator({
    this.flexFit,
    this.flex,
    super.key,
  });

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
      fit: flexFit ?? FlexFit.loose,
      flex: flex ?? 1,
      child: child,
    );
  }

  @override
  get props => [flexFit, flex];
}
