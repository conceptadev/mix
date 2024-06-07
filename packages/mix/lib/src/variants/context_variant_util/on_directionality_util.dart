import 'package:flutter/material.dart';

import '../context_variant.dart';

/// A variant of [ContextVariant] based on a [TextDirection] value.
///
/// This class determines whether the current [TextDirection] within the given
/// [BuildContext] matches the specified [direction].
class OnDirectionalityVariant extends MediaQueryContextVariant {
  /// The [TextDirection] associated with this variant.
  final TextDirection direction;

  /// Creates a new [OnDirectionalityVariant] with the given [direction].
  ///
  /// The [key] is set to a [ValueKey] based on the [direction].
  const OnDirectionalityVariant(this.direction);

  /// Determines whether the current [TextDirection] matches the specified [direction].
  ///
  /// Returns `true` if the [TextDirection] obtained from the [context] matches the
  /// [direction] associated with this variant, and `false` otherwise.
  @override
  bool when(BuildContext context) {
    return Directionality.of(context) == direction;
  }

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [direction].
  @override
  List<Object?> get props => [direction];

  @override
  Object get mergeKey => '$runtimeType.${direction.name}';
}
