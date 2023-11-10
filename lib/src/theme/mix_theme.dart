import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/equality/compare_mixin.dart';
import 'material_theme/color_scheme_tokens.dart';
import 'material_theme/text_theme_tokens.dart';
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
  bool updateShouldNotify(MixTheme oldWidget) {
    return data != oldWidget.data;
  }
}

@immutable
class MixThemeData with Comparable {
  final DesignTokenMap<SpaceToken, double> space;

  final MixBreakpointsTokens breakpoints;

  final DesignTokenMap<ColorRef, Color> colors;
  final DesignTokenMap<TextStyleRef, TextStyle> textStyles;

  const MixThemeData.raw({
    required this.breakpoints,
    required this.colors,
    required this.space,
    required this.textStyles,
  });

  const MixThemeData.empty()
      : this.raw(
          breakpoints: const MixBreakpointsTokens(),
          colors: const {},
          space: const {},
          textStyles: const {},
        );

  factory MixThemeData({
    MixBreakpointsTokens? breakpoints,
    DesignTokenMap<ColorRef, Color>? colors,
    DesignTokenMap<SpaceToken, double>? space,
    DesignTokenMap<TextStyleRef, TextStyle>? textStyles,
  }) {
    return MixThemeData.raw(
      breakpoints: breakpoints ?? const MixBreakpointsTokens(),
      colors: {...?colors, ...$MDColorScheme.tokens},
      space: {...?space, ...SpaceTokens.tokens},
      textStyles: {...?textStyles, ...$M3Text.tokens, ...$M2Text.tokens},
    );
  }

  MixThemeData copyWith({
    MixBreakpointsTokens? breakpoints,
    DesignTokenMap<ColorRef, Color>? colors,
    DesignTokenMap<SpaceToken, double>? space,
    DesignTokenMap<TextStyleRef, TextStyle>? textStyles,
  }) {
    return MixThemeData.raw(
      breakpoints: breakpoints ?? this.breakpoints,
      colors: colors ?? this.colors,
      space: space ?? this.space,
      textStyles: textStyles ?? this.textStyles,
    );
  }

  @override
  get props => [space, breakpoints, colors, textStyles];
}

class MixThemeResolver {
  final BuildContext context;

  const MixThemeResolver(this.context);

  MixThemeData get theme => MixTheme.of(context);

  TextDirection get directionality => Directionality.of(context);

  Color colorToken(ColorRef token) {
    final color = theme.colors[token]?.call(context);

    if (color == null) {
      throw Exception('Color token $token is not defined in Mix Theme');
    }

    return color;
  }

  TextStyle textStyleToken(TextStyleRef token) {
    final style = theme.textStyles[token]?.call(context);

    if (style == null) {
      throw Exception('TextStyle token $token is not defined in Mix Theme');
    }

    return style;
  }

  double spaceToken(double value) {
    final refs = theme.space.map((key, _) => MapEntry(key.ref, key));

    // Check if value is a reference.
    final token = refs[value];

    // If value is not a reference return value.
    if (token == null) {
      return value;
    }

    final space = theme.space[token]?.call(context);

    if (space == null) {
      throw Exception('Spacetoken $token is not defined in Mix Theme');
    }

    return space;
  }
}
