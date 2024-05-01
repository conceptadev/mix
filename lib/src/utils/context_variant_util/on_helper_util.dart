import 'package:flutter/material.dart';

import '../../variants/variant.dart';

const onNot = OnNotVariant.new;

/// Creates a [ContextVariant] that negates the condition of another [ContextVariant].
///
/// This function returns a new [ContextVariant] that applies when the specified
/// [variant]'s condition does not hold true. It is useful for defining styles or
/// behaviors that should apply in the opposite condition of the provided variant.
///
/// [variant] - The [ContextVariant] whose condition is to be negated.

class OnNotVariant extends ContextVariant {
  final ContextVariant variant;

  OnNotVariant(this.variant) : super(key: ValueKey(variant));

  @override
  List<Object?> get props => [key, variant];

  @override
  bool build(BuildContext context) {
    return !variant.build(context);
  }
}
