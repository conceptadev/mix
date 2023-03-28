import 'package:flutter/material.dart';

import '../box.decorator.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [FlexibleDecoratorUtility](FlexibleDecoratorUtility-class.html)
///
/// {@category Decorators}
class FlexibleDecorator extends BoxDecorator<FlexibleDecorator> {
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
  Widget build(BuildContext context, Widget child) {
    return Flexible(
      key: key,
      fit: flexFit ?? FlexFit.loose,
      flex: flex ?? 1,
      child: child,
    );
  }
}
