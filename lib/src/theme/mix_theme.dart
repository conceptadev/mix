import 'package:flutter/material.dart';

import '../core/equality/compare_mixin.dart';
import 'tokens/breakpoints.dart';
import 'tokens/color_token.dart';
import 'tokens/mix_token.dart';
import 'tokens/radius_token.dart';
import 'tokens/space_token.dart';
import 'tokens/text_style_token.dart';

class MixTheme extends InheritedWidget {
  const MixTheme({required Widget child, required this.data, Key? key})
      : super(key: key, child: child);

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
  final BuildContext context;

  const MixTokenResolver(this.context);

  MixThemeData get _theme => MixTheme.of(context);

  Color colorToken(ColorToken token) {
    final value = _theme.colors(token, context);

    return value is ColorRef ? colorRef(value) : value;
  }

  Color colorRef(ColorRef ref) => ref.resolve(context);

  Radius radiiToken(RadiusToken token) {
    final value = _theme.radii(token, context);

    return value is RadiusRef ? value.resolve(context) : value;
  }

  Radius radiiRef(RadiusRef ref) => ref.resolve(context);

  TextStyle textStyleToken(TextStyleToken token) {
    final value = _theme.textStyles(token, context);

    return value is TextStyleRef ? textStyleRef(value) : value;
  }

  TextStyle textStyleRef(TextStyleRef ref) => ref.resolve(context);

  double spaceTokenRef(SpaceRef value) {
    if (value >= 0) return value;
    final token = _theme.space.findByValue(value);

    return token == null ? 0.0 : spaceToken(token);
  }

  double spaceToken(SpaceToken token) {
    final value = _theme.space(token, context);

    return value >= 0 ? value : token.value;
  }
}
