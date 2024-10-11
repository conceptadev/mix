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
import '../components/dialog/dialog.dart';
import '../components/chip/chip.dart';
import '../components/divider/divider.dart';
import '../components/icon_button/icon_button.dart';
import '../components/progress/progress.dart';
import '../components/radio/radio.dart';
import '../components/segmented_control/segmented_control.dart';
import '../components/select/select.dart';
import '../components/spinner/spinner.dart';
import '../components/switch/switch.dart';
import '../components/toast/toast.dart';
import 'remix_tokens.dart';

class RemixComponentTheme {
  final AccordionStyle accordion;
  final AvatarStyle avatar;
  final BadgeStyle badge;
  final ButtonStyle button;
  final CalloutStyle callout;
  final CardStyle card;
  final CheckboxStyle checkbox;
  final DialogStyle dialog;
  final ChipStyle chip;
  final DividerStyle divider;
  final IconButtonStyle iconButton;
  final ProgressStyle progress;
  final RadioStyle radio;
  final SegmentedControlStyle segmentedControl;
  final SelectStyle select;
  final SpinnerStyle spinner;
  final SwitchStyle switchComponent;
  final ToastStyle toast;

  const RemixComponentTheme({
    required this.accordion,
    required this.avatar,
    required this.badge,
    required this.button,
    required this.callout,
    required this.card,
    required this.checkbox,
    required this.dialog,
    required this.chip,
    required this.divider,
    required this.iconButton,
    required this.progress,
    required this.radio,
    required this.segmentedControl,
    required this.select,
    required this.spinner,
    required this.switchComponent,
    required this.toast,
  });

  factory RemixComponentTheme.base() {
    return const RemixComponentTheme(
      accordion: AccordionStyle(),
      avatar: AvatarStyle(),
      badge: BadgeStyle(),
      button: ButtonStyle(),
      callout: CalloutStyle(),
      card: CardStyle(),
      checkbox: CheckboxStyle(),
      dialog: DialogStyle(),
      chip: ChipStyle(),
      divider: DividerStyle(),
      iconButton: IconButtonStyle(),
      progress: ProgressStyle(),
      radio: RadioStyle(),
      segmentedControl: SegmentedControlStyle(),
      select: SelectStyle(),
      spinner: SpinnerStyle(),
      switchComponent: SwitchStyle(),
      toast: ToastStyle(),
    );
  }

  factory RemixComponentTheme.fortalezaLight() {
    return const RemixComponentTheme(
      accordion: FortalezaAccordionStyle(),
      avatar: FortalezaAvatarStyle(),
      badge: FortalezaBadgeStyle(),
      button: FortalezaButtonStyle(),
      callout: FortalezaCalloutStyle(),
      card: FortalezaCardStyle(),
      checkbox: FortalezaCheckboxStyle(),
      dialog: FortalezaDialogStyle(),
      chip: ChipStyle(),
      divider: FortalezaDividerStyle(),
      iconButton: FortalezaIconButtonStyle(),
      progress: FortalezaProgressStyle(),
      radio: FortalezaRadioStyle(),
      segmentedControl: FortalezaSegmentedControlStyle(),
      select: FortalezaSelectStyle(),
      spinner: FortalezaSpinnerStyle(),
      switchComponent: FortalezaSwitchStyle(),
      toast: FortalezaToastStyle(),
    );
  }

  factory RemixComponentTheme.fortalezaDark() {
    return RemixComponentTheme.fortalezaLight().copyWith(
      avatar: const FortalezaDarkAvatarStyle(),
      badge: const FortalezaDarkBadgeStyle(),
      segmentedControl: const FortalezaDarkSegmentedControlStyle(),
      select: const FortalezaDarkSelectStyle(),
      switchComponent: const FortalezaDarkSwitchStyle(),
    );
  }

  RemixComponentTheme copyWith({
    AccordionStyle? accordion,
    AvatarStyle? avatar,
    BadgeStyle? badge,
    ButtonStyle? button,
    CalloutStyle? callout,
    CardStyle? card,
    CheckboxStyle? checkbox,
    DialogStyle? dialog,
    ChipStyle? chip,
    DividerStyle? divider,
    IconButtonStyle? iconButton,
    ProgressStyle? progress,
    RadioStyle? radio,
    SegmentedControlStyle? segmentedControl,
    SelectStyle? select,
    SpinnerStyle? spinner,
    SwitchStyle? switchComponent,
    ToastStyle? toast,
  }) {
    return RemixComponentTheme(
      accordion: accordion ?? this.accordion,
      avatar: avatar ?? this.avatar,
      badge: badge ?? this.badge,
      button: button ?? this.button,
      callout: callout ?? this.callout,
      card: card ?? this.card,
      checkbox: checkbox ?? this.checkbox,
      dialog: dialog ?? this.dialog,
      chip: chip ?? this.chip,
      divider: divider ?? this.divider,
      iconButton: iconButton ?? this.iconButton,
      progress: progress ?? this.progress,
      radio: radio ?? this.radio,
      segmentedControl: segmentedControl ?? this.segmentedControl,
      select: select ?? this.select,
      spinner: spinner ?? this.spinner,
      switchComponent: switchComponent ?? this.switchComponent,
      toast: toast ?? this.toast,
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

enum ThemeMode {
  light,
  dark,
}

class RemixTheme extends StatelessWidget {
  const RemixTheme({
    super.key,
    required this.theme,
    required this.child,
    this.themeMode,
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

  static RemixThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_RemixThemeInherited>()
        ?.data;
  }

  final ThemeMode? themeMode;

  final RemixThemeData? theme;

  final RemixThemeData? darkTheme;
  final Widget child;

  RemixThemeData get _defaultThemeDark => RemixThemeData.base();
  RemixThemeData get _defaultThemeLight => RemixThemeData.base();

  RemixThemeData _defineRemixThemeData(BuildContext context) {
    if (themeMode != null) {
      return themeMode == ThemeMode.dark
          ? darkTheme ?? _defaultThemeDark
          : theme ?? _defaultThemeLight;
    }

    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = brightness == Brightness.dark;

    return isDark
        ? darkTheme ?? _defaultThemeDark
        : theme ?? _defaultThemeLight;
  }

  @override
  Widget build(BuildContext context) {
    final theme = _defineRemixThemeData(context);
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
