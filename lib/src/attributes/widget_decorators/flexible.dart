import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

/// Flex
/// @nodoc
FlexibleDecorator flex(int value) {
  return FlexibleDecorator(flex: value);
}

/// FlexFit
/// @nodoc
FlexibleDecorator flexFit(FlexFit flexFit) {
  return FlexibleDecorator(flexFit: flexFit);
}

/// Expanded
/// @nodoc
FlexibleDecorator expanded() {
  return const FlexibleDecorator(flexFit: FlexFit.tight);
}

/// Flexible
/// @nodoc
FlexibleDecorator flexible() {
  return const FlexibleDecorator(flexFit: FlexFit.loose);
}

/// Short Utils:
/// - flex(int value)
/// - flexFit(FlexFit flexFit)
/// - expanded()
/// - flexible()
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
