import 'package:flutter/material.dart';

import 'mix_token.dart';

typedef SpaceRef = double;

const _xsmall = SpaceToken('mix.space.xsmall', 4.0);
const _small = SpaceToken('mix.space.small', 8.0);
const _medium = SpaceToken('mix.space.medium', 16.0);
const _large = SpaceToken('mix.space.large', 24.0);
const _xlarge = SpaceToken('mix.space.xlarge', 32.0);
const _xxlarge = SpaceToken('mix.space.xxlarge', 40.0);

/// A class representing a space token, which extends `MixToken` class
/// and uses the `SizeTokenMixin` mixin.
///
/// A space token defines a value for controlling the
/// size of UI elements.
@immutable
class SpaceToken extends MixToken<double> {
  static const xsmall = _xsmall;
  static const small = _small;
  static const medium = _medium;
  static const large = _large;
  static const xlarge = _xlarge;
  static const xxlarge = _xxlarge;

  /// A constant constructor that accepts a `String` argument named [name].
  /// Name needs to be unique per token
  ///
  /// [name] is used to initialize the superclass `MixToken`.
  const SpaceToken(super.name, super.value);

  @override
  double call() => hashCode * -1.0;
}
