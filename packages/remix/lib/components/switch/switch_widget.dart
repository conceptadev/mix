part of 'switch.dart';

class RxSwitch extends StatelessWidget {
  const RxSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = SwitchVariant.solid,
    this.size = SwitchSize.medium,
    this.disabled = false,
    this.style,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final SwitchVariant variant;
  final SwitchSize size;
  final Style? style;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return RxBlankSwitch(
      disabled: disabled,
      value: value,
      onChanged: onChanged,
      style: _buildSwitchStyle(style, [size, variant]),
    );
  }
}
