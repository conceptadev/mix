// The breakpoint type lives in package:mix_core (pure doubles); mix layers
// the Flutter conveniences on via an extension.

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

/// Represents an inclusive size range used for responsive styling.
///
/// Use [BreakpointFlutter.matchesContext] to evaluate the viewport size from
/// `MediaQuery`, or [BreakpointFlutter.matches] to evaluate any [Size],
/// including one derived from local layout constraints.
///
/// Example usage:
/// ```dart
/// const Breakpoint mobile = .maxWidth(767);
/// const Breakpoint tablet = .widthRange(768, 1023);
/// const Breakpoint desktop = .minWidth(1024);
/// ```
typedef Breakpoint = core.Breakpoint;

extension BreakpointFlutter on Breakpoint {
  /// Checks if the given [size] matches this breakpoint's constraints.
  bool matches(Size size) => matchesDimensions(size.width, size.height);

  /// Checks whether this breakpoint matches the viewport size from [context].
  bool matchesContext(BuildContext context) =>
      matches(MediaQuery.sizeOf(context));
}
