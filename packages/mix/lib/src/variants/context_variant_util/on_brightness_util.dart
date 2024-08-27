import 'package:flutter/material.dart';

import '../context_variant.dart';

/// A variant of [ContextVariant] based on a [Brightness] value.
///
/// This class determines whether the current [Brightness] within the given
/// [BuildContext] matches the specified [brightness].
class OnBrightnessVariant extends MediaQueryContextVariant {
  /// The [Brightness] associated with this variant.
  final Brightness brightness;

  /// Creates a new [OnBrightnessVariant] with the given [brightness].
  ///
  /// The [key] is set to a [ValueKey] based on the [brightness].
  const OnBrightnessVariant(this.brightness);

  /// Determines whether the current [Brightness] matches the specified [brightness].
  ///
  /// Returns `true` if the [Brightness] obtained from the [context] matches the
  /// [brightness] associated with this variant, and `false` otherwise.
  @override
  bool when(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == brightness;
  }

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [brightness].
  @override
  List<Object?> get props => [brightness];

  @override
  Object get mergeKey => '$runtimeType.${brightness.name}';
}
