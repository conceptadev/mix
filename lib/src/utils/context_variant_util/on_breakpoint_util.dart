import 'package:flutter/material.dart';

import '../../helpers/extensions/string_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../../variants/context_variant.dart';

/// Global breakpoint context variants based on predefined screen sizes.
/// These can be used to apply styles or layouts conditionally depending on the screen size.

/// Variant for small screens.
final onSmall = onBreakpointToken(BreakpointToken.small);

/// Variant for extra small screens.
final onXSmall = onBreakpointToken(BreakpointToken.xsmall);

/// Variant for medium screens.
final onMedium = onBreakpointToken(BreakpointToken.medium);

/// Variant for large screens.
final onLarge = onBreakpointToken(BreakpointToken.large);

/// Creates a [ContextVariant] for custom breakpoint constraints.
///
/// [minWidth] and [maxWidth] define the width constraints, while [orientation] specifies
/// the orientation constraint. This function returns a [ContextVariant] which will apply
/// when the screen size matches these constraints.
ContextVariant onBreakpoint({minWidth = 0, maxWidth = double.infinity}) {
  final constraints = BreakpointConstraint(
    minWidth: minWidth,
    maxWidth: maxWidth,
  );
  final constraintName =
      'minWidth-${constraints.minWidth}-maxWidth-${constraints.maxWidth}';

  return ContextVariant(
    'on-$constraintName',
    when: (BuildContext context) {
      final size = MediaQuery.sizeOf(context);

      return constraints.matches(size);
    },
  );
}

/// Creates a [ContextVariant] based on a specific [token].
///
/// This function uses the [token] to retrieve breakpoint settings from [MixTheme],
/// and returns a [ContextVariant] that applies when the current screen size matches
/// the specified breakpoint.
ContextVariant onBreakpointToken(BreakpointToken token) {
  return ContextVariant(
    'on-${token.name.paramCase}',
    when: (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      final size = MediaQuery.sizeOf(context);

      final selectedbreakpoint = breakpoints(token, context);

      return selectedbreakpoint.matches(size);
    },
  );
}
