import 'package:flutter/material.dart';

import '../../../decorators/decorator_attribute.dart';
import '../../../mixer/mix_context_data.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [FlexibleDecoratorUtility](FlexibleDecoratorUtility-class.html)
///
/// {@category Decorators}
class FlexibleDecorator extends BoxParentDecoratorAttribute<FlexibleDecorator> {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleDecorator({
    this.flexFit,
    this.flex,
    Key? key,
  }) : super(key: key);

  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flexFit: other.flexFit ?? flexFit,
      flex: other.flex ?? flex,
    );
  }

  @override
  Widget builder(MixContextData mixContext, Widget child) {
    return Flexible(
      key: key,
      fit: flexFit ?? FlexFit.loose,
      flex: flex ?? 1,
      child: child,
    );
  }
}
