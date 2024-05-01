import 'package:flutter/material.dart';

import '../../variants/variant.dart';

/// Global brightness context variants.
/// These variants are used to apply styles or behaviors conditionally based on the theme's brightness setting.

/// Variant for dark mode.
final onDark = OnBrightnessVariant(Brightness.dark);

/// Variant for light mode.
final onLight = OnBrightnessVariant(Brightness.light);

/// Creates a [ContextVariant] that the user can select when is applied
/// based on the current theme's brightness.
const onBrightness = OnBrightnessVariant.new;

/// Creates a [ContextVariant] based on the specified [brightness].
///
/// This function returns a [ContextVariant] that applies when the current theme's
/// brightness matches the specified [brightness]. It is useful for defining
/// brightness-specific styles or behaviors in the application.
class OnBrightnessVariant extends ContextVariant {
  final Brightness brightness;

  OnBrightnessVariant(this.brightness) : super(key: ValueKey(brightness));

  @override
  List<Object?> get props => [key, brightness];

  @override
  bool build(BuildContext context) {
    return Theme.of(context).brightness == brightness;
  }
}
// class OnBreakpointTokenVariant extends ContextVariant {
//   final BreakpointToken token;

//   OnBreakpointTokenVariant(this.token) : super(key: ValueKey(token));

//   @override
//   List<Object?> get props => [key, token];

//   @override
//   bool build(BuildContext context) {
//     final size = context.screenSize;

//     final selectedbreakpoint = token.resolve(context);

//     return selectedbreakpoint.matches(size);
//   }
// }
