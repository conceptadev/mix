import 'package:flutter/material.dart';

import '../attributes/exports.dart';
import '../factory/exports.dart';

abstract class Decorator<T extends Decorator<T>> extends Attribute {
  const Decorator({super.key});

  Widget render(Widget child, MixData mix) {
    return build(child, mix);
  }

  @override
  Decorator<T> merge(covariant Decorator<T> other);

  Widget build(Widget child, MixData mix);
}

abstract class WidgetDecorator<T extends WidgetDecorator<T>> extends Attribute {
  /// Key is required in order for proper sorting.

  const WidgetDecorator({super.key});

  Widget render(Widget child, MixData mix) {
    return build(child, mix);
  }

  @override
  WidgetDecorator<T> merge(covariant WidgetDecorator<T> other);

  Widget build(Widget child, MixData mix);
}
