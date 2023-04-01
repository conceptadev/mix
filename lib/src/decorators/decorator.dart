import 'package:flutter/material.dart';

import '../../mix.dart';
import '../helpers/equatable_mixin.dart';

abstract class Decorator<T extends Decorator<T>> extends Attribute
    with MergeableMixin<T>, EquatableMixin {
  const Decorator({
    this.key,
  });

  /// Key is required in order for proper sorting
  final Key? key;

  Widget build(BuildContext context, Widget child);

  @override
  T merge(covariant T other);

  Widget render(BuildContext context, Widget child) {
    return build(context, child);
  }
}
