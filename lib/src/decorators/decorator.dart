import 'package:flutter/material.dart';

import '../attributes/exports.dart';
import '../factory/exports.dart';

abstract class Decorator<T extends Decorator<T>> extends StyleAttribute
    with Mergeable<Decorator<T>> {
  /// Key is required in order for proper sorting.
  final Key? key;

  const Decorator({this.key});

  Widget render(Widget child, MixData mix) {
    return build(child, mix);
  }

  @override
  Decorator<T> merge(covariant Decorator<T> other);

  Widget build(Widget child, MixData mix);
}

abstract class WidgetDecorator<T extends WidgetDecorator<T>>
    extends StyleAttribute with Mergeable<WidgetDecorator<T>> {
  /// Key is required in order for proper sorting.
  final Key? key;

  const WidgetDecorator({this.key});

  Widget render(Widget child, MixData mix) {
    return build(child, mix);
  }

  @override
  WidgetDecorator<T> merge(covariant WidgetDecorator<T> other);

  Widget build(Widget child, MixData mix);
}
