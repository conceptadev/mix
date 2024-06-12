import 'package:flutter/material.dart';

import '../internal/compare_mixin.dart';
import 'dto.dart';

@immutable
abstract base class Attribute with MergeableMixin, EqualityMixin {
  const Attribute();

  // Used as the key to determine how
  // attributes get merged
  Object get mergeKey => runtimeType;

  @override
  Attribute merge(covariant Attribute? other);
}

/// Provides the ability to merge this object with another of the same type.
///
/// Defines a single method, [merge], which takes another object of type [T]
/// and returns a new object representing the merged result.
///
/// Typically used by classes like [Dto] or [Attribute] that need to merge
/// instances of the same type.
mixin MergeableMixin<T> {
  /// Merges this object with [other], returning a new object of type [T].
  T merge(covariant T? other);
}

@immutable
abstract base class StyledAttribute extends Attribute {
  const StyledAttribute();

  @override
  StyledAttribute merge(covariant StyledAttribute? other);

  @override
  Object get mergeKey => runtimeType;
}
