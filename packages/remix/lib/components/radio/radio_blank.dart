part of 'radio.dart';

class RxBlankRadio extends StatelessWidget {
  const RxBlankRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.disabled = false,
    required this.style,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Style style;
  final bool disabled;

  void _handleOnPress() => onChanged.call(!value);

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: disabled ? null : _handleOnPress,
      enabled: !disabled,
      child: SpecBuilder(
        style: style,
        builder: (context) {
          final spec = RadioSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;

          return ContainerWidget(
            child: value ? IndicatorWidget() : null,
          );
        },
      ),
    );
  }
}
