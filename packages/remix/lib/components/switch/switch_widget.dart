part of 'switch.dart';

class RxSwitch extends StatefulWidget {
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
  State<RxSwitch> createState() => _RxSwitchState();
}

class _RxSwitchState extends State<RxSwitch> {
  late final MixWidgetStateController _controller;
  void _handleOnPress() => widget.onChanged.call(!widget.value);

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController();
  }

  @override
  void didUpdateWidget(RxSwitch oldWidget) {
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
      child: SpecBuilder(
        style: _buildSwitchStyle(widget.style, [
          widget.size,
          widget.variant,
        ]),
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
