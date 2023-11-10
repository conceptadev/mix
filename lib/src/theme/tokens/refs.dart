import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class ColorToken extends Color implements MixToken<Color> {
  @override
  final String name;

  const ColorToken(this.name) : super(0);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class ColorTokenResolver extends ColorToken with TokenResolver<Color> {
  @override
  final Color Function(BuildContext context) tokenResolver;

  const ColorTokenResolver(super.name, this.tokenResolver);
}

class TextStyleToken extends TextStyle implements MixToken<TextStyle> {
  @override
  final String name;

  const TextStyleToken(this.name);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class TextStyleTokenResolver extends TextStyleToken
    with TokenResolver<TextStyle> {
  @override
  final TextStyle Function(BuildContext context) tokenResolver;

  const TextStyleTokenResolver(super.name, this.tokenResolver);
}

class RadiusToken extends Radius implements MixToken<Radius> {
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

class RadiusTokenResolver extends RadiusToken with TokenResolver<Radius> {
  @override
  final Radius Function(BuildContext context) tokenResolver;

  const RadiusTokenResolver(super.name, this.tokenResolver);
}
