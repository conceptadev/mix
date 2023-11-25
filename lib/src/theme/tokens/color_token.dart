import 'package:flutter/material.dart';

import 'mix_token.dart';

class ColorToken extends MixToken<Color> {
  const ColorToken(super.name, super.value);

  const ColorToken.name(String name) : this(name, Colors.transparent);

  factory ColorToken.resolvable(String name, TokenResolver<Color> resolver) {
    return ColorToken(name, ColorRef(name, resolver));
  }
}

class ColorRef extends Color with ValueRef<Color> {
  @override
  final String tokenName;

  @override
  final TokenResolver<Color> resolve;

  const ColorRef(this.tokenName, this.resolve) : super(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorRef && other.tokenName == tokenName;
  }

  @override
  int get hashCode => tokenName.hashCode;
}
