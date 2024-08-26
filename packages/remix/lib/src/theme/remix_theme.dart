import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../components/button/button.dart';
import '../helpers/color_palette.dart';

part 'color_tokens.dart';
part 'radius_tokens.dart';
part 'space_tokens.dart';
part 'text_style_tokens.dart';

final $rx = _RemixTokenRef();

class _RemixTokenRef {
  _RemixTokenRef();
  final color = RemixColors();

  final space = RemixSpace();

  final radii = RemixRadius();

  final text = RemixTypography();
}

final _baseRemixTokens = MixThemeData(
  colors: remixColorTokens,
  textStyles: remixTextTokens,
  spaces: remixSpaceTokens,
  radii: remixRadiusTokens,
);

final _lightRemixTokens = _baseRemixTokens;
final _darkRemixTokens = _baseRemixTokens.copyWith(
  colors: remixDarkColorTokens,
);

class RemixTokens {
  const RemixTokens({
    required this.colors,
    required this.textStyles,
    required this.spaces,
    required this.radii,
  });

  final Map<ColorToken, Color> colors;
  final Map<TextStyleToken, TextStyle> textStyles;
  final Map<SpaceToken, double> spaces;
  final Map<RadiusToken, Radius> radii;
}

class RemixComponentTheme {
  final XButtonStyle buttonStyle;
  const RemixComponentTheme({
    required this.buttonStyle,
  });
}

class RemixTheme extends StatelessWidget {
  const RemixTheme({
    super.key,
    required this.child,
    required this.components,
    required this.tokens,
  });

  final Widget child;

  final RemixTokens tokens;
  final RemixComponentTheme components;

  static MixThemeData light = _lightRemixTokens;
  static MixThemeData dark = _darkRemixTokens;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: MixThemeData(
        colors: tokens.colors,
        textStyles: tokens.textStyles,
        spaces: tokens.spaces,
        radii: tokens.radii,
      ),
      child: child,
    );
  }
}

class RemixThemeProvider extends InheritedWidget {
  const RemixThemeProvider({
    super.key,
    required super.child,
    required this.theme,
  });

  final RemixTheme theme;

  static RemixTheme? maybeOf(BuildContext context) {
    final RemixThemeProvider? provider =
        context.dependOnInheritedWidgetOfExactType<RemixThemeProvider>();
    return provider!.theme;
  }

  @override
  bool updateShouldNotify(RemixThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}

extension ColorUtilityX<T extends Attribute> on ColorUtility<T> {
  T $black() => ref($rx.color.black());
  T $white() => ref($rx.color.white());
  T $neutral([int? step]) => ref($rx.color.neutral(step));
  T $neutralAlpha([int? step]) => ref($rx.color.neutralAlpha(step));
  T $accent([int? step]) => ref($rx.color.accent(step));
  T $accentAlpha([int? step]) => ref($rx.color.accentAlpha(step));
}

extension SpacingSideUtilityX<T extends Attribute> on SpacingSideUtility<T> {
  T $space(int step) => ref($rx.space(step));
}

extension GapUtilityX<T extends Attribute> on GapUtility<T> {
  T $space(int step) => ref($rx.space(step));
}

extension TextStyleUtilityX<T extends Attribute> on TextStyleUtility<T> {
  T $text(int level) => ref($rx.text(level));
}
