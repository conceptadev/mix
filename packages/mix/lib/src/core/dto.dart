import 'package:flutter/material.dart';

import '../internal/compare_mixin.dart';
import 'attribute.dart';
import 'factory/mix_data.dart';

@immutable
abstract class Dto<Value> with EqualityMixin, MergeableMixin {
  const Dto();

  Value get defaultValue;

  Value resolve(MixData mix);
  // /// Merges this object with [other], returning a new object of type [T].
  @override
  Dto merge(covariant Dto? other);
}
