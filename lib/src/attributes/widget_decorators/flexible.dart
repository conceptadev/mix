import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mixer.dart';

/// Flex
FlexibleWidgetAttribute flex(int value) {
  return FlexibleWidgetAttribute(flex: value);
}

/// FlexFit
FlexibleWidgetAttribute flexFit(FlexFit flexFit) {
  return FlexibleWidgetAttribute(flexFit: flexFit);
}

/// Expanded
FlexibleWidgetAttribute expanded() {
  return const FlexibleWidgetAttribute(flexFit: FlexFit.tight);
}

/// Flexible
FlexibleWidgetAttribute flexible() {
  return const FlexibleWidgetAttribute(flexFit: FlexFit.loose);
}

class FlexibleWidgetAttribute extends WidgetAttribute<FlexibleWidgetAttribute> {
  final FlexFit? flexFit;
  final int? flex;
  const FlexibleWidgetAttribute({
    this.flexFit,
    this.flex,
  });

  @override
  FlexibleWidgetAttribute merge(FlexibleWidgetAttribute other) {
    return FlexibleWidgetAttribute(
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
