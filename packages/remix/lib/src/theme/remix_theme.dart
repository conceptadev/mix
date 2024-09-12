import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../components/accordion/accordion.dart';
import '../components/avatar/avatar.dart';
import '../components/badge/badge.dart';
import '../components/button/button.dart';
import '../components/callout/callout.dart';
import '../components/card/card.dart';
import '../components/checkbox/checkbox.dart';
import '../components/divider/divider.dart';
import '../components/progress/progress.dart';
import '../components/radio/radio.dart';
import '../components/segmented_control/segmented_control.dart';
import '../components/select/select.dart';
import '../components/spinner/spinner.dart';
import '../components/switch/switch.dart';
import 'remix_tokens.dart';

class RemixComponentTheme {
  final AccordionStyle accordion;
  final AvatarStyle avatar;
  final ButtonStyle button;
  final BadgeStyle badge;
  final Style divider;
  final CalloutStyle callout;
  final Style card;
  final Style checkbox;
  final Style progress;
  final Style radio;
  final Style select;
  final Style segmentedControl;
  final Style spinner;
  final Style switchComponent;

  const RemixComponentTheme({
    required this.accordion,
    required this.button,
    required this.avatar,
    required this.divider,
    required this.badge,
    required this.callout,
    required this.card,
    required this.checkbox,
    required this.progress,
    required this.radio,
    required this.select,
    required this.segmentedControl,
    required this.spinner,
    required this.switchComponent,
  });

  factory RemixComponentTheme.base() {
    return RemixComponentTheme(
      accordion: const AccordionStyle(),
      button: const ButtonStyle(),
      avatar: const AvatarStyle(),
      divider: XDividerStyle.base,
      badge: const BadgeStyle(),
      callout: const CalloutStyle(),
      card: XCardStyle.base,
      checkbox: XCheckboxStyle.base,
      progress: XProgressStyle.base,
      radio: XRadioStyle.base,
      select: XSelectStyle.base,
      segmentedControl: XSegmentedControlStyle.base,
      spinner: XSpinnerStyle.base,
      switchComponent: XSwitchStyle.base,
    );
  }

  factory RemixComponentTheme.fortaleza() {
    return RemixComponentTheme(
      accordion: const AccordionStyle(),
      button: const FortalezaButtonStyle(),
      avatar: const FortalezaAvatarStyle(),
      divider: XDividerThemeStyle.value,
      badge: const BadgeStyle(),
      callout: const CalloutStyle(),
      card: XCardThemeStyle.value,
      checkbox: XCheckboxThemeStyle.value,
      progress: XProgressThemeStyle.value,
      radio: XRadioThemeStyle.value,
      select: XSelectThemeStyle.value,
      segmentedControl: XSegmentedControlThemeStyle.value,
      spinner: XSpinnerThemeStyle.value,
      switchComponent: XSwitchThemeStyle.value,
    );
  }
}

extension BuildContextRemixThemeX on BuildContext {
  RemixThemeData get remix => RemixTheme.of(this);
}

class RemixThemeData {
  final RemixComponentTheme components;
  final RemixTokens tokens;
  const RemixThemeData({required this.components, required this.tokens});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RemixThemeData &&
        other.components == components &&
        other.tokens == tokens;
  }

  @override
  int get hashCode => components.hashCode ^ tokens.hashCode;
}

class RemixTheme extends StatelessWidget {
  const RemixTheme({super.key, required this.data, required this.child});

  static RemixThemeData of(BuildContext context) {
    final _RemixThemeInherited? provider =
        context.dependOnInheritedWidgetOfExactType<_RemixThemeInherited>();

    if (provider == null) {
      throw FlutterError(
        'RemixTheme.of() called with a context that does not contain a RemixTheme.\n'
        'No RemixTheme ancestor could be found starting from the context that was passed to RemixTheme.of(). '
        'This can happen because the context you used comes from a widget above the RemixTheme.\n'
        'The context used was:\n'
        '  $context',
      );
    }

    return provider.data;
  }

  final RemixThemeData data;
  final Widget child;

  // static MixThemeData light = _lightRemixTokens;
  // static MixThemeData dark = _darkRemixTokens;

  @override
  Widget build(BuildContext context) {
    final tokens = data.tokens;

    return MixTheme(
      data: MixThemeData(
        colors: tokens.colors,
        spaces: tokens.spaces,
        textStyles: tokens.textStyles,
        radii: tokens.radii,
      ),
      child: _RemixThemeInherited(data: data, child: child),
    );
  }
}

class _RemixThemeInherited extends InheritedWidget {
  const _RemixThemeInherited({required super.child, required this.data});

  final RemixThemeData data;

  @override
  bool updateShouldNotify(_RemixThemeInherited oldWidget) {
    return data != oldWidget.data;
  }
}
