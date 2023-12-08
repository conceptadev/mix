import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class Decorator extends Attribute {
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
  Widget build(Widget child, MixData mix);
}
