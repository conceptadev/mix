import 'package:flutter/material.dart';

import 'mix_token.dart';

@Deprecated('Dont use this anymore')
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

const _breakpointXsmall = BreakpointToken(
  'mix.breakpoint.xsmall',
  BreakpointConstraint(maxWidth: 599),
);
const _breakpointSmall = BreakpointToken(
  'mix.breakpoint.small',
  BreakpointConstraint(minWidth: 600, maxWidth: 1023),
);
const _breakpointMedium = BreakpointToken(
  'mix.breakpoint.medium',
  BreakpointConstraint(minWidth: 1024, maxWidth: 1439),
);
const _breakpointLarge = BreakpointToken(
  'mix.breakpoint.large',
  BreakpointConstraint(minWidth: 1440, maxWidth: double.infinity),
);

class BreakpointToken extends MixToken<BreakpointConstraint> {
  static const xsmall = _breakpointXsmall;
  static const small = _breakpointSmall;
  static const medium = _breakpointMedium;
  static const large = _breakpointLarge;

  const BreakpointToken(super.name, super.value);

  @override
  BreakpointConstraint call() => value;
}
