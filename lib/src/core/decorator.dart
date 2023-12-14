import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class Decorator extends StyleAttribute {
  const Decorator();
}

abstract class WidgetDecorator<Self extends WidgetDecorator<Self>>
    extends Decorator {
  final Key? key;
  const WidgetDecorator({this.key});

  /// Linearly interpolate with another [Decorator] object.
  WidgetDecorator lerp(covariant WidgetDecorator? other, double t);

  @override
  Object get type => Self;

  Widget build(MixData mix, Widget child);
}

abstract class BoxWidgetDecorator<Self extends BoxWidgetDecorator<Self>>
    extends WidgetDecorator<Self> {
  const BoxWidgetDecorator({super.key});
}

abstract class FlexWidgetDecorator<Self extends FlexWidgetDecorator<Self>>
    extends WidgetDecorator<Self> {
  const FlexWidgetDecorator({super.key});
}
