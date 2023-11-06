import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_provider_data.dart';

abstract class Decorator<T> extends VisualAttribute<T> {
  const Decorator();

  Widget render(Widget child, MixData mix) {
    return build(child, resolve(mix));
  }

  @override
  Decorator merge(covariant Decorator? other);

  Widget build(Widget child, T value);
}

abstract class ParentDecorator<T> extends Decorator<T> {
  const ParentDecorator();

  @override
  ParentDecorator<T> merge(covariant ParentDecorator<T>? other);

  @override
  Widget build(Widget child, T value);
}
