import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator<T> extends Attribute {
  final T value;
  const Decorator(this.value);

  @override
  get props => [value];
}

abstract class WrapDecorator<T> extends Decorator<T> {
  const WrapDecorator(super.value);

  Widget render(Widget child, MixData mix) {
    if (this is Resolver<T>) {
      return build(child, (this as Resolver<T>).resolve(mix));
    }

    return build(child, value);
  }

  Widget build(Widget child, T value);
}
