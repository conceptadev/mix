import 'package:flutter/material.dart';

import 'mix_token.dart';

@immutable
class ColorToken extends MixToken<Color> {
  const ColorToken(super.name, super.value);

  factory ColorToken.resolvable(
    String name,
    BuildContextResolver<Color> resolver,
  ) {
    return ColorToken(name, ColorResolver(resolver));
  }

  @override
  ColorRef call() => ColorRef(this);
}

class ColorResolver extends Color with WithTokenResolver<Color> {
  @override
  final BuildContextResolver<Color> resolve;

  const ColorResolver(this.resolve) : super(0);
}

class ColorRef extends Color with TokenRef<ColorToken, Color> {
  @override
  final ColorToken token;

  const ColorRef(this.token) : super(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorRef && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
