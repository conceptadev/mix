import 'package:flutter/material.dart';

import '../../helpers/string_ext.dart';
import '../../variants/context_variant.dart';

/// Variant for Right-To-Left (RTL) text direction.
final onRTL = onDirectionality(TextDirection.rtl);

/// Variant for Left-To-Right (LTR) text direction.
final onLTR = onDirectionality(TextDirection.ltr);

/// Creates a [ContextVariant] for a specific [direction] of text.
///
/// This function returns a [ContextVariant] that applies when the current
/// text directionality matches the specified [direction]. It is particularly useful
/// for defining directionality-specific styles or behaviors in the application.
///
/// [direction] - The text direction (RTL or LTR) for which the variant is to be created.
ContextVariant onDirectionality(TextDirection direction) {
  return ContextVariant(
    'on-${direction.name.paramCase}',
    when: (BuildContext context) => Directionality.of(context) == direction,
  );
}
