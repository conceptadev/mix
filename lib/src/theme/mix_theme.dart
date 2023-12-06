// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';

import '../helpers/compare_mixin.dart';
import 'tokens/breakpoints_token.dart';
import 'tokens/color_token.dart';
import 'tokens/material_tokens.dart';
import 'tokens/mix_token.dart';
import 'tokens/radius_token.dart';
import 'tokens/space_token.dart';
import 'tokens/text_style_token.dart';

class MixTheme extends InheritedWidget {
  const MixTheme({required super.child, required this.data, super.key});

  static MixThemeData of(BuildContext context) {
    final themeData =
        context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data;

    assert(themeData != null, 'No MixTheme found in context');

    return themeData!;
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
  final StyledTokens<BreakpointToken, Breakpoint> breakpoints;
  final StyledTokens<SpaceToken, double> space;

  const MixThemeData.raw({
    required this.textStyles,
    required this.colors,
    required this.breakpoints,
    required this.radii,
    required this.space,
  });

  const MixThemeData.empty()
      : this.raw(
          textStyles: const StyledTokens.empty(),
          colors: const StyledTokens.empty(),
          breakpoints: const StyledTokens.empty(),
          radii: const StyledTokens.empty(),
          space: const StyledTokens.empty(),
        );

  factory MixThemeData({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? space,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      textStyles: StyledTokens(textStyles ?? const {}),
      colors: StyledTokens(colors ?? const {}),
      breakpoints:
          _breakpointTokenMap.merge(StyledTokens(breakpoints ?? const {})),
      radii: _radiusTokenMap.merge(StyledTokens(radii ?? const {})),
      space: _spaceTokenMap.merge(StyledTokens(space ?? const {})),
    );
  }

  factory MixThemeData.withMaterialTokens({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? space,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
  }) {
    return materialMixTheme.merge(
      MixThemeData(
        breakpoints: breakpoints,
        colors: colors,
        space: space,
        textStyles: textStyles,
        radii: radii,
      ),
    );
  }

  MixThemeData copyWith({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? space,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      textStyles:
          textStyles == null ? this.textStyles : StyledTokens(textStyles),
      colors: colors == null ? this.colors : StyledTokens(colors),
      breakpoints:
          breakpoints == null ? this.breakpoints : StyledTokens(breakpoints),
      radii: radii == null ? this.radii : StyledTokens(radii),
      space: space == null ? this.space : StyledTokens(space),
    );
  }

  MixThemeData merge(MixThemeData other) {
    return MixThemeData.raw(
      textStyles: textStyles.merge(other.textStyles),
      colors: colors.merge(other.colors),
      breakpoints: breakpoints.merge(other.breakpoints),
      radii: radii.merge(other.radii),
      space: space.merge(other.space),
    );
  }

  @override
  get props => [space, breakpoints, colors, textStyles, radii];
}

final _spaceTokenMap = StyledTokens({
  SpaceToken.xsmall: 4.0,
  SpaceToken.small: 8.0,
  SpaceToken.medium: 16.0,
  SpaceToken.large: 24.0,
  SpaceToken.xlarge: 32.0,
  SpaceToken.xxlarge: 40.0,
});

final _radiusTokenMap = StyledTokens({
  RadiusToken.small: const Radius.circular(4),
  RadiusToken.medium: const Radius.circular(8),
  RadiusToken.large: const Radius.circular(16),
});

final _breakpointTokenMap = StyledTokens({
  BreakpointToken.xsmall: const Breakpoint(maxWidth: 599),
  BreakpointToken.small: const Breakpoint(minWidth: 600, maxWidth: 1023),
  BreakpointToken.medium: const Breakpoint(minWidth: 1024, maxWidth: 1439),
  BreakpointToken.large:
      const Breakpoint(minWidth: 1440, maxWidth: double.infinity),
});

class MixTokenResolver {
  final BuildContext _context;

  const MixTokenResolver(this._context);

  Color colorToken(ColorToken token) => token.resolve(_context);

  Color colorRef(ColorRef ref) => colorToken(ref.token);

  Radius radiiToken(RadiusToken token) => token.resolve(_context);

  Radius radiiRef(RadiusRef ref) => radiiToken(ref.token);

  TextStyle textStyleToken(TextStyleToken token) => token.resolve(_context);

  TextStyle textStyleRef(TextStyleRef ref) => textStyleToken(ref.token);

  double spaceToken(SpaceToken token) => token.resolve(_context);

  double spaceTokenRef(SpaceRef spaceRef) {
    return spaceRef < 0 ? spaceRef.resolve(_context) : spaceRef;
  }

  Breakpoint breakpointToken(BreakpointToken token) => token.resolve(_context);
}
