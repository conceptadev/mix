import 'package:flutter/widgets.dart';

import '../../internal/build_context_ext.dart';
import '../../theme/tokens/breakpoints_token.dart';
import '../context_variant.dart';

/// Represents a variant of a context based on a specific breakpoint.
///
/// This class extends [ContextVariant] and is used to determine whether a given
/// [BuildContext] matches the specified [breakpoint].
class OnBreakPointVariant extends MediaQueryContextVariant {
  /// The breakpoint used to determine the context variant.
  final Breakpoint breakpoint;

  /// Creates a new [OnBreakPointVariant] with the specified [breakpoint].
  ///
  /// The [breakpoint] is used as the [key] for the [ContextVariant].
  const OnBreakPointVariant(this.breakpoint);

  /// Determines whether the given [BuildContext] matches this variant's [breakpoint].
  ///
  /// Returns `true` if the [context]'s screen size matches the [breakpoint],
  /// and `false` otherwise.
  @override
  bool when(BuildContext context) {
    return breakpoint.matches(context.screenSize);
  }

  @override
  Object get mergeKey => '$runtimeType.$breakpoint';

  /// Returns a list containing the [key] and [breakpoint] properties.
  @override
  List<Object?> get props => [breakpoint];
}

/// A variant of [ContextVariant] based on a [BreakpointToken].
///
/// This class determines whether the selected breakpoint matches the current
/// screen size within the given [BuildContext].
class OnBreakpointTokenVariant extends MediaQueryContextVariant {
  /// The [BreakpointToken] associated with this variant.
  final BreakpointToken token;

  /// Creates a new [OnBreakpointTokenVariant] with the given [token].
  ///
  /// The [key] is set to a [ValueKey] based on the [token].
  const OnBreakpointTokenVariant(this.token);

  /// Determines whether the selected breakpoint matches the current screen size.
  ///
  /// Returns `true` if the breakpoint resolved from [token] matches the screen
  /// size obtained from the [context], and `false` otherwise.
  @override
  bool when(BuildContext context) {
    final size = context.screenSize;
    final selectedbreakpoint = token.resolve(context);

    return selectedbreakpoint.matches(size);
  }

  @override
  Object get mergeKey => '$runtimeType.${token.name}';

  /// The properties used for equality comparison.
  ///
  /// Returns a list containing the [key] and [token].
  @override
  List<Object?> get props => [token];
}
