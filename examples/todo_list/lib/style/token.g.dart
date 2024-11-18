// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// MixableTokensGenerator
// **************************************************************************

class _$MyThemeColorTokenStruct {
  _$MyThemeColorTokenStruct();

  final ColorToken primary = const ColorToken('primary');
  final ColorToken onPrimary = const ColorToken('onPrimary');
  final ColorToken onSurface = const ColorToken('onSurface');
  final ColorSwatchToken onSurfaceVariant =
      ColorSwatchToken.scale('onSurfaceVariant', 12);
  final ColorToken surface = const ColorToken('surface');
}

final _structMyThemeColorToken = _$MyThemeColorTokenStruct();

Map<ColorToken, Color> _$MyThemeColorTokenToMap(MyThemeColorToken tokens) {
  return {
    _structMyThemeColorToken.primary: tokens.primary,
    _structMyThemeColorToken.onPrimary: tokens.onPrimary,
    _structMyThemeColorToken.surface: tokens.surface,
    _structMyThemeColorToken.onSurface: tokens.onSurface,
    _structMyThemeColorToken.onSurfaceVariant: tokens.onSurfaceVariant,
  };
}

extension $MyThemeColorTokenColorUtilityX<T extends Attribute>
    on ColorUtility<T> {
  primary() => ref(_structMyThemeColorToken.primary);
  onPrimary() => ref(_structMyThemeColorToken.onPrimary);
  onSurface() => ref(_structMyThemeColorToken.onSurface);
  onSurfaceVariant([int step = 1]) =>
      ref(_structMyThemeColorToken.onSurfaceVariant[step]);
  surface() => ref(_structMyThemeColorToken.surface);
  toMap() => ref(_structMyThemeColorToken.toMap);
}

class BuildContextMyThemeColorTokenMethods {
  const BuildContextMyThemeColorTokenMethods(this.context);

  final BuildContext context;
  primary() => _structMyThemeColorToken.primary.resolve(context);
  onPrimary() => _structMyThemeColorToken.onPrimary.resolve(context);
  onSurface() => _structMyThemeColorToken.onSurface.resolve(context);
  onSurfaceVariant([int step = 1]) =>
      _structMyThemeColorToken.onSurfaceVariant[step].resolve(context);
  surface() => _structMyThemeColorToken.surface.resolve(context);
  toMap() => _structMyThemeColorToken.toMap.resolve(context);
}

extension $BuildContextMyThemeColorTokenX on BuildContext {
  BuildContextMyThemeColorTokenMethods get $c =>
      BuildContextMyThemeColorTokenMethods(this);
}

class _$MyThemeTextStyleTokenStruct {
  _$MyThemeTextStyleTokenStruct();

  final TextStyleToken headline1 = const TextStyleToken('headline1');
  final TextStyleToken headline2 = const TextStyleToken('headline2');
  final TextStyleToken headline3 = const TextStyleToken('headline3');
  final TextStyleToken body = const TextStyleToken('body');
  final TextStyleToken callout = const TextStyleToken('callout');
}

final _structMyThemeTextStyleToken = _$MyThemeTextStyleTokenStruct();

Map<TextStyleToken, TextStyle> _$MyThemeTextStyleTokenToMap(
    MyThemeTextStyleToken tokens) {
  return {
    _structMyThemeTextStyleToken.headline1: tokens.headline1,
    _structMyThemeTextStyleToken.headline2: tokens.headline2,
    _structMyThemeTextStyleToken.headline3: tokens.headline3,
    _structMyThemeTextStyleToken.body: tokens.body,
    _structMyThemeTextStyleToken.callout: tokens.callout,
  };
}

class _$MyThemeRadiusTokenStruct {
  _$MyThemeRadiusTokenStruct();

  final RadiusToken large = const RadiusToken('large');
  final RadiusToken medium = const RadiusToken('medium');
}

final _structMyThemeRadiusToken = _$MyThemeRadiusTokenStruct();

Map<RadiusToken, Radius> _$MyThemeRadiusTokenToMap(MyThemeRadiusToken tokens) {
  return {
    _structMyThemeRadiusToken.large: tokens.large,
    _structMyThemeRadiusToken.medium: tokens.medium,
  };
}

extension $MyThemeRadiusTokenRadiusUtilityX<T extends Attribute>
    on RadiusUtility<T> {
  large() => ref(_structMyThemeRadiusToken.large);
  medium() => ref(_structMyThemeRadiusToken.medium);
  toMap() => ref(_structMyThemeRadiusToken.toMap);
}

class BuildContextMyThemeRadiusTokenMethods {
  const BuildContextMyThemeRadiusTokenMethods(this.context);

  final BuildContext context;
  large() => _structMyThemeRadiusToken.large.resolve(context);
  medium() => _structMyThemeRadiusToken.medium.resolve(context);
  toMap() => _structMyThemeRadiusToken.toMap.resolve(context);
}

extension $BuildContextMyThemeRadiusTokenX on BuildContext {
  BuildContextMyThemeRadiusTokenMethods get $radius =>
      BuildContextMyThemeRadiusTokenMethods(this);
}

class _$MyThemeSpaceTokenStruct {
  _$MyThemeSpaceTokenStruct();

  final SpaceToken medium = const SpaceToken('medium');
  final SpaceToken large = const SpaceToken('large');
}

final _structMyThemeSpaceToken = _$MyThemeSpaceTokenStruct();

Map<SpaceToken, double> _$MyThemeSpaceTokenToMap(MyThemeSpaceToken tokens) {
  return {
    _structMyThemeSpaceToken.medium: tokens.medium,
    _structMyThemeSpaceToken.large: tokens.large,
  };
}

extension $MyThemeSpaceTokenSpacingSideUtilityX<T extends Attribute>
    on SpacingSideUtility<T> {
  medium() => ref(_structMyThemeSpaceToken.medium);
  large() => ref(_structMyThemeSpaceToken.large);
  toMap() => ref(_structMyThemeSpaceToken.toMap);
}

extension $MyThemeSpaceTokenGapUtilityX<T extends Attribute> on GapUtility<T> {
  medium() => ref(_structMyThemeSpaceToken.medium);
  large() => ref(_structMyThemeSpaceToken.large);
  toMap() => ref(_structMyThemeSpaceToken.toMap);
}

class BuildContextMyThemeSpaceTokenMethods {
  const BuildContextMyThemeSpaceTokenMethods(this.context);

  final BuildContext context;
  medium() => _structMyThemeSpaceToken.medium.resolve(context);
  large() => _structMyThemeSpaceToken.large.resolve(context);
  toMap() => _structMyThemeSpaceToken.toMap.resolve(context);
}

extension $BuildContextMyThemeSpaceTokenX on BuildContext {
  BuildContextMyThemeSpaceTokenMethods get $space =>
      BuildContextMyThemeSpaceTokenMethods(this);
}
