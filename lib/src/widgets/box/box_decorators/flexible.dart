import 'package:flutter/material.dart';

import '../box.decorator.dart';

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
  Widget build(BuildContext context, Widget child) {
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
