import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

abstract class Decorator<T> extends VisualAttribute<T> {
  const Decorator();

  @override
  Decorator merge(covariant Decorator? other);

  Widget render(Widget child, MixData mix) {
    return build(child, resolve(mix));
  }

  Widget build(Widget child, T value);
}

abstract class ParentDecorator<T> extends Decorator<T> {
  const ParentDecorator();

  @override
  ParentDecorator<T> merge(covariant ParentDecorator<T>? other);

  @override
  Widget build(Widget child, T value);
}
