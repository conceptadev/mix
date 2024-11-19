import '../../core/theme/component.dart';
import 'components/accordion_theme.dart';
import 'components/avatar_theme.dart';
import 'components/badge_theme.dart';
import 'components/button_theme.dart';
import 'components/callout_theme.dart';
import 'components/card_theme.dart';
import 'components/checkbox_theme.dart';
import 'components/chip_theme.dart';
import 'components/dialog_theme.dart';
import 'components/divider_theme.dart';
import 'components/icon_button_theme.dart';
import 'components/menu_item_theme.dart';
import 'components/progress_theme.dart';
import 'components/radio_theme.dart';
import 'components/scaffold_theme.dart';
import 'components/segmented_control_theme.dart';
import 'components/select_theme.dart';
import 'components/slider_theme.dart';
import 'components/spinner_theme.dart';
import 'components/switch_theme.dart';
import 'components/textfield_theme.dart';
import 'components/toast_theme.dart';

class FortalezaComponentTheme extends RemixComponentTheme {
  const FortalezaComponentTheme({
    required super.accordion,
    required super.avatar,
    required super.badge,
    required super.button,
    required super.callout,
    required super.card,
    required super.checkbox,
    required super.dialog,
    required super.chip,
    required super.divider,
    required super.iconButton,
    required super.menuItem,
    required super.progress,
    required super.radio,
    required super.scaffold,
    required super.segmentedControl,
    required super.select,
    required super.spinner,
    required super.switchComponent,
    required super.textField,
    required super.toast,
    required super.slider,
  });

  factory FortalezaComponentTheme.light() {
    return const FortalezaComponentTheme(
      accordion: FortalezaAccordionStyle(),
      avatar: FortalezaAvatarStyle(),
      badge: FortalezaBadgeStyle(),
      button: FortalezaButtonStyle(),
      callout: FortalezaCalloutStyle(),
      card: FortalezaCardStyle(),
      checkbox: FortalezaCheckboxStyle(),
      dialog: FortalezaDialogStyle(),
      chip: FortalezaChipStyle(),
      divider: FortalezaDividerStyle(),
      iconButton: FortalezaIconButtonStyle(),
      menuItem: FortalezaMenuItemStyle(),
      progress: FortalezaProgressStyle(),
      radio: FortalezaRadioStyle(),
      scaffold: FortalezaScaffoldStyle(),
      segmentedControl: FortalezaSegmentedControlStyle(),
      select: FortalezaSelectStyle(),
      spinner: FortalezaSpinnerStyle(),
      switchComponent: FortalezaSwitchStyle(),
      textField: FortalezaTextFieldStyle(),
      toast: FortalezaToastStyle(),
      slider: FortalezaSliderStyle(),
    );
  }

  factory FortalezaComponentTheme.dark() {
    return FortalezaComponentTheme.light().copyWith(
      avatar: const FortalezaDarkAvatarStyle(),
      badge: const FortalezaDarkBadgeStyle(),
      segmentedControl: const FortalezaDarkSegmentedControlStyle(),
      select: const FortalezaDarkSelectStyle(),
      switchComponent: const FortalezaDarkSwitchStyle(),
    );
  }

  @override
  FortalezaComponentTheme copyWith({
    covariant FortalezaAccordionStyle? accordion,
    covariant FortalezaAvatarStyle? avatar,
    covariant FortalezaBadgeStyle? badge,
    covariant FortalezaButtonStyle? button,
    covariant FortalezaCalloutStyle? callout,
    covariant FortalezaCardStyle? card,
    covariant FortalezaCheckboxStyle? checkbox,
    covariant FortalezaDialogStyle? dialog,
    covariant FortalezaChipStyle? chip,
    covariant FortalezaDividerStyle? divider,
    covariant FortalezaIconButtonStyle? iconButton,
    covariant FortalezaMenuItemStyle? menuItem,
    covariant FortalezaProgressStyle? progress,
    covariant FortalezaRadioStyle? radio,
    covariant FortalezaScaffoldStyle? scaffold,
    covariant FortalezaSegmentedControlStyle? segmentedControl,
    covariant FortalezaSelectStyle? select,
    covariant FortalezaSpinnerStyle? spinner,
    covariant FortalezaSwitchStyle? switchComponent,
    covariant FortalezaTextFieldStyle? textField,
    covariant FortalezaToastStyle? toast,
    covariant FortalezaSliderStyle? slider,
  }) {
    return FortalezaComponentTheme(
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
      menuItem: menuItem ?? this.menuItem,
      progress: progress ?? this.progress,
      radio: radio ?? this.radio,
      scaffold: scaffold ?? this.scaffold,
      segmentedControl: segmentedControl ?? this.segmentedControl,
      select: select ?? this.select,
      spinner: spinner ?? this.spinner,
      switchComponent: switchComponent ?? this.switchComponent,
      textField: textField ?? this.textField,
      toast: toast ?? this.toast,
      slider: slider ?? this.slider,
    );
  }
}
