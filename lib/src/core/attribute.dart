import 'package:flutter/material.dart';

import '../attributes/animated/animated_data.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';
import 'dto.dart';

@immutable
abstract class Attribute with Comparable, Mergeable {
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
mixin Mergeable<T> {
  /// Merges this object with [other], returning a new object of type [T].
  T merge(covariant T? other);
}

@immutable
abstract class StyledAttribute extends Attribute {
  const StyledAttribute();

  @override
  StyledAttribute merge(covariant StyledAttribute? other);

  @override
  Object get mergeKey => runtimeType;
}

/// An abstract class representing a resolvable attribute.
///
/// This class extends the [StyledAttribute] class and provides a generic type [Self] and [Value].
/// The [Self] type represents the concrete implementation of the attribute, while the [Value] type represents the resolvable value.
abstract class SpecAttribute<Value> extends StyledAttribute {
  final AnimatedDataDto? animated;

  const SpecAttribute({this.animated});

  Value resolve(MixData mix);

  @override
  SpecAttribute<Value> merge(covariant SpecAttribute<Value>? other);
}

@immutable
abstract class Spec<T extends Spec<T>> {
  final AnimatedData? animated;

  const Spec({this.animated});

  Type get type => T;

  bool get isAnimated => animated != null;

  /// Creates a copy of this spec with the given fields
  /// replaced by the non-null parameter values.
  T copyWith();

  /// Linearly interpolate with another [Spec] object.
  T lerp(covariant T? other, double t);

  // equality
  @override
  bool operator ==(Object other);

  @override
  int get hashCode;
}
