import 'package:flutter/material.dart';

import '../../variants/variant.dart';

/// Creates an [OnNotVariant] with the specified [variant].
///
/// This reverses the result of the specified [variant].
///
/// For example, if the specified [variant] evaluates to `true`,
/// the [OnNotVariant] with that variant will evaluate to `false`, and vice versa.
const onNot = OnNotVariant.new;

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
  OnNotVariant(this.variant) : super(key: ValueKey(variant));

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [variant].
  @override
  List<Object?> get props => [key, variant];

  /// Determines whether the specified [variant] evaluates to `false`.
  ///
  /// Returns `true` if the [variant] evaluates to `false` within the given
  /// [context], and `false` otherwise.
  @override
  bool build(BuildContext context) => !variant.build(context);
}
