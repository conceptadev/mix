part of 'radio.dart';

class RxBlankRadio<T> extends StatefulWidget {
  const RxBlankRadio({
    super.key,
    this.disabled = false,
    required this.style,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  });

  final T value;
  final ValueChanged<T?> onChanged;
  final T? groupValue;
  final Style style;
  final bool disabled;

  bool get _selected => value == groupValue;

  @override
  State<RxBlankRadio<T>> createState() => _RxBlankRadioState<T>();
}

class _RxBlankRadioState<T> extends State<RxBlankRadio<T>> {
  late final MixWidgetStateController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()
      ..selected = widget._selected
      ..disabled = widget.disabled;
  }

  void _handleOnPress() => widget.onChanged(!widget.value);

  @override
  void didUpdateWidget(RxBlankRadio<T> oldWidget) {
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
