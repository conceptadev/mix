// The dimension logic lives in package:mix_core (pure Dart, no Size). This
// subclass keeps mix's original API: `matches(Size)` and
// `matchesContext(BuildContext)`.

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

/// Represents an inclusive size range used for responsive styling.
///
/// Use [matchesContext] to evaluate the viewport size from `MediaQuery`, or
/// [matches] to evaluate any [Size], including one derived from local layout
/// constraints.
///
/// Example usage:
/// ```dart
/// const Breakpoint mobile = .maxWidth(767);
/// const Breakpoint tablet = .widthRange(768, 1023);
/// const Breakpoint desktop = .minWidth(1024);
/// ```
@immutable
class Breakpoint extends core.Breakpoint {
  static const mobile = Breakpoint(maxWidth: 767);

  static const tablet = Breakpoint(minWidth: 768, maxWidth: 1023);

  static const desktop = Breakpoint(minWidth: 1024);

  /// Creates a new breakpoint with the specified constraints.
  ///
  /// At least one constraint must be provided.
  const Breakpoint({
    super.minWidth,
    super.maxWidth,
    super.minHeight,
    super.maxHeight,
  });

  /// Creates a breakpoint that matches widths less than or equal to [maxWidth].
  const Breakpoint.maxWidth(double maxWidth) : this(maxWidth: maxWidth);

  /// Creates a breakpoint that matches widths greater than or equal to [minWidth].
  const Breakpoint.minWidth(double minWidth) : this(minWidth: minWidth);

  /// Creates a breakpoint that matches widths from [minWidth] to [maxWidth].
  const Breakpoint.widthRange(double minWidth, double maxWidth)
    : this(minWidth: minWidth, maxWidth: maxWidth);

  /// Creates a breakpoint that matches heights less than or equal to [maxHeight].
  const Breakpoint.maxHeight(double maxHeight) : this(maxHeight: maxHeight);

  /// Creates a breakpoint that matches heights greater than or equal to [minHeight].
  const Breakpoint.minHeight(double minHeight) : this(minHeight: minHeight);

  /// Creates a breakpoint that matches heights from [minHeight] to [maxHeight].
  const Breakpoint.heightRange(double minHeight, double maxHeight)
    : this(minHeight: minHeight, maxHeight: maxHeight);

  /// Checks if the given [size] matches this breakpoint's constraints.
  bool matches(Size size) => matchesDimensions(size.width, size.height);

  /// Checks whether this breakpoint matches the viewport size from [context].
  bool matchesContext(BuildContext context) {
    return matches(MediaQuery.sizeOf(context));
  }
}
