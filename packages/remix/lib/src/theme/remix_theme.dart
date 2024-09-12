import 'package:flutter/foundation.dart';
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
  final DividerStyle divider;
  final CalloutStyle callout;
  final CardStyle card;
  final CheckboxStyle checkbox;
  final ProgressStyle progress;
  final RadioStyle radio;
  final SelectStyle select;
  final SegmentedControlStyle segmentedControl;
  final SpinnerStyle spinner;
  final SwitchStyle switchComponent;

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
    return const RemixComponentTheme(
      accordion: AccordionStyle(),
      button: ButtonStyle(),
      avatar: AvatarStyle(),
      divider: DividerStyle(),
      badge: BadgeStyle(),
      callout: CalloutStyle(),
      card: CardStyle(),
      checkbox: CheckboxStyle(),
      progress: ProgressStyle(),
      radio: RadioStyle(),
      select: SelectStyle(),
      segmentedControl: SegmentedControlStyle(),
      spinner: SpinnerStyle(),
      switchComponent: SwitchStyle(),
    );
  }

  factory RemixComponentTheme.fortaleza() {
    return const RemixComponentTheme(
      accordion: FortalezaAccordionStyle(),
      button: FortalezaButtonStyle(),
      avatar: FortalezaAvatarStyle(),
      divider: FortalezaDividerStyle(),
      badge: FortalezaBadgeStyle(),
      callout: FortalezaCalloutStyle(),
      card: FortalezaCardStyle(),
      checkbox: FortalezaCheckboxStyle(),
      progress: FortalezaProgressStyle(),
      radio: FortalezaRadioStyle(),
      select: FortalezaSelectStyle(),
      segmentedControl: FortalezaSegmentedControlStyle(),
      spinner: FortalezaSpinnerStyle(),
      switchComponent: FortalezaSwitchStyle(),
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

  static RemixThemeData base() => RemixThemeData(
        components: RemixComponentTheme.base(),
        tokens: RemixTokens.base(),
      );

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
  const RemixTheme({
    super.key,
    required this.theme,
    required this.child,
    this.darkTheme,
  });

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

  final RemixThemeData? theme;

  final RemixThemeData? darkTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    final isDark = brightness == Brightness.dark;
    final theme = isDark && darkTheme != null
        ? darkTheme!
        : this.theme ?? RemixThemeData.base();

    final tokens = theme.tokens;

    return MixTheme(
      data: MixThemeData(
        colors: tokens.colors,
        spaces: tokens.spaces,
        textStyles: tokens.textStyles,
        radii: tokens.radii,
      ),
      child: _RemixThemeInherited(data: theme, child: child),
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
