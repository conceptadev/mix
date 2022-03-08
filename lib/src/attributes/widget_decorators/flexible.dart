import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';
/// ## Widget
/// - (All)
/// ## Utilities
/// - [FlexibleDecoratorUtility](FlexibleDecoratorUtility-class.html)
///
/// {@category Decorators}
class FlexibleDecorator extends ParentDecorator<FlexibleDecorator> {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleDecorator({
    this.flexFit,
    this.flex,
  }) : super(const Key('FlexibleDecorator'));

  @override
  FlexibleDecorator merge(FlexibleDecorator other) {
    return FlexibleDecorator(
      flexFit: other.flexFit ?? flexFit,
      flex: other.flex ?? flex,
    );
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    return Flexible(
      fit: flexFit ?? FlexFit.loose,
      flex: flex ?? 1,
      child: child,
    );
  }
}
