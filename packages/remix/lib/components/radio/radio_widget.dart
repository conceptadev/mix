part of 'radio.dart';

class XRadio<T> extends StatefulWidget {
  const XRadio({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.disabled = false,
    this.style = const Style.empty(),
    required this.text,
  }) : _blank = false;

  const XRadio.blank({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.disabled = false,
    required this.style,
    required this.text,
  }) : _blank = true;

  final T value;
  final ValueChanged<T?> onChanged;
  final T? groupValue;
  final String text;
  final bool disabled;
  final Style style;

  final bool _blank;

  bool get _selected => value == groupValue;

  @override
  State<XRadio<T>> createState() => _XRadioState<T>();
}

class _XRadioState<T> extends State<XRadio<T>> {
  late final MixWidgetStateController _controller;
  void _handleOnPress() {
    widget.onChanged(widget.value);
  }

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()
      ..selected = widget._selected
      ..disabled = widget.disabled;
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
    return Pressable(
      onPress: widget.disabled ? null : _handleOnPress,
      enabled: !widget.disabled,
      controller: _controller,
      child: SpecBuilder(
        style:
            widget._blank ? widget.style : XRadioStyle.base.merge(widget.style),
        builder: (context) {
          final spec = RadioSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;
          final FlexWidget = spec.flex;
          final TextWidget = spec.text;

          return FlexWidget(
            direction: Axis.horizontal,
            children: [
              ContainerWidget(
                child: IndicatorWidget(),
              ),
              TextWidget(widget.text),
            ],
          );
        },
      ),
    );
  }
}
