part of 'checkbox.dart';

class RxCheckbox extends StatelessWidget {
  const RxCheckbox({
    super.key,
    this.disabled = false,
    this.value = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    this.style,
    this.size = CheckboxSize.medium,
    this.variant = CheckboxVariant.soft,
  });

  final bool disabled;
  final bool value;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final Style? style;

  final CheckboxSize size;
  final CheckboxVariant variant;

  @override
  Widget build(BuildContext context) {
    return RxBlankCheckbox(
      value: value,
      onChanged: onChanged,
      iconChecked: iconChecked,
      iconUnchecked: iconUnchecked,
      disabled: disabled,
      style: _buildCheckboxStyle(style, [size, variant]),
    );
  }
}
