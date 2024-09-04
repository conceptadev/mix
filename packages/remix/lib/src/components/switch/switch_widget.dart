part of 'switch.dart';

class XSwitch extends StatefulWidget {
  const XSwitch({
    super.key,
    this.disabled = false,
    required this.value,
    required this.onChanged,
    this.style = const Style.empty(),
    this.variants = const [],
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Style style;
  final bool disabled;
  final List<Variant> variants;

  @override
  State<XSwitch> createState() => _RxBlankSwitchState();
}

class _RxBlankSwitchState extends State<XSwitch> {
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
  void didUpdateWidget(XSwitch oldWidget) {
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
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.switchComponent;

    return Pressable(
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : _handleOnPress,
      controller: _controller,
      child: SpecBuilder(
        style: (styleFromTheme ?? XSwitchStyle.base)
            .merge(widget.style)
            .applyVariants(widget.variants)
            .animate(
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
            ),
        builder: (context) {
          final spec = SwitchSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;

          return ContainerWidget(child: IndicatorWidget());
        },
      ),
    );
  }
}
