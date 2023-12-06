import 'package:flutter/material.dart';

import '../mix_theme.dart';
import 'mix_token.dart';

@immutable
class ColorToken extends MixToken<Color> {
  const ColorToken(super.name);

  @override
  ColorRef call() => ColorRef(this);

  @override
  Color resolve(BuildContext context) {
    final themeValue = MixTheme.of(context).colors[this];
    assert(
      themeValue != null,
      'ColorToken $name is not defined in the theme',
    );

    return themeValue is ColorResolver
        ? themeValue.resolve(context)
        : themeValue ?? Colors.transparent;
  }
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
