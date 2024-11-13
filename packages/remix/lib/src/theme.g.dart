// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// MixableTokensGenerator
// **************************************************************************

class _$ColorTokensStruct {
  const _$ColorTokensStruct();

  final ColorToken primary = const ColorToken('primary');
  final ColorToken secondary = const ColorToken('secondary');
  final ColorToken tertiary = const ColorToken('tertiary');
}

const _structColorTokens = _$ColorTokensStruct();
Map<ColorToken, Color> _$ColorTokensToData(ColorTokens tokens) {
  return {
    _structColorTokens.primary: tokens.primary,
    _structColorTokens.secondary: tokens.secondary,
    _structColorTokens.tertiary: tokens.tertiary,
  };
}

extension $ColorTokensX<T extends Attribute> on ColorUtility<T> {
  T primary() => ref(_structColorTokens.primary);
  T secondary() => ref(_structColorTokens.secondary);
  T tertiary() => ref(_structColorTokens.tertiary);
}

extension $BuildContextColorTokensX on BuildContext {
  Color primary() => _structColorTokens.primary.resolve(this);
  Color secondary() => _structColorTokens.secondary.resolve(this);
  Color tertiary() => _structColorTokens.tertiary.resolve(this);
}

class _$TextTokensStruct {
  const _$TextTokensStruct();

  final TextStyleToken h1 = const TextStyleToken('h1');
  final TextStyleToken h2 = const TextStyleToken('h2');
  final TextStyleToken h3 = const TextStyleToken('h3');
  final TextStyleToken body = const TextStyleToken('body');
}

const _structTextTokens = _$TextTokensStruct();
Map<TextStyleToken, TextStyle> _$TextTokensToData(TextTokens tokens) {
  return {
    _structTextTokens.h1: tokens.h1,
    _structTextTokens.h2: tokens.h2,
    _structTextTokens.h3: tokens.h3,
    _structTextTokens.body: tokens.body,
  };
}

extension $TextTokensX<T extends Attribute> on TextStyleUtility<T> {
  T h1() => ref(_structTextTokens.h1);
  T h2() => ref(_structTextTokens.h2);
  T h3() => ref(_structTextTokens.h3);
  T body() => ref(_structTextTokens.body);
}

extension $BuildContextTextTokensX on BuildContext {
  TextStyle h1() => _structTextTokens.h1.resolve(this);
  TextStyle h2() => _structTextTokens.h2.resolve(this);
  TextStyle h3() => _structTextTokens.h3.resolve(this);
  TextStyle body() => _structTextTokens.body.resolve(this);
}

class _$RadiusTokensStruct {
  const _$RadiusTokensStruct();

  final RadiusToken small = const RadiusToken('small');
  final RadiusToken medium = const RadiusToken('medium');
  final RadiusToken large = const RadiusToken('large');
}

const _structRadiusTokens = _$RadiusTokensStruct();
Map<RadiusToken, Radius> _$RadiusTokensToData(RadiusTokens tokens) {
  return {
    _structRadiusTokens.small: tokens.small,
    _structRadiusTokens.medium: tokens.medium,
    _structRadiusTokens.large: tokens.large,
  };
}

extension $RadiusTokensX<T extends Attribute> on RadiusUtility<T> {
  T small() => ref(_structRadiusTokens.small);
  T medium() => ref(_structRadiusTokens.medium);
  T large() => ref(_structRadiusTokens.large);
}

extension $BuildContextRadiusTokensX on BuildContext {
  Radius small() => _structRadiusTokens.small.resolve(this);
  Radius medium() => _structRadiusTokens.medium.resolve(this);
  Radius large() => _structRadiusTokens.large.resolve(this);
}

class _$SpaceTokensStruct {
  const _$SpaceTokensStruct();

  final SpaceToken p8 = const SpaceToken('p8');

  final SpaceToken p16 = const SpaceToken('p16');

  final SpaceToken p24 = const SpaceToken('p24');
}

const _structSpaceTokens = _$SpaceTokensStruct();
Map<SpaceToken, double> _$SpaceTokensToData(SpaceTokens tokens) {
  return {
    _structSpaceTokens.p8: tokens.p8,
    _structSpaceTokens.p16: tokens.p16,
    _structSpaceTokens.p24: tokens.p24,
  };
}

extension $SpaceTokensX<T extends Attribute> on SpacingSideUtility<T> {
  T p8() => ref(_structSpaceTokens.p8);
  T p16() => ref(_structSpaceTokens.p16);
  T p24() => ref(_structSpaceTokens.p24);
}

extension $BuildContextSpaceTokensX on BuildContext {
  double p8() => _structSpaceTokens.p8.resolve(this);
  double p16() => _structSpaceTokens.p16.resolve(this);
  double p24() => _structSpaceTokens.p24.resolve(this);
}
