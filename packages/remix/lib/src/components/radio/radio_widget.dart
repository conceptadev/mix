part of 'radio.dart';

class XRadio<T> extends StatefulWidget {
  const XRadio({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.disabled = false,
    this.style = const Style.empty(),
    this.variants = const [],
    required this.text,
  });

  final T value;
  final ValueChanged<T?> onChanged;
  final T? groupValue;
  final String text;
  final bool disabled;
  final Style style;
  final List<Variant> variants;

  bool get _selected => value == groupValue;

  @override
  State<XRadio<T>> createState() => _XRadioState<T>();
}

class _XRadioState<T> extends State<XRadio<T>> {
  late final MixWidgetStateController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()
      ..selected = widget._selected
      ..disabled = widget.disabled;
  }

  void _handleOnPress() {
    widget.onChanged(widget.value);
  }

  @override
  void didUpdateWidget(XRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget._selected != widget._selected) {
      _controller.selected = widget._selected;
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
    final styleFromTheme = _RemixThemeProvider.maybeOf(context)?.radio;

    return Pressable(
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : _handleOnPress,
      controller: _controller,
      child: SpecBuilder(
        style: (styleFromTheme ?? XRadioStyle.base)
            .merge(widget.style)
            .applyVariants(widget.variants),
        builder: (context) {
          final spec = RadioSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;
          final FlexWidget = spec.flex;
          final TextWidget = spec.text;

          return FlexWidget(
            direction: Axis.horizontal,
            children: [
              ContainerWidget(child: IndicatorWidget()),
              TextWidget(widget.text),
            ],
          );
        },
      ),
    );
  }
}
