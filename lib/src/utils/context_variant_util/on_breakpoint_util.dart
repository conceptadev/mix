import 'package:flutter/material.dart';

import '../../helpers/extensions/string_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../../variants/context_variant.dart';

/// Global breakpoint context variants based on predefined screen sizes.
/// These can be used to apply styles or layouts conditionally depending on the screen size.

/// Variant for small screens.
final onSmall = onScreenSize(BreakpointToken.small);

/// Variant for extra small screens.
final onXSmall = onScreenSize(BreakpointToken.xsmall);

/// Variant for medium screens.
final onMedium = onScreenSize(BreakpointToken.medium);

/// Variant for large screens.
final onLarge = onScreenSize(BreakpointToken.large);

/// Creates a [ContextVariant] for custom breakpoint constraints.
///
/// [minWidth] and [maxWidth] define the width constraints, while [orientation] specifies
/// the orientation constraint. This function returns a [ContextVariant] which will apply
/// when the screen size matches these constraints.
ContextVariant onBreakpoint({
  minWidth = 0,
  maxWidth = double.infinity,
  orientation = BreakpointOrientation.all,
}) {
  final constraints = BreakpointConstraint(
    minWidth: minWidth,
    maxWidth: maxWidth,
    orientation: orientation,
  );
  final constraintName =
      'minWidth-${constraints.minWidth}-maxWidth-${constraints.maxWidth}-orientation-${constraints.orientation}';

  return ContextVariant(
    'on-$constraintName',
    when: (BuildContext context) {
      final size = MediaQuery.sizeOf(context);

      return constraints.matches(size);
    },
  );
}

/// Creates a [ContextVariant] based on a specific [screenSize].
///
/// This function uses the [screenSize] to retrieve breakpoint settings from [MixTheme],
/// and returns a [ContextVariant] that applies when the current screen size matches
/// the specified breakpoint.
ContextVariant onScreenSize(BreakpointToken screenSize) {
  return ContextVariant(
    'on-${screenSize.name.paramCase}',
    when: (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      final size = MediaQuery.sizeOf(context);

      final selectedbreakpoint = breakpoints[screenSize];

      assert(
        selectedbreakpoint != null,
        'Breakpoint ${screenSize.name} is not defined in the theme',
      );

      return selectedbreakpoint?.call(context).matches(size) ?? false;
    },
  );
}
