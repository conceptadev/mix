import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class TextStyleToken extends MixToken<TextStyle> {
  const TextStyleToken(super.name, super.value);

  const TextStyleToken.name(String name) : this(name, const TextStyle());

  factory TextStyleToken.resolvable(
    String name,
    TokenResolver<TextStyle> resolver,
  ) {
    return TextStyleToken(name, TextStyleRef(name, resolver));
  }
}

@immutable
class TextStyleRef extends TextStyle with ValueRef<TextStyle> {
  @override
  final String tokenName;

  @override
  final TokenResolver<TextStyle> resolve;

  const TextStyleRef(this.tokenName, this.resolve);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleRef && other.tokenName == tokenName;
  }

  @override
  bool get inherit => throw _e(tokenName, 'inherit');

  @override
  Color get color => throw _e(tokenName, 'color');

  @override
  Color get backgroundColor => throw _e(tokenName, 'backgroundColor');

  @override
  double get fontSize => throw _e(tokenName, 'fontSize');

  @override
  FontWeight get fontWeight => throw _e(tokenName, 'fontWeight');

  @override
  FontStyle get fontStyle => throw _e(tokenName, 'fontStyle');

  @override
  double get letterSpacing => throw _e(tokenName, 'letterSpacing');

  @override
  double get wordSpacing => throw _e(tokenName, 'wordSpacing');

  @override
  TextBaseline get textBaseline => throw _e(tokenName, 'textBaseline');

  @override
  double get height => throw _e(tokenName, 'height');

  @override
  TextLeadingDistribution get leadingDistribution =>
      throw _e(tokenName, 'leadingDistribution');

  @override
  Locale get locale => throw _e(tokenName, 'locale');

  @override
  Paint get foreground => throw _e(tokenName, 'foreground');

  @override
  Paint get background => throw _e(tokenName, 'background');

  @override
  List<Shadow> get shadows => throw _e(tokenName, 'shadows');

  @override
  List<FontFeature> get fontFeatures => throw _e(tokenName, 'fontFeatures');

  @override
  List<FontVariation> get fontVariations =>
      throw _e(tokenName, 'fontVariations');

  @override
  TextDecoration get decoration => throw _e(tokenName, 'decoration');

  @override
  Color get decorationColor => throw _e(tokenName, 'decorationColor');

  @override
  TextDecorationStyle get decorationStyle =>
      throw _e(tokenName, 'decorationStyle');

  @override
  double get decorationThickness => throw _e(tokenName, 'decorationThickness');

  @override
  String get debugLabel => throw _e(tokenName, 'debugLabel');

  @override
  int get hashCode => tokenName.hashCode;
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
