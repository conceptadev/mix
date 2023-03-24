import 'package:flutter/material.dart';

import '../../decorators/decorator_attribute.dart';

abstract class BoxDecoratorAttribute<T extends DecoratorAttribute<T>>
    extends DecoratorAttribute<T> {
  const BoxDecoratorAttribute({
    Key? key,
  }) : super(key: key);

  @override
  String get groupKey => 'boxWidgetDecorator';
}
