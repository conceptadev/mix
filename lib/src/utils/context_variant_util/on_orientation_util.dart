import 'package:flutter/material.dart';

import '../../variants/context_variant.dart';

/// A variant of [ContextVariant] based on an [Orientation] value.
///
/// This class determines whether the current [Orientation] within the given
/// [BuildContext] matches the specified [orientation].
class OnOrientationVariant extends MediaQueryContextVariant {
  /// The [Orientation] associated with this variant.
  final Orientation orientation;

  /// Creates a new [OnOrientationVariant] with the given [orientation].
  ///
  /// The [key] is set to a [ValueKey] based on the [orientation].
  const OnOrientationVariant(this.orientation);

  /// Determines whether the current [Orientation] matches the specified [orientation].
  ///
  /// Returns `true` if the [Orientation] obtained from the [context] matches the
  /// [orientation] associated with this variant, and `false` otherwise.
  @override
  bool when(BuildContext context) {
    return MediaQuery.of(context).orientation == orientation;
  }

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [orientation].
  @override
  List<Object?> get props => [orientation];

  @override
  Object get mergeKey => '$runtimeType.${orientation.name}';
}
