// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// MixableTokensGenerator
// **************************************************************************

class _$ColorTokensStruct {
  _$ColorTokensStruct();

  final ColorToken primary = const ColorToken('primary');
  final ColorToken secondary = const ColorToken('secondary');
  final ColorToken tertiary = const ColorToken('tertiary');
}

final _structColorTokens = _$ColorTokensStruct();

Map<ColorToken, Color> _$ColorTokensToMap(ColorTokens tokens) {
  return {
    _structColorTokens.primary: tokens.primary,
    _structColorTokens.secondary: tokens.secondary,
    _structColorTokens.tertiary: tokens.tertiary,
  };
}

extension $ColorTokensColorUtilityX<T extends Attribute> on ColorUtility<T> {
  T $primary() => ref(_structColorTokens.primary);
  T $secondary() => ref(_structColorTokens.secondary);
  T $tertiary() => ref(_structColorTokens.tertiary);
}

class BuildContextColorTokensMethods {
  const BuildContextColorTokensMethods(this.context);

  final BuildContext context;
  Color primary() => _structColorTokens.primary.resolve(context);
  Color secondary() => _structColorTokens.secondary.resolve(context);
  Color tertiary() => _structColorTokens.tertiary.resolve(context);
}

extension $BuildContextColorTokensX on BuildContext {
  BuildContextColorTokensMethods get $color =>
      BuildContextColorTokensMethods(this);
}

class _$TextTokensStruct {
  _$TextTokensStruct();

  final TextStyleToken h1 = const TextStyleToken('h1');
  final TextStyleToken h2 = const TextStyleToken('h2');
  final TextStyleToken h3 = const TextStyleToken('h3');
  final TextStyleToken body = const TextStyleToken('body');
}

final _structTextTokens = _$TextTokensStruct();

Map<TextStyleToken, TextStyle> _$TextTokensToMap(TextTokens tokens) {
  return {
    _structTextTokens.h1: tokens.h1,
    _structTextTokens.h2: tokens.h2,
    _structTextTokens.h3: tokens.h3,
    _structTextTokens.body: tokens.body,
  };
}

extension $TextTokensTextStyleUtilityX<T extends Attribute>
    on TextStyleUtility<T> {
  T $h1() => ref(_structTextTokens.h1);
  T $h2() => ref(_structTextTokens.h2);
  T $h3() => ref(_structTextTokens.h3);
  T $body() => ref(_structTextTokens.body);
}

class BuildContextTextTokensMethods {
  const BuildContextTextTokensMethods(this.context);

  final BuildContext context;
  TextStyle h1() => _structTextTokens.h1.resolve(context);
  TextStyle h2() => _structTextTokens.h2.resolve(context);
  TextStyle h3() => _structTextTokens.h3.resolve(context);
  TextStyle body() => _structTextTokens.body.resolve(context);
}

extension $BuildContextTextTokensX on BuildContext {
  BuildContextTextTokensMethods get $textStyle =>
      BuildContextTextTokensMethods(this);
}

class _$RadiusTokensStruct {
  _$RadiusTokensStruct();

  final RadiusToken small = const RadiusToken('small');
  final RadiusToken medium = const RadiusToken('medium');
  final RadiusToken large = const RadiusToken('large');
}

final _structRadiusTokens = _$RadiusTokensStruct();

Map<RadiusToken, Radius> _$RadiusTokensToMap(RadiusTokens tokens) {
  return {
    _structRadiusTokens.small: tokens.small,
    _structRadiusTokens.medium: tokens.medium,
    _structRadiusTokens.large: tokens.large,
  };
}

extension $RadiusTokensRadiusUtilityX<T extends Attribute> on RadiusUtility<T> {
  T $small() => ref(_structRadiusTokens.small);
  T $medium() => ref(_structRadiusTokens.medium);
  T $large() => ref(_structRadiusTokens.large);
}

class BuildContextRadiusTokensMethods {
  const BuildContextRadiusTokensMethods(this.context);

  final BuildContext context;
  Radius small() => _structRadiusTokens.small.resolve(context);
  Radius medium() => _structRadiusTokens.medium.resolve(context);
  Radius large() => _structRadiusTokens.large.resolve(context);
}

extension $BuildContextRadiusTokensX on BuildContext {
  BuildContextRadiusTokensMethods get $radius =>
      BuildContextRadiusTokensMethods(this);
}

class _$SpaceTokensStruct {
  _$SpaceTokensStruct();

  final SpaceToken p8 = const SpaceToken('p8');
  final SpaceToken p16 = const SpaceToken('p16');
  final SpaceToken p24 = const SpaceToken('p24');
}

final _structSpaceTokens = _$SpaceTokensStruct();

Map<SpaceToken, double> _$SpaceTokensToMap(SpaceTokens tokens) {
  return {
    _structSpaceTokens.p8: tokens.p8,
    _structSpaceTokens.p16: tokens.p16,
    _structSpaceTokens.p24: tokens.p24,
  };
}

extension $SpaceTokensSpacingSideUtilityX<T extends Attribute>
    on SpacingSideUtility<T> {
  T $p8() => ref(_structSpaceTokens.p8);
  T $p16() => ref(_structSpaceTokens.p16);
  T $p24() => ref(_structSpaceTokens.p24);
}

extension $SpaceTokensGapUtilityX<T extends Attribute> on GapUtility<T> {
  T $p8() => ref(_structSpaceTokens.p8);
  T $p16() => ref(_structSpaceTokens.p16);
  T $p24() => ref(_structSpaceTokens.p24);
}

class BuildContextSpaceTokensMethods {
  const BuildContextSpaceTokensMethods(this.context);

  final BuildContext context;
  double p8() => _structSpaceTokens.p8.resolve(context);
  double p16() => _structSpaceTokens.p16.resolve(context);
  double p24() => _structSpaceTokens.p24.resolve(context);
}

extension $BuildContextSpaceTokensX on BuildContext {
  BuildContextSpaceTokensMethods get $space =>
      BuildContextSpaceTokensMethods(this);
}
