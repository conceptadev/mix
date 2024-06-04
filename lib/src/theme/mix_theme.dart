import 'package:flutter/material.dart';

import '../helpers/compare_mixin.dart';
import 'material/material_theme.dart';
import 'tokens/breakpoints_token.dart';
import 'tokens/color_token.dart';
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
class MixThemeData with EqualityMixin {
  final StyledTokens<RadiusToken, Radius> radii;
  final StyledTokens<ColorToken, Color> colors;
  final StyledTokens<TextStyleToken, TextStyle> textStyles;
  final StyledTokens<BreakpointToken, Breakpoint> breakpoints;
  final StyledTokens<SpaceToken, double> spaces;

  const MixThemeData.raw({
    required this.textStyles,
    required this.colors,
    required this.breakpoints,
    required this.radii,
    required this.spaces,
  });

  const MixThemeData.empty()
      : this.raw(
          textStyles: const StyledTokens.empty(),
          colors: const StyledTokens.empty(),
          breakpoints: const StyledTokens.empty(),
          radii: const StyledTokens.empty(),
          spaces: const StyledTokens.empty(),
        );

  factory MixThemeData({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? spaces,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      textStyles: StyledTokens(textStyles ?? const {}),
      colors: StyledTokens(colors ?? const {}),
      breakpoints:
          _breakpointTokenMap.merge(StyledTokens(breakpoints ?? const {})),
      radii: StyledTokens(radii ?? const {}),
      spaces: StyledTokens(spaces ?? const {}),
    );
  }

  factory MixThemeData.withMaterial({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? spaces,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
  }) {
    return materialMixTheme.merge(
      MixThemeData(
        breakpoints: breakpoints,
        colors: colors,
        spaces: spaces,
        textStyles: textStyles,
        radii: radii,
      ),
    );
  }

  MixThemeData copyWith({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? spaces,
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
      spaces: spaces == null ? this.spaces : StyledTokens(spaces),
    );
  }

  MixThemeData merge(MixThemeData other) {
    return MixThemeData.raw(
      textStyles: textStyles.merge(other.textStyles),
      colors: colors.merge(other.colors),
      breakpoints: breakpoints.merge(other.breakpoints),
      radii: radii.merge(other.radii),
      spaces: spaces.merge(other.spaces),
    );
  }

  @override
  get props => [spaces, breakpoints, colors, textStyles, radii];
}

final _breakpointTokenMap = StyledTokens({
  BreakpointToken.xsmall: const Breakpoint(maxWidth: 599),
  BreakpointToken.small: const Breakpoint(minWidth: 600, maxWidth: 1023),
  BreakpointToken.medium: const Breakpoint(minWidth: 1024, maxWidth: 1439),
  BreakpointToken.large:
      const Breakpoint(minWidth: 1440, maxWidth: double.infinity),
});
