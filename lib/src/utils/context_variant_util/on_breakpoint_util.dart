import 'package:flutter/material.dart';

import '../../helpers/build_context_ext.dart';
import '../../theme/tokens/breakpoints_token.dart';
import '../../variants/variant.dart';

/// Context variant that applies styles based on the BreakpointToken.small screen size.
final onSmall = OnBreakpointTokenVariant(BreakpointToken.small);

/// Context variant that applies styles based on the BreakpointToken.xsmall screen size.
final onXSmall = OnBreakpointTokenVariant(BreakpointToken.xsmall);

/// Context variant that applies styles based on the BreakpointToken.medium screen size.
final onMedium = OnBreakpointTokenVariant(BreakpointToken.medium);

/// Context variant that applies styles based on the BreakpointToken.large screen size.
final onLarge = OnBreakpointTokenVariant(BreakpointToken.large);

/// Represents a variant of a context based on a specific breakpoint.
///
/// This class extends [ContextVariant] and is used to determine whether a given
/// [BuildContext] matches the specified [breakpoint].
class OnBreakPointVariant extends ContextVariant {
  /// The breakpoint used to determine the context variant.
  final Breakpoint breakpoint;

  /// Creates a new [OnBreakPointVariant] with the specified [breakpoint].
  ///
  /// The [breakpoint] is used as the [key] for the [ContextVariant].
  OnBreakPointVariant({required this.breakpoint})
      : super(key: ValueKey(breakpoint));

  /// Returns a list containing the [key] and [breakpoint] properties.
  @override
  List<Object?> get props => [key, breakpoint];

  /// Determines whether the given [BuildContext] matches this variant's [breakpoint].
  ///
  /// Returns `true` if the [context]'s screen size matches the [breakpoint],
  /// and `false` otherwise.
  @override
  bool build(BuildContext context) {
    return breakpoint.matches(context.screenSize);
  }
}

/// A variant of [ContextVariant] based on a [BreakpointToken].
///
/// This class determines whether the selected breakpoint matches the current
/// screen size within the given [BuildContext].
class OnBreakpointTokenVariant extends ContextVariant {
  /// The [BreakpointToken] associated with this variant.
  final BreakpointToken token;

  /// Creates a new [OnBreakpointTokenVariant] with the given [token].
  ///
  /// The [key] is set to a [ValueKey] based on the [token].
  OnBreakpointTokenVariant(this.token) : super(key: ValueKey(token));

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [token].
  @override
  List<Object?> get props => [key, token];

  /// Determines whether the selected breakpoint matches the current screen size.
  ///
  /// Returns `true` if the breakpoint resolved from [token] matches the screen
  /// size obtained from the [context], and `false` otherwise.
  @override
  bool build(BuildContext context) {
    final size = context.screenSize;
    final selectedbreakpoint = token.resolve(context);

    return selectedbreakpoint.matches(size);
  }
}
