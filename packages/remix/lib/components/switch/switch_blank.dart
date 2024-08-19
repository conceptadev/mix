part of 'switch.dart';

class RxBlankSwitch extends StatefulWidget {
  const RxBlankSwitch({
    super.key,
    this.disabled = false,
    required this.value,
    required this.onChanged,
    required this.style,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Style style;
  final bool disabled;

  @override
  State<RxBlankSwitch> createState() => _RxBlankSwitchState();
}

class _RxBlankSwitchState extends State<RxBlankSwitch> {
  late final MixWidgetStateController _controller;
  void _handleOnPress() => widget.onChanged.call(!widget.value);

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()
      ..selected = widget.value
      ..disabled = widget.disabled;
  }

  @override
  void didUpdateWidget(RxBlankSwitch oldWidget) {
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
      onPress: widget.disabled ? null : _handleOnPress,
      enabled: !widget.disabled,
      controller: _controller,
      child: SpecBuilder(
        style: widget.style,
        builder: (context) {
          final spec = SwitchSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;

          return ContainerWidget(
            child: IndicatorWidget(),
          );
        },
      ),
    );
  }
}
