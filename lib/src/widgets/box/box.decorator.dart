import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../factory/mix_provider_data.dart';

abstract class WidgetDecorator<T extends WidgetDecorator<T>>
    extends StyleAttribute with Mergeable<WidgetDecorator<T>> {
  const WidgetDecorator({
    this.key,
  });

  /// Key is required in order for proper sorting
  final Key? key;

  Widget build(MixData mix, Widget child);

  @override
  WidgetDecorator<T> merge(covariant WidgetDecorator<T> other);

  Widget render(MixData mix, Widget child) {
    return build(mix, child);
  }
}
