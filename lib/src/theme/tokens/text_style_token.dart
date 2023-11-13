import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

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
