import 'package:flutter/material.dart';

import '../../variants/context_variant.dart';
import '../../variants/variant.dart';

/// A variant of [ContextVariant] that negates the result of another [ContextVariant].
///
/// This class determines whether the specified [variant] evaluates to `false`
/// within the given [BuildContext].
class OnNotVariant extends ContextVariant {
  /// The [ContextVariant] to negate.
  final ContextVariant variant;

  /// Creates a new [OnNotVariant] with the given [variant].
  ///
  /// The [key] is set to a [ValueKey] based on the [variant].
  const OnNotVariant(this.variant);

  /// Determines whether the specified [variant] evaluates to `false`.
  ///
  /// Returns `true` if the [variant] evaluates to `false` within the given
  /// [context], and `false` otherwise.
  @override
  bool when(BuildContext context) => !variant.when(context);

  /// Priority of this variant.
  ///
  /// The priority of a [OnNotVariant] is determined by the priority of the
  /// [variant] it negates.
  @override
  VariantPriority get priority => variant.priority;

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [variant].
  @override
  List<Object?> get props => [variant];

  @override
  Object get mergeKey => '$runtimeType.${variant.mergeKey}';
}
