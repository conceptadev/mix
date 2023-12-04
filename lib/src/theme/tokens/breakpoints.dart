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

  const BreakpointConstraint({
    this.minWidth = 0,
    this.maxWidth = double.infinity,
  });

  bool matches(Size size) {
    return size.width >= minWidth && size.width <= maxWidth;
  }
}

class BreakpointToken extends MixToken<BreakpointConstraint> {
  static const xsmall = BreakpointToken(
    'mix.breakpoint.xsmall',
    BreakpointConstraint(maxWidth: 599),
  );
  static const small = BreakpointToken(
    'mix.breakpoint.small',
    BreakpointConstraint(minWidth: 600, maxWidth: 1023),
  );
  static const medium = BreakpointToken(
    'mix.breakpoint.medium',
    BreakpointConstraint(minWidth: 1024, maxWidth: 1439),
  );
  static const large = BreakpointToken(
    'mix.breakpoint.large',
    BreakpointConstraint(minWidth: 1440, maxWidth: double.infinity),
  );

  const BreakpointToken(super.name, super.value);

  @override
  BreakpointConstraint call() => value;
}
