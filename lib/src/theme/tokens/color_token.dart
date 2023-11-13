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
