import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../mix/mix_theme.dart';
import 'mix_token.dart';

class RadiusToken extends MixToken<Radius> {
  const RadiusToken(super.name);

  @override
  RadiusRef call() => RadiusRef(this);

  @override
  Radius resolve(BuildContext context) {
    final themeValue = MixTheme.of(context).radii[this];
    assert(
      themeValue != null,
      'RadiusToken $name is not defined in the theme and has no default value',
    );

    final resolvedValue =
        themeValue is RadiusResolver ? themeValue.resolve(context) : themeValue;

    return resolvedValue ?? const Radius.circular(0);
  }
}

@immutable
class RadiusResolver extends Radius with WithTokenResolver<Radius> {
  @override
  final BuildContextResolver<Radius> resolve;

  const RadiusResolver(this.resolve) : super.circular(0);
}

@immutable
class RadiusRef extends Radius with TokenRef<RadiusToken, Radius> {
  @override
  final RadiusToken token;

  const RadiusRef(this.token) : super.circular(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadiusRef && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

// Helper class to wrap functions that can return
// a Radius token that resmebles the WithSpaceToken
@immutable
class UtilityWithRadiusTokens<T> {
  final T Function(Radius value) _fn;

  const UtilityWithRadiusTokens(T Function(Radius value) fn) : _fn = fn;

  factory UtilityWithRadiusTokens.shorthand(
    T Function(Radius p1, [Radius? p2, Radius? p3, Radius? p4]) fn,
  ) {
    // Need to accept a type with positional params, and convert it into a function that accepts a double and returns T
    return UtilityWithRadiusTokens((Radius value) => fn(value));
  }

  T call(Radius value) => _fn(value);
}
