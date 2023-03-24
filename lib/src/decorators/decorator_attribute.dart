import 'package:flutter/material.dart';

import '../../mix.dart';

mixin MergeableAttributeMixin<T> on Attribute {
  T merge(covariant T? other);
}

abstract class DecoratorAttribute<T extends DecoratorAttribute<T>>
    extends Attribute with MergeableAttributeMixin<T> {
  const DecoratorAttribute({
    this.key,
  });

  /// Key is required in order for proper sorting
  final Key? key;

  /// Group Key, allows to group decorators for use in specific locations
  String get groupKey;

  Widget build(BuildContext context, Widget child);

  Widget render(BuildContext context, Widget child) {
    return build(context, child);
  }
}
