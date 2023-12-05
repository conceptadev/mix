import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class TextStyleToken extends MixToken<TextStyle> {
  const TextStyleToken(super.name, super.value);

  factory TextStyleToken.resolvable(
    String name,
    BuildContextResolver<TextStyle> resolver,
  ) {
    return TextStyleToken(name, TextStyleResolver(resolver));
  }
  @override
  TextStyleRef call() => TextStyleRef(this);
}

@immutable
class TextStyleResolver extends TextStyle with WithTokenResolver<TextStyle> {
  @override
  final BuildContextResolver<TextStyle> resolve;

  const TextStyleResolver(this.resolve);
}

@immutable
class TextStyleRef extends TextStyle with TokenRef<TextStyleToken, TextStyle> {
  @override
  final TextStyleToken token;

  const TextStyleRef(this.token);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleRef && other.token == token;
  }

  @override
  bool get inherit => throw _e(token.name, 'inherit');

  @override
  Color get color => throw _e(token.name, 'color');

  @override
  Color get backgroundColor => throw _e(token.name, 'backgroundColor');

  @override
  double get fontSize => throw _e(token.name, 'fontSize');

  @override
  FontWeight get fontWeight => throw _e(token.name, 'fontWeight');

  @override
  FontStyle get fontStyle => throw _e(token.name, 'fontStyle');

  @override
  double get letterSpacing => throw _e(token.name, 'letterSpacing');

  @override
  double get wordSpacing => throw _e(token.name, 'wordSpacing');

  @override
  TextBaseline get textBaseline => throw _e(token.name, 'textBaseline');

  @override
  double get height => throw _e(token.name, 'height');

  @override
  TextLeadingDistribution get leadingDistribution =>
      throw _e(token.name, 'leadingDistribution');

  @override
  Locale get locale => throw _e(token.name, 'locale');

  @override
  Paint get foreground => throw _e(token.name, 'foreground');

  @override
  Paint get background => throw _e(token.name, 'background');

  @override
  List<Shadow> get shadows => throw _e(token.name, 'shadows');

  @override
  List<FontFeature> get fontFeatures => throw _e(token.name, 'fontFeatures');

  @override
  List<FontVariation> get fontVariations =>
      throw _e(token.name, 'fontVariations');

  @override
  TextDecoration get decoration => throw _e(token.name, 'decoration');

  @override
  Color get decorationColor => throw _e(token.name, 'decorationColor');

  @override
  TextDecorationStyle get decorationStyle =>
      throw _e(token.name, 'decorationStyle');

  @override
  double get decorationThickness => throw _e(token.name, 'decorationThickness');

  @override
  String get debugLabel => throw _e(token.name, 'debugLabel');

  @override
  int get hashCode => token.name.hashCode;
}

TokenFieldAccessError _e(String token, String field) {
  return TokenFieldAccessError(token, field);
}

class TokenFieldAccessError extends Error {
  final String tokenName;
  final String fieldName;

  TokenFieldAccessError(this.tokenName, this.fieldName);

  @override
  String toString() {
    return '$tokenName cannot have field $fieldName because it is outside of context';
  }
}
