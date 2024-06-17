import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../mix.dart';
import '../internal/compare_mixin.dart';

@immutable
abstract class Dto<Value> with EqualityMixin, MergeableMixin {
  const Dto();

  Value get defaultValue;

  // /// Merges this object with [other], returning a new object of type [T].
  // Dto merge(covariant Dto? other);

  static List<T>? mergeList<T extends Dto>(List<T>? list, List<T>? other) {
    if (other == null) return list;
    if (list == null) return other;

    if (list.isEmpty) return other;

    final listLength = list.length;
    final otherLength = other.length;
    final maxLength = math.max(listLength, otherLength);

    return List.generate(maxLength, (int index) {
      if (index < listLength && index < otherLength) {
        final currentValue = list[index];
        final otherValue = other[index];

        return currentValue.merge(otherValue) as T;
      } else if (index < listLength) {
        return list[index];
      }

      return other[index];
    });
  }

  Value resolve(MixData mix);
}
