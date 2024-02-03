import '../../helpers/build_context_ext.dart';
import '../../helpers/string_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints_token.dart';
import '../../variants/variant.dart';

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
ContextVariant onBreakpoint({
  double minWidth = 0,
  double maxWidth = double.infinity,
}) {
  final constraints = Breakpoint(minWidth: minWidth, maxWidth: maxWidth);
  final constraintName =
      'minWidth-${constraints.minWidth}-maxWidth-${constraints.maxWidth}';

  return ContextVariant('on-$constraintName', (context) {
    final size = context.screenSize;

    return constraints.matches(size);
  });
}

/// Creates a [ContextVariant] based on a specific [token].
///
/// This function uses the [token] to retrieve breakpoint settings from [MixTheme],
/// and returns a [ContextVariant] that applies when the current screen size matches
/// the specified breakpoint.
ContextVariant onBreakpointToken(BreakpointToken token) {
  return ContextVariant('on-${token.name.paramCase}', (context) {
    final size = context.screenSize;

    final selectedbreakpoint = token.resolve(context);

    return selectedbreakpoint.matches(size);
  });
}
