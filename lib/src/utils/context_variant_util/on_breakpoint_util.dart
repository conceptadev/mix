import 'package:flutter/material.dart';

import '../../helpers/build_context_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints_token.dart';
import '../../variants/variant.dart';

/// Global breakpoint context variants based on predefined screen sizes.
/// These can be used to apply styles or layouts conditionally depending on the screen size.

/// Variant for small screens.
final onSmall = OnBreakpointTokenVariant(BreakpointToken.small);

/// Variant for extra small screens.
final onXSmall = OnBreakpointTokenVariant(BreakpointToken.xsmall);

/// Variant for medium screens.
final onMedium = OnBreakpointTokenVariant(BreakpointToken.medium);

/// Variant for large screens.
final onLarge = OnBreakpointTokenVariant(BreakpointToken.large);

/// Creates a [ContextVariant] for custom breakpoint constraints.
///
/// [minWidth] and [maxWidth] define the width constraints, while [orientation] specifies
/// the orientation constraint. This function returns a [ContextVariant] which will apply
/// when the screen size matches these constraints.
///
OnBreakPointVariant onBreakpoint({
  double minWidth = 0,
  double maxWidth = double.infinity,
}) {
  final constraints = Breakpoint(minWidth: minWidth, maxWidth: maxWidth);

  return OnBreakPointVariant(breakpoint: constraints);
}

class OnBreakPointVariant extends ContextVariant {
  final Breakpoint breakpoint;

  OnBreakPointVariant({required this.breakpoint})
      : super(key: ValueKey(breakpoint));

  @override
  List<Object?> get props => [key, breakpoint];

  @override
  bool build(BuildContext context) {
    return breakpoint.matches(context.screenSize);
  }
}

/// Creates a [ContextVariant] based on a specific [token].
///
/// This function uses the [token] to retrieve breakpoint settings from [MixTheme],
/// and returns a [ContextVariant] that applies when the current screen size matches
/// the specified breakpoint.
class OnBreakpointTokenVariant extends ContextVariant {
  final BreakpointToken token;

  OnBreakpointTokenVariant(this.token) : super(key: ValueKey(token));

  @override
  List<Object?> get props => [key, token];

  @override
  bool build(BuildContext context) {
    final size = context.screenSize;

    final selectedbreakpoint = token.resolve(context);

    return selectedbreakpoint.matches(size);
  }
}
