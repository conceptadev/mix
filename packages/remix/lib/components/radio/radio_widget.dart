part of 'radio.dart';

class RxRadio extends StatelessWidget {
  const RxRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = RadioVariant.solid,
    this.size = RadioSize.medium,
    this.disabled = false,
    this.style,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final RadioVariant variant;
  final RadioSize size;
  final Style? style;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return RxBlankRadio(
      value: value,
      onChanged: onChanged,
      disabled: disabled,
      style: _buildDefaultRadioStyle(style, [size, variant]),
    );
  }
}
