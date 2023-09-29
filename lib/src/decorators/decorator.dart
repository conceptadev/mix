import 'package:flutter/material.dart';

import '../../mix.dart';

abstract class Decorator<T extends Decorator<T>> extends StyleAttribute
    with Mergeable<Decorator<T>> {
  /// Key is required in order for proper sorting.
  final Key? key;

  const Decorator({this.key});

  Widget build(MixData mix, Widget child);

  @override
  Decorator<T> merge(covariant Decorator<T> other);

  Widget render(MixData mix, Widget child) {
    return build(mix, child);
  }
}

abstract class WidgetDecorator<T extends WidgetDecorator<T>>
    extends StyleAttribute with Mergeable<WidgetDecorator<T>> {
  /// Key is required in order for proper sorting.
  final Key? key;

  const WidgetDecorator({this.key});

  Widget build(MixData mix, Widget child);

  @override
  WidgetDecorator<T> merge(covariant WidgetDecorator<T> other);

  Widget render(MixData mix, Widget child) {
    return build(mix, child);
  }
}
