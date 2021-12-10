import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

/// Flex
FlexibleDecorator flex(int value) {
  return FlexibleDecorator(flex: value);
}

/// FlexFit
FlexibleDecorator flexFit(FlexFit flexFit) {
  return FlexibleDecorator(flexFit: flexFit);
}

/// Expanded
FlexibleDecorator expanded() {
  return const FlexibleDecorator(flexFit: FlexFit.tight);
}

/// Flexible
FlexibleDecorator flexible() {
  return const FlexibleDecorator(flexFit: FlexFit.loose);
}

class FlexibleDecorator extends ParentWidgetDecorator<FlexibleDecorator> {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleDecorator({
    this.flexFit,
    this.flex,
  });

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
