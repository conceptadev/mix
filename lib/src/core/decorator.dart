import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class Decorator extends Attribute {
  final Key? key;
  const Decorator({required this.key});
}

abstract class WidgetDecorator<Self extends WidgetDecorator<Self>>
    extends Decorator {
  const WidgetDecorator({super.key});

  /// Linearly interpolate with another [Decorator] object.
  WidgetDecorator lerp(covariant WidgetDecorator? other, double t);

  @override
  Object get type => Self;
  Widget build(Widget child, MixData mix);
}
