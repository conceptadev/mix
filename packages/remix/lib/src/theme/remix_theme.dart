import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../components/accordion/accordion.dart';
import '../components/avatar/avatar.dart';
import '../components/badge/badge.dart';
import '../components/button/button.dart';
import '../components/callout/callout.dart';
import '../components/card/card.dart';
import '../components/checkbox/checkbox.dart';
import '../components/progress/progress.dart';
import '../components/radio/radio.dart';
import '../components/select/select.dart';
import '../components/spinner/spinner.dart';
import '../components/switch/switch.dart';
import 'remix_tokens.dart';

class RemixComponentTheme {
  final Style? button;
  final Style? avatar;
  final Style? badge;
  final Style? callout;
  final Style? card;
  final Style? checkbox;
  final Style? progress;
  final Style? radio;
  final Style? select;
  final Style? spinner;
  final Style? accordion;
  final Style? switchComponent;

  const RemixComponentTheme({
    this.accordion,
    this.button,
    this.avatar,
    this.badge,
    this.callout,
    this.card,
    this.checkbox,
    this.progress,
    this.radio,
    this.select,
    this.spinner,
    this.switchComponent,
  });

  const RemixComponentTheme.blank()
      : button = const Style.empty(),
        accordion = const Style.empty(),
        avatar = const Style.empty(),
        badge = const Style.empty(),
        callout = const Style.empty(),
        card = const Style.empty(),
        checkbox = const Style.empty(),
        progress = const Style.empty(),
        radio = const Style.empty(),
        select = const Style.empty(),
        spinner = const Style.empty(),
        switchComponent = const Style.empty();

  factory RemixComponentTheme.base() {
    return RemixComponentTheme(
      accordion: XAccordionStyle.base,
      button: XButtonStyle.base,
      avatar: XAvatarStyle.base,
      badge: XBadgeStyle.base,
      callout: XCalloutStyle.base,
      card: XCardStyle.base,
      checkbox: XCheckboxStyle.base,
      progress: XProgressStyle.base,
      radio: XRadioStyle.base,
      select: XSelectStyle.base,
      spinner: XSpinnerStyle.base,
      switchComponent: XSwitchStyle.base,
    );
  }

  factory RemixComponentTheme.remix() {
    return RemixComponentTheme(
      accordion: XAccordionThemeStyle.value,
      button: XButtonThemeStyle.value,
      avatar: XAvatarThemeStyle.value,
      badge: XBadgeThemeStyle.value,
      callout: XCalloutThemeStyle.value,
      card: XCardThemeStyle.value,
      checkbox: XCheckboxThemeStyle.value,
      progress: XProgressThemeStyle.value,
      radio: XRadioThemeStyle.value,
      select: XSelectThemeStyle.value,
      spinner: XSpinnerThemeStyle.value,
      switchComponent: XSwitchThemeStyle.value,
    );
  }
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
