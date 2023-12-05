import 'package:flutter/material.dart';

import '../helpers/compare_mixin.dart';
import 'tokens/breakpoints.dart';
import 'tokens/color_token.dart';
import 'tokens/mix_token.dart';
import 'tokens/radius_token.dart';
import 'tokens/space_token.dart';
import 'tokens/text_style_token.dart';

class MixTheme extends InheritedWidget {
  const MixTheme({required super.child, required this.data, super.key});

  static MixThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data ??
        MixThemeData();
  }

  static MixThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data;
  }

  final MixThemeData data;

  @override
  bool updateShouldNotify(MixTheme oldWidget) => data != oldWidget.data;
}

@immutable
class MixThemeData with Comparable {
  final StyledTokens<RadiusToken, Radius> radii;
  final StyledTokens<ColorToken, Color> colors;
  final StyledTokens<TextStyleToken, TextStyle> textStyles;
  final StyledTokens<BreakpointToken, BreakpointConstraint> breakpoints;
  final StyledTokens<SpaceToken, double> space;

  const MixThemeData.raw({
    required this.breakpoints,
    required this.colors,
    required this.textStyles,
    required this.radii,
    required this.space,
  });

  const MixThemeData.empty()
      : this.raw(
          breakpoints: const StyledTokens.empty(),
          colors: const StyledTokens.empty(),
          textStyles: const StyledTokens.empty(),
          radii: const StyledTokens.empty(),
          space: const StyledTokens.empty(),
        );

  factory MixThemeData({
    StyledTokens<BreakpointToken, BreakpointConstraint>? breakpoints,
    StyledTokens<ColorToken, Color>? colors,
    StyledTokens<SpaceToken, double>? space,
    StyledTokens<TextStyleToken, TextStyle>? textStyles,
    StyledTokens<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      breakpoints: breakpoints ?? const StyledTokens.empty(),
      colors: colors ?? const StyledTokens.empty(),
      textStyles: textStyles ?? const StyledTokens.empty(),
      radii: radii ?? const StyledTokens.empty(),
      space: space ?? const StyledTokens.empty(),
    );
  }

  factory MixThemeData.tokenMap({
    TokenMap<BreakpointToken, BreakpointConstraint>? breakpoints,
    TokenMap<ColorToken, Color>? colors,
    TokenMap<SpaceToken, double>? space,
    TokenMap<TextStyleToken, TextStyle>? textStyles,
    TokenMap<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      breakpoints: StyledTokens(breakpoints ?? const {}),
      colors: StyledTokens(colors ?? const {}),
      textStyles: StyledTokens(textStyles ?? const {}),
      radii: StyledTokens(radii ?? const {}),
      space: StyledTokens(space ?? const {}),
    );
  }

  MixThemeData copyWith({
    StyledTokens<BreakpointToken, BreakpointConstraint>? breakpoints,
    StyledTokens<ColorToken, Color>? colors,
    StyledTokens<SpaceToken, double>? space,
    StyledTokens<TextStyleToken, TextStyle>? textStyles,
    StyledTokens<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      breakpoints: breakpoints ?? this.breakpoints,
      colors: colors ?? this.colors,
      textStyles: textStyles ?? this.textStyles,
      radii: radii ?? this.radii,
      space: space ?? this.space,
    );
  }

  @override
  get props => [space, breakpoints, colors, textStyles, radii];
}

class MixTokenResolver {
  final BuildContext _context;
  final MixThemeData _theme;

  const MixTokenResolver(this._context, this._theme);

  StyledTokens<ColorToken, Color> get _colors => _theme.colors;
  StyledTokens<SpaceToken, double> get _space => _theme.space;
  StyledTokens<TextStyleToken, TextStyle> get _textStyles => _theme.textStyles;
  StyledTokens<RadiusToken, Radius> get _radii => _theme.radii;
  StyledTokens<BreakpointToken, BreakpointConstraint> get _breakpoints =>
      _theme.breakpoints;

  Color colorToken(ColorToken token) {
    final value = _colors.getTokenValue(token);

    return value is ColorResolver ? value.resolve(_context) : value;
  }

  Color colorRef(ColorRef ref) => colorToken(ref.token);

  Radius radiiToken(RadiusToken token) {
    final value = _radii.getTokenValue(token);

    return value is RadiusResolver ? value.resolve(_context) : value;
  }

  Radius radiiRef(RadiusRef ref) => radiiToken(ref.token);

  TextStyle textStyleToken(TextStyleToken token) {
    final value = _textStyles.getTokenValue(token);

    return value is TextStyleResolver ? value.resolve(_context) : value;
  }

  TextStyle textStyleRef(TextStyleRef ref) => textStyleToken(ref.token);

  double spaceToken(SpaceToken token) => _space.getTokenValue(token);

  double spaceTokenRef(SpaceRef value) {
    if (value >= 0) return value;

    return _space.findByValue(value)?.value ?? 0.0;
  }

  BreakpointConstraint breakpointToken(BreakpointToken token) {
    return _breakpoints.getTokenValue(token);
  }
}
