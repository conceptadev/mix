import '../../../components/accordion/accordion.dart';
import '../../../components/avatar/avatar.dart';
import '../../../components/badge/badge.dart';
import '../../../components/button/button.dart';
import '../../../components/callout/callout.dart';
import '../../../components/card/card.dart';
import '../../../components/checkbox/checkbox.dart';
import '../../../components/chip/chip.dart';
import '../../../components/dialog/dialog.dart';
import '../../../components/divider/divider.dart';
import '../../../components/icon_button/icon_button.dart';
import '../../../components/menu_item/menu_item.dart';
import '../../../components/progress/progress.dart';
import '../../../components/radio/radio.dart';
import '../../../components/scaffold/scaffold.dart';
import '../../../components/segmented_control/segmented_control.dart';
import '../../../components/select/select.dart';
import '../../../components/slider/slider.dart';
import '../../../components/spinner/spinner.dart';
import '../../../components/switch/switch.dart';
import '../../../components/textfield/textfield.dart';
import '../../../components/toast/toast.dart';
import '../../../core/theme/component.dart';
import 'accordion_theme.dart';
import 'avatar_theme.dart';
import 'badge_theme.dart';
import 'button_theme.dart';
import 'callout_theme.dart';
import 'card_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'dialog_theme.dart';
import 'divider_theme.dart';
import 'icon_button_theme.dart';
import 'menu_item_theme.dart';
import 'progress_theme.dart';
import 'radio_theme.dart';
import 'scaffold_theme.dart';
import 'segmented_control_theme.dart';
import 'select_theme.dart';
import 'slider_theme.dart';
import 'spinner_theme.dart';
import 'switch_theme.dart';
import 'textfield_theme.dart';
import 'toast_theme.dart';

class FortalezaComponentTheme extends RemixComponentTheme {
  static const FortalezaComponentTheme light = FortalezaComponentTheme();
  static const FortalezaComponentTheme dark = FortalezaComponentTheme(
    avatar: FortalezaDarkAvatarStyle(),
    badge: FortalezaDarkBadgeStyle(),
    segmentedControl: FortalezaDarkSegmentedControlStyle(),
    select: FortalezaDarkSelectStyle(),
    switchComponent: FortalezaDarkSwitchStyle(),
  );

  const FortalezaComponentTheme({
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
    MenuItemStyle? menuItem,
    ProgressStyle? progress,
    RadioStyle? radio,
    ScaffoldStyle? scaffold,
    SegmentedControlStyle? segmentedControl,
    SelectStyle? select,
    SpinnerStyle? spinner,
    SwitchStyle? switchComponent,
    TextFieldStyle? textField,
    ToastStyle? toast,
    SliderStyle? slider,
  }) : super(
          accordion: const FortalezaAccordionStyle(),
          avatar: const FortalezaAvatarStyle(),
          badge: const FortalezaBadgeStyle(),
          button: const FortalezaButtonStyle(),
          callout: const FortalezaCalloutStyle(),
          card: const FortalezaCardStyle(),
          checkbox: const FortalezaCheckboxStyle(),
          dialog: const FortalezaDialogStyle(),
          chip: const FortalezaChipStyle(),
          divider: const FortalezaDividerStyle(),
          iconButton: const FortalezaIconButtonStyle(),
          menuItem: const FortalezaMenuItemStyle(),
          progress: const FortalezaProgressStyle(),
          radio: const FortalezaRadioStyle(),
          scaffold: const FortalezaScaffoldStyle(),
          segmentedControl: const FortalezaSegmentedControlStyle(),
          select: const FortalezaSelectStyle(),
          spinner: const FortalezaSpinnerStyle(),
          switchComponent: const FortalezaSwitchStyle(),
          textField: const FortalezaTextFieldStyle(),
          toast: const FortalezaToastStyle(),
          slider: const FortalezaSliderStyle(),
        );
}
