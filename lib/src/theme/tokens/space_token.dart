// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../mix_theme.dart';
import 'mix_token.dart';

typedef SpaceRef = double;

extension SpaceRefExt on SpaceRef {
  double resolve(BuildContext context) {
    final token = MixTheme.of(context).space.findByRef(this);

    assert(
      token != null,
      'SpaceRef $this is not defined in the theme',
    );

    return token?.resolve(context) ?? 0.0;
  }
}

const _xsmall = SpaceToken('mix.space.xsmall');
const _small = SpaceToken('mix.space.small');
const _medium = SpaceToken('mix.space.medium');
const _large = SpaceToken('mix.space.large');
const _xlarge = SpaceToken('mix.space.xlarge');
const _xxlarge = SpaceToken('mix.space.xxlarge');

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
  const SpaceToken(super.name);

  @override
  double call() => hashCode * -1.0;

  @override
  double resolve(BuildContext context) {
    final themeValue = MixTheme.of(context).space[this];
    assert(
      themeValue != null,
      'SpaceToken $name is not defined in the theme',
    );

    return themeValue!;
  }
}
