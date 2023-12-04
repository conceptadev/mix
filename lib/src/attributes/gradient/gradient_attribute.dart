import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'gradient_dto.dart';

/// A class representing a gradient attribute.
///
/// This attribute holds a [GradientDto] object, which represents a gradient in Flutter.
/// It extends the [ResolvableAttribute] class and implements the [merge] and [resolve] methods.
@immutable
class GradientAttribute
    extends ResolvableAttribute<GradientAttribute, Gradient> {
  final GradientDto value;

  /// Creates a new [GradientAttribute] with the given [value].
  const GradientAttribute(this.value);

  /// Checks if this [GradientAttribute] can be merged with another [GradientAttribute].
  ///
  /// Two attributes can be merged if they have the same runtime type.
  bool _canMerge(GradientAttribute other) {
    return value.runtimeType == other.value.runtimeType;
  }

  /// Merges this [GradientAttribute] with another [GradientAttribute].
  ///
  /// If the [other] attribute is null, this method returns this attribute.
  /// Otherwise, it checks if the two attributes can be merged.
  /// If they can be merged, it creates a new [GradientAttribute] with the merged value.
  /// Otherwise, it returns this attribute.
  @override
  GradientAttribute merge(GradientAttribute? other) {
    if (other == null) return this;

    return _canMerge(other)
        ? GradientAttribute(value.merge(other.value))
        : this;
  }

  @override

  /// Resolves this [GradientAttribute] using the given [mix] data.
  ///
  /// It resolves the [value] of this attribute using the [mix] data and returns the resulting [Gradient].
  Gradient resolve(MixData mix) => value.resolve(mix);

  @override

  /// Returns the list of properties that define this [GradientAttribute].
  List<Object> get props => [value];
}
