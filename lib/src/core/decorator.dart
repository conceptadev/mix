import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class Decorator<Self extends Decorator<Self, Value>, Value>
    extends SpecAttribute<Self, Value> {
  const Decorator();

  @override
  bool get isInheritable => false;
}

abstract class WidgetDecorator<Self extends WidgetDecorator<Self, Value>,
    Value extends DecoratorSpec<Value>> extends Decorator<Self, Value> {
  const WidgetDecorator();

  @override
  Value resolve(MixData mix);
}

abstract class DecoratorSpec<Self extends DecoratorSpec<Self>>
    extends Spec<Self> {
  const DecoratorSpec();

  Widget build(Widget child);
}
