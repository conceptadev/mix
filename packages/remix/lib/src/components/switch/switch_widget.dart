part of 'switch.dart';

class Switch extends StatefulWidget {
  const Switch({
    super.key,
    this.disabled = false,
    required this.value,
    required this.onChanged,
    this.style,
    this.variants = const [],
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final SwitchStyle? style;
  final bool disabled;
  final List<Variant> variants;

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
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
  void didUpdateWidget(Switch oldWidget) {
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
    final style = widget.style ?? context.remix.components.switchComponent;

    final configuration = SpecConfiguration(context, SwitchSpecUtility.self);

    return Pressable(
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(widget.variants),
        builder: (context) {
          final spec = SwitchSpec.of(context);

          final containerWidget = spec.container;
          final indicatorWidget = spec.indicator;

          return containerWidget(child: indicatorWidget());
        },
      ),
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : _handleOnPress,
      controller: _controller,
    );
  }
}
