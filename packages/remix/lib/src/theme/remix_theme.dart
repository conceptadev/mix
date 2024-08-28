import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'remix_tokens.dart';

class RemixComponentTheme {
  final Style? button;
  final Style? avatar;
  final Style? badge;
  final Style? callout;
  final Style? checkbox;
  final Style? progress;
  final Style? radio;
  final Style? select;
  final Style? spinner;
  final Style? switchComponent;

  const RemixComponentTheme({
    this.button,
    this.avatar,
    this.badge,
    this.callout,
    this.checkbox,
    this.progress,
    this.radio,
    this.select,
    this.spinner,
    this.switchComponent,
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

  // static MixThemeData light = _lightRemixTokens;
  // static MixThemeData dark = _darkRemixTokens;

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: MixThemeData(
        colors: tokens.colors,
        spaces: tokens.spaces,
        textStyles: tokens.textStyles,
        radii: tokens.radii,
      ),
      child: RemixThemeProvider(theme: components, child: child),
    );
  }
}

class RemixThemeProvider extends InheritedWidget {
  const RemixThemeProvider({
    super.key,
    required super.child,
    required this.theme,
  });

  static RemixComponentTheme? maybeOf(BuildContext context) {
    final RemixThemeProvider? provider =
        context.dependOnInheritedWidgetOfExactType<RemixThemeProvider>();

    return provider?.theme;
  }

  final RemixComponentTheme theme;

  @override
  bool updateShouldNotify(RemixThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}
