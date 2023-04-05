import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../mix.dart';
import '../helpers/equality_mixin/equality_mixin.dart';
import 'tokens/breakpoints.dart';
import 'tokens/mix_token.dart';
import 'tokens/radii_token.dart';

class MixTheme extends InheritedWidget {
  const MixTheme({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final MixThemeData data;

  static MixThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data ??
        MixThemeData();
  }

  static MixThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data;
  }

  @override
  bool updateShouldNotify(MixTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class MixThemeData with EqualityMixin {
  final MixSpaceTokens space;
  late MixSpaceTokensReference spaceRef;
  final MixBreakpointsTokens breakpoints;

  final MixColorTokens colors;
  final MixTextStyleTokens textStyles;

  MixThemeData.raw({
    required this.space,
    required this.breakpoints,
    required this.colors,
    required this.textStyles,
  }) {
    // Creates a refernece map of the tokens
    spaceRef = space.map((key, value) => MapEntry(key.ref, key));
  }

  factory MixThemeData({
    MixSpaceTokens? space,
    MixBreakpointsTokens? breakpoints,
    MixColorTokens? colors,
    MixTextStyleTokens? textStyles,
  }) {
    return MixThemeData.raw(
      space: {...?space, ...SpaceTokens.tokens},
      breakpoints: breakpoints ?? const MixBreakpointsTokens(),
      colors: {...?colors, ...$MDColorScheme.tokens},
      textStyles: {...?textStyles, ...$M3Text.tokens, ...$M2Text.tokens},
    );
  }

  MixThemeData copyWith({
    MixSpaceTokens? space,
    MixBreakpointsTokens? breakpoints,
    MixRadiiTokens? radii,
    MixColorTokens? colors,
    MixTextStyleTokens? textStyles,
  }) {
    return MixThemeData.raw(
      space: {...this.space, ...?space},
      breakpoints: breakpoints ?? this.breakpoints,
      colors: {...this.colors, ...?colors},
      textStyles: {...this.textStyles, ...?textStyles},
    );
  }

  @override
  get props => [space, breakpoints, colors, textStyles];
}

class MixTokenResolver {
  final BuildContext context;

  MixTokenResolver(this.context);

  MixThemeData get theme => MixTheme.of(context);

  Color color(ColorToken token) {
    final color = theme.colors[token]?.call(context);

    if (color == null) {
      throw Exception('Color token $token is not defined in Mix Theme');
    }

    return color;
  }

  TextStyle textStyle(TextStyleToken token) {
    final style = theme.textStyles[token]?.call(context);

    if (style == null) {
      throw Exception('TextStyle token $token is not defined in Mix Theme');
    }

    return style;
  }

  double space(double value) {
    final mixTheme = theme;

    // Check if value is a reference
    final token = mixTheme.spaceRef[value];

    // if value is not a reference return value
    if (token == null) {
      return value;
    }

    final space = mixTheme.space[token]?.call(context);

    if (space == null) {
      throw Exception('Spacetoken $token is not defined in Mix Theme');
    }

    return space;
  }
}
