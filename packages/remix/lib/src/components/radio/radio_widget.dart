part of 'radio.dart';

class Radio<T> extends StatefulWidget {
  const Radio({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.disabled = false,
    this.style,
    this.variants = const [],
    required this.label,
  });

  final T value;
  final ValueChanged<T?> onChanged;
  final T? groupValue;
  final String label;
  final bool disabled;
  final RadioStyle? style;
  final List<Variant> variants;

  bool get _selected => value == groupValue;

  @override
  State<Radio<T>> createState() => _RadioState<T>();
}

class _RadioState<T> extends State<Radio<T>> {
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
  void didUpdateWidget(Radio<T> oldWidget) {
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
    final style = widget.style ?? context.remix.components.radio;
    final configuration = SpecConfiguration(context, RadioSpecUtility.self);

    return Pressable(
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : _handleOnPress,
      controller: _controller,
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(widget.variants),
        builder: (context) {
          final spec = RadioSpec.of(context);

          final ContainerWidget = spec.container;
          final IndicatorWidget = spec.indicator;
          final FlexWidget = spec.flex;
          final TextWidget = spec.text;

          return FlexWidget(
            children: [
              ContainerWidget(child: IndicatorWidget()),
              TextWidget(widget.label),
            ],
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
