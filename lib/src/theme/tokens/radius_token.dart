import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

@immutable
class RadiiTokenUtil {
  final small = RadiusToken.small;
  final medium = RadiusToken.medium;
  final large = RadiusToken.large;

  const RadiiTokenUtil();
}

@immutable
class RadiusToken extends Radius implements MixToken<Radius> {
  static const small = RadiusToken('--mix-radii-small');
  static const medium = RadiusToken('--mix-radii-medium');
  static const large = RadiusToken('--mix-radii-large');

  @override
  final String name;

  const RadiusToken(this.name) : super.circular(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadiusToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

@immutable
class RadiusTokenResolver extends RadiusToken with TokenResolver<Radius> {
  @override
  final Radius Function(BuildContext context) tokenResolver;

  const RadiusTokenResolver(super.name, this.tokenResolver);
}

// // Helper class to wrap functions that can return
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

  T get small => call(RadiusToken.small);

  T get medium => call(RadiusToken.medium);

  T get large => call(RadiusToken.large);

  T call(Radius value) => _fn(value);
}
