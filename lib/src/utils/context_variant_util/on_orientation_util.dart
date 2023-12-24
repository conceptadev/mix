import 'package:flutter/material.dart';

import '../../helpers/string_ext.dart';
import '../../variants/variant.dart';

/// Variant for portrait orientation.
///
/// This global variant is used to apply styles or behaviors when the device is in portrait orientation.
final onPortrait = onOrientation(Orientation.portrait);

/// Variant for landscape orientation.
///
/// This global variant is used to apply styles or behaviors when the device is in landscape orientation.
final onLandscape = onOrientation(Orientation.landscape);

/// Creates a [ContextVariant] for a specific [orientation].
///
/// This function returns a [ContextVariant] that applies when the current
/// orientation of the device matches the specified [orientation]. It is useful
/// for defining orientation-specific styles or behaviors in the application.
///
/// [orientation] - The device orientation (portrait or landscape) for which the variant is to be created.
ContextVariant onOrientation(Orientation orientation) {
  return ContextVariant(
    'on-${orientation.name.paramCase}',
    (context) => MediaQuery.orientationOf(context) == orientation,
  );
}
