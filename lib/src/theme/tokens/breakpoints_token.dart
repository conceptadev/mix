import 'package:flutter/material.dart';

import '../mix_theme.dart';
import 'mix_token.dart';

@Deprecated('Dont use this anymore')
enum BreakpointOrientation {
  portrait,
  landscape,
  all,
}

class Breakpoint {
  final double minWidth;
  final double maxWidth;

  const Breakpoint({this.minWidth = 0, this.maxWidth = double.infinity});

  bool matches(Size size) {
    return size.width >= minWidth && size.width <= maxWidth;
  }
}

const _breakpointXsmall = BreakpointToken('mix.breakpoint.xsmall');
const _breakpointSmall = BreakpointToken('mix.breakpoint.small');
const _breakpointMedium = BreakpointToken('mix.breakpoint.medium');
const _breakpointLarge = BreakpointToken('mix.breakpoint.large');

@immutable
class BreakpointToken extends MixToken<Breakpoint> {
  static const xsmall = _breakpointXsmall;
  static const small = _breakpointSmall;
  static const medium = _breakpointMedium;
  static const large = _breakpointLarge;

  const BreakpointToken(super.name);

  @override
  Breakpoint call() => BreakpointRef(this);

  @override
  Breakpoint resolve(BuildContext context) {
    final themeValue = MixTheme.of(context).breakpoints[this];
    assert(
      themeValue != null,
      'BreakpointToken $name is not defined in the theme',
    );

    return themeValue is BreakpointResolver
        ? themeValue.resolve(context)
        : themeValue ?? const Breakpoint();
  }
}

@immutable
class BreakpointResolver extends Breakpoint with WithTokenResolver<Breakpoint> {
  @override
  final BuildContextResolver<Breakpoint> resolve;

  const BreakpointResolver(this.resolve);
}

@immutable
class BreakpointRef extends Breakpoint
    with TokenRef<BreakpointToken, Breakpoint> {
  @override
  final BreakpointToken token;
  const BreakpointRef(this.token);
}
