import 'package:flutter/material.dart';

import 'mix_token.dart';

enum BreakpointOrientation {
  portrait,
  landscape,
  all,
}

class BreakpointConstraint {
  final double minWidth;
  final double maxWidth;
  final BreakpointOrientation orientation;

  const BreakpointConstraint({
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.orientation = BreakpointOrientation.all,
  });

  bool matches(Size size) {
    final matchesWidth = size.width >= minWidth && size.width <= maxWidth;
    final matchesOrientation = orientation == BreakpointOrientation.all ||
        (orientation == BreakpointOrientation.portrait &&
            size.height > size.width) ||
        (orientation == BreakpointOrientation.landscape &&
            size.width > size.height);

    return matchesWidth && matchesOrientation;
  }
}

class BreakpointToken extends MixToken<BreakpointConstraint> {
  static const xsmall = BreakpointToken('--mix-breakpoint-xsmall');
  static const small = BreakpointToken('--mix-breakpoint-small');
  static const medium = BreakpointToken('--mix-breakpoint-medium');
  static const large = BreakpointToken('--mix-breakpoint-large');

  const BreakpointToken(super.name);
}
