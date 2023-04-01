import 'package:flutter/material.dart';

import '../../decorators/decorator.dart';

abstract class WidgetDecorator<T extends WidgetDecorator<T>>
    extends Decorator<T> {
  const WidgetDecorator({
    Key? key,
  }) : super(key: key);

  @override
  T merge(T other);
}
