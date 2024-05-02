import 'package:flutter/material.dart';

import '../../variants/variant.dart';

/// A [ContextVariant] that evaluates to `true`
/// when the current [Orientation] is [Orientation.portrait].
final onPortrait = OnOrientationVariant(Orientation.portrait);

/// A [ContextVariant] that evaluates to `true`
/// when the current [Orientation] is [Orientation.landscape].
final onLandscape = OnOrientationVariant(Orientation.landscape);

/// Creates an [OnOrientationVariant] with the specified [orientation].
const onOrientation = OnOrientationVariant.new;

/// A variant of [ContextVariant] based on an [Orientation] value.
///
/// This class determines whether the current [Orientation] within the given
/// [BuildContext] matches the specified [orientation].
class OnOrientationVariant extends ContextVariant {
  /// The [Orientation] associated with this variant.
  final Orientation orientation;

  /// Creates a new [OnOrientationVariant] with the given [orientation].
  ///
  /// The [key] is set to a [ValueKey] based on the [orientation].
  OnOrientationVariant(this.orientation) : super(key: ValueKey(orientation));

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [orientation].
  @override
  List<Object?> get props => [key, orientation];

  /// Determines whether the current [Orientation] matches the specified [orientation].
  ///
  /// Returns `true` if the [Orientation] obtained from the [context] matches the
  /// [orientation] associated with this variant, and `false` otherwise.
  @override
  bool build(BuildContext context) {
    return MediaQuery.of(context).orientation == orientation;
  }
}
