import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class Decorator<Self extends Decorator<Self>> extends StyleAttribute {
  final Key? key;
  const Decorator({this.key});

  /// Linearly interpolate with another [Decorator] object.
  Decorator lerp(covariant Decorator? other, double t);

  @override
  Object get type => Self;

  @override
  bool get isInheritable => false;

  Widget build(MixData mix, Widget child);
}

abstract class WidgetDecorator<Self extends WidgetDecorator<Self>>
    extends Decorator<Self> {
  const WidgetDecorator({super.key});
}

abstract class FlexWidgetDecorator<Self extends FlexWidgetDecorator<Self>>
    extends Decorator<Self> {
  const FlexWidgetDecorator({super.key});
}
