import 'package:flutter/material.dart';

import '../core/equality/compare_mixin.dart';
import '../helpers/extensions/iterable_ext.dart';
import 'tokens/breakpoints.dart';
import 'tokens/mix_token.dart';
import 'tokens/refs.dart';
import 'tokens/space_token.dart';

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
  final DesignTokenMap<SpaceToken, double> space;

  final DesignTokenMap<BreakpointToken, BreakpointConstraint> breakpoints;
  final DesignTokenMap<ColorToken, Color> colors;

  final DesignTokenMap<TextStyleToken, TextStyle> textStyles;
  final DesignTokenMap<RadiusToken, Radius> radii;

  const MixThemeData.raw({
    required this.breakpoints,
    required this.colors,
    required this.space,
    required this.textStyles,
    required this.radii,
  });

  const MixThemeData.empty()
      : this.raw(
          breakpoints: const {},
          colors: const {},
          space: const {},
          textStyles: const {},
          radii: const {},
        );

  factory MixThemeData({
    DesignTokenMap<BreakpointToken, BreakpointConstraint>? breakpoints,
    DesignTokenMap<ColorToken, Color>? colors,
    DesignTokenMap<SpaceToken, double>? space,
    DesignTokenMap<TextStyleToken, TextStyle>? textStyles,
    DesignTokenMap<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      breakpoints: {..._defaultBreakpoints, ...?breakpoints},
      colors: {...?colors},
      space: {..._defaultSpace, ...?space},
      textStyles: {...?textStyles},
      radii: {...?radii},
    );
  }

  MixThemeData copyWith({
    DesignTokenMap<BreakpointToken, BreakpointConstraint>? breakpoints,
    DesignTokenMap<ColorToken, Color>? colors,
    DesignTokenMap<SpaceToken, double>? space,
    DesignTokenMap<TextStyleToken, TextStyle>? textStyles,
    DesignTokenMap<RadiusToken, Radius>? radii,
  }) {
    return MixThemeData.raw(
      breakpoints: breakpoints ?? this.breakpoints,
      colors: colors ?? this.colors,
      space: space ?? this.space,
      textStyles: textStyles ?? this.textStyles,
      radii: radii ?? this.radii,
    );
  }

  @override
  get props => [space, breakpoints, colors, textStyles, radii];
}

final DesignTokenMap<SpaceToken, double> _defaultSpace = {
  SpaceToken.xsmall: (context) => 4.0,
  SpaceToken.small: (context) => 8.0,
  SpaceToken.medium: (context) => 16.0,
  SpaceToken.large: (context) => 24.0,
  SpaceToken.xlarge: (context) => 36.0,
  SpaceToken.xxlarge: (context) => 72.0,
};

final DesignTokenMap<BreakpointToken, BreakpointConstraint>
    _defaultBreakpoints = {
  BreakpointToken.xsmall: (context) =>
      const BreakpointConstraint(maxWidth: 599),
  BreakpointToken.small: (context) =>
      const BreakpointConstraint(minWidth: 600, maxWidth: 1023),
  BreakpointToken.medium: (context) =>
      const BreakpointConstraint(minWidth: 1024, maxWidth: 1439),
  BreakpointToken.large: (context) =>
      const BreakpointConstraint(minWidth: 1440, maxWidth: double.infinity),
};

class MixTokenResolver {
  final BuildContext context;

  const MixTokenResolver(this.context);

  MixThemeData get _theme => MixTheme.of(context);

  Color colorToken(ColorToken token) {
    final color = _theme.colors[token]?.call(context);

    if (color != null) return color;

    if (token is ColorTokenResolver) {
      return token.resolve(context);
    }

    assert(color != null, 'Color token $token is not defined in Mix Theme');

    return color ?? Colors.transparent;
  }

  Radius radiiToken(RadiusToken token) {
    final radius = _theme.radii[token]?.call(context);

    if (radius != null) return radius;

    if (token is RadiusTokenResolver) {
      return token.resolve(context);
    }

    assert(
      radius != null,
      'Radii token $token is not defined in Mix Themem or it needs to have a token resolver',
    );

    return radius ?? Radius.zero;
  }

  TextStyle textStyleToken(TextStyleToken token) {
    final style = _theme.textStyles[token]?.call(context);
    if (style != null) return style;

    if (token is TextStyleTokenResolver) {
      return token.resolve(context);
    }

    assert(style != null, 'TextStyle token $token is not defined in Mix Theme');

    return style ?? const TextStyle();
  }

  double spaceToken(SpaceToken token) {
    final space = _theme.space[token]?.call(context);

    if (space != null) return space;

    assert(space != null, 'Spacetoken $token is not defined in Mix Theme');

    return space ?? 0;
  }

  double spaceTokenRef(double value) {
    final token = _theme.space.keys.firstWhereOrNull(
      (key) => key() == value,
    );

    return token == null ? value : spaceToken(token);
  }
}
