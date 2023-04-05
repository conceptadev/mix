import 'package:flutter/material.dart';

import '../../mix.dart';

abstract class Decorator<T extends Decorator<T>> extends Attribute
    with Mergeable<Decorator<T>> {
  const Decorator({
    this.key,
  });

  /// Key is required in order for proper sorting
  final Key? key;

  Widget build(MixData mix, Widget child);

  @override
  Decorator<T> merge(covariant Decorator<T> other);

  Widget render(MixData mix, Widget child) {
    return build(mix, child);
  }
}
