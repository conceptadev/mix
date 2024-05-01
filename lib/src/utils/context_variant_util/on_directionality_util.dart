import 'package:flutter/material.dart';

import '../../variants/variant.dart';

/// Variant for Right-To-Left (RTL) text direction.
final onRTL = OnDirectionalityVariant(TextDirection.rtl);

/// Variant for Left-To-Right (LTR) text direction.
final onLTR = OnDirectionalityVariant(TextDirection.ltr);

/// Creates a [ContextVariant] that the user can select when is applied
/// based on the current text directionality.
const onDirectionality = OnDirectionalityVariant.new;

/// Creates a [ContextVariant] for a specific [direction] of text.
///
/// This function returns a [ContextVariant] that applies when the current
/// text directionality matches the specified [direction]. It is particularly useful
/// for defining directionality-specific styles or behaviors in the application.
///
/// [direction] - The text direction (RTL or LTR) for which the variant is to be created.
class OnDirectionalityVariant extends ContextVariant {
  final TextDirection direction;

  OnDirectionalityVariant(this.direction) : super(key: ValueKey(direction));

  @override
  List<Object?> get props => [key, direction];

  @override
  bool build(BuildContext context) {
    return Directionality.of(context) == direction;
  }
}
