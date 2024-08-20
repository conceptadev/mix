part of 'radio.dart';

class RxBlankRadio extends StatefulWidget {
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

  @override
  State<RxBlankRadio> createState() => _RxBlankRadioState();
}

class _RxBlankRadioState extends State<RxBlankRadio> {
  late final MixWidgetStateController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()
      ..selected = widget.value
      ..disabled = widget.disabled;
  }

  void _handleOnPress() => widget.onChanged(!widget.value);

  @override
  void didUpdateWidget(RxBlankRadio oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _controller.selected = widget.value;
    }

    if (oldWidget.disabled != widget.disabled) {
      _controller.disabled = widget.disabled;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : _handleOnPress,
      controller: _controller,
      child: SpecBuilder(
        builder: (context) {
          final spec = RadioSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;

          return ContainerWidget(child: IndicatorWidget());
        },
        style: widget.style,
      ),
    );
  }
}
