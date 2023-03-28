import 'package:flutter/material.dart';

import '../../mix.dart';

abstract class Decorator<T extends Decorator<T>> with MergeableMixin<T> {
  const Decorator({
    this.key,
  });

  /// Key is required in order for proper sorting
  final Key? key;

  /// Group Key, allows to group decorators for use in specific locations
  String get groupKey;

  Widget build(BuildContext context, Widget child);

  @override
  T merge(covariant T other);

  Widget render(BuildContext context, Widget child) {
    return build(context, child);
  }
}
