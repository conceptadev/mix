part of 'radio.dart';

class RxRadio<T> extends StatelessWidget {
  const RxRadio({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.variant = RadioVariant.solid,
    this.size = RadioSize.medium,
    this.disabled = false,
    this.style,
  });

  final T value;
  final ValueChanged<T?> onChanged;
  final T? groupValue;
  final bool disabled;
  final RadioVariant variant;
  final RadioSize size;
  final Style? style;

  @override
  Widget build(BuildContext context) {
    return RxBlankRadio(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      disabled: disabled,
      style: _buildDefaultRadioStyle(style, [size, variant]),
    );
  }
}
