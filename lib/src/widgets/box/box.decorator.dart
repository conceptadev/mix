import 'package:flutter/material.dart';

import '../../decorators/decorator.dart';

abstract class BoxDecorator<T extends BoxDecorator<T>> extends Decorator<T> {
  const BoxDecorator({
    Key? key,
  }) : super(key: key);

  @override
  T merge(T other);

  @override
  String get groupKey => 'boxWidgetDecorator';
}
