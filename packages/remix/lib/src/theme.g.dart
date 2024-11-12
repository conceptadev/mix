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

const _tokens = _$ColorTokensStruct();
Map<ColorToken, Color> _$TokensToData(ColorTokens tokens) {
  return {
    _tokens.primary: tokens.primary,
    _tokens.secondary: tokens.secondary,
    _tokens.tertiary: tokens.tertiary,
  };
}

extension $ColorTokensX<T extends Attribute> on ColorUtility<T> {
  T primary() => ref(_tokens.primary);
  T secondary() => ref(_tokens.secondary);
  T tertiary() => ref(_tokens.tertiary);
}

extension $BuildContextColorTokensX on BuildContext {
  Color primary() => _tokens.primary.resolve(this);
  Color secondary() => _tokens.secondary.resolve(this);
  Color tertiary() => _tokens.tertiary.resolve(this);
}
