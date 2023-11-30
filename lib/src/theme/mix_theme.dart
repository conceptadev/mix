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

  Color colorToken(BuildContext context, ColorToken token) {
    return colors(token, context);
  }

  Color colorRef(BuildContext context, ColorRef ref) => ref.resolve(context);

  Radius radiiToken(BuildContext context, RadiusToken token) {
    return radii(token, context);
  }

  Radius radiiRef(BuildContext context, RadiusRef ref) => ref.resolve(context);

  TextStyle textStyleToken(BuildContext context, TextStyleToken token) {
    return textStyles(token, context);
  }

  TextStyle textStyleRef(BuildContext context, TextStyleRef ref) =>
      ref.resolve(context);

  double spaceTokenRef(BuildContext context, SpaceRef value) {
    if (value >= 0) return value;
    final token = space.findByValue(value);

    return token == null ? 0.0 : spaceToken(context, token);
  }

  double spaceToken(BuildContext context, SpaceToken token) {
    final value = space(token, context);

    return value >= 0 ? value : token.value;
  }

  @override
  get props => [space, breakpoints, colors, textStyles, radii];
}

class MixTokenResolver {
  final BuildContext _context;
  final MixThemeData _theme;

  const MixTokenResolver(this._context, this._theme);

  Color colorToken(ColorToken token) {
    return _theme.colors(token, _context);
  }

  Color colorRef(ColorRef ref) => ref.resolve(_context);

  Radius radiiToken(RadiusToken token) {
    return _theme.radii(token, _context);
  }

  Radius radiiRef(RadiusRef ref) => ref.resolve(_context);

  TextStyle textStyleToken(TextStyleToken token) {
    return _theme.textStyles(token, _context);
  }

  TextStyle textStyleRef(TextStyleRef ref) => ref.resolve(_context);

  double spaceTokenRef(SpaceRef value) {
    if (value >= 0) return value;
    final token = _theme.space.findByValue(value);

    return token == null ? 0.0 : spaceToken(_context, token);
  }

  double spaceToken(BuildContext context, SpaceToken token) {
    return _theme.space(token, context);
  }
}
