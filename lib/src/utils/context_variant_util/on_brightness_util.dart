import 'package:flutter/material.dart';

import '../../core/extensions/string_ext.dart';
import '../../variants/context_variant.dart';

/// Global brightness context variants.
/// These variants are used to apply styles or behaviors conditionally based on the theme's brightness setting.

/// Variant for dark mode.
final onDark = onBrightness(Brightness.dark);

/// Variant for light mode.
final onLight = onBrightness(Brightness.light);

/// Creates a [ContextVariant] based on the specified [brightness].
///
/// This function returns a [ContextVariant] that applies when the current theme's
/// brightness matches the specified [brightness]. It is useful for defining
/// brightness-specific styles or behaviors in the application.
ContextVariant onBrightness(Brightness brightness) {
  return ContextVariant(
    'on-${brightness.name.paramCase}',
    when: (BuildContext context) {
      return Theme.of(context).brightness == brightness;
    },
  );
}
