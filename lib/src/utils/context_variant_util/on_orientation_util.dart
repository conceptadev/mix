import 'package:flutter/material.dart';

import '../../variants/variant.dart';

/// Variant for portrait orientation.
///
/// This global variant is used to apply styles or behaviors when the device is in portrait orientation.
final onPortrait = OnOrientationVariant(Orientation.portrait);

/// Variant for landscape orientation.
///
/// This global variant is used to apply styles or behaviors when the device is in landscape orientation.
final onLandscape = OnOrientationVariant(Orientation.landscape);

/// Creates a [ContextVariant] that the user can select when is applied
/// based on the current device orientation.
const onOrientation = OnOrientationVariant.new;

/// Creates a [ContextVariant] for a specific [orientation].
///
/// This function returns a [ContextVariant] that applies when the current
/// orientation of the device matches the specified [orientation]. It is useful
/// for defining orientation-specific styles or behaviors in the application.
///
/// [orientation] - The device orientation (portrait or landscape) for which the variant is to be created.

class OnOrientationVariant extends ContextVariant {
  final Orientation orientation;

  OnOrientationVariant(this.orientation) : super(key: ValueKey(orientation));

  @override
  List<Object?> get props => [key, orientation];

  @override
  bool build(BuildContext context) {
    return MediaQuery.of(context).orientation == orientation;
  }
}
