import 'package:flutter/material.dart';

import '../../variants/variant.dart';

/// A variant of [ContextVariant] based on a [Brightness] value.
///
/// This class determines whether the current [Brightness] within the given
/// [BuildContext] matches the specified [brightness].
class OnBrightnessVariant extends ContextVariant {
  /// The [Brightness] associated with this variant.
  final Brightness brightness;

  /// Creates a new [OnBrightnessVariant] with the given [brightness].
  ///
  /// The [key] is set to a [ValueKey] based on the [brightness].
  OnBrightnessVariant(this.brightness) : super(key: ValueKey(brightness));

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [brightness].
  @override
  List<Object?> get props => [key, brightness];

  /// Determines whether the current [Brightness] matches the specified [brightness].
  ///
  /// Returns `true` if the [Brightness] obtained from the [context] matches the
  /// [brightness] associated with this variant, and `false` otherwise.
  @override
  bool build(BuildContext context) {
    return Theme.of(context).brightness == brightness;
  }
}
