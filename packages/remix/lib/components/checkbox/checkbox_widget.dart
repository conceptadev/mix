part of 'checkbox.dart';

class RxCheckbox extends StatefulWidget {
  const RxCheckbox({
    super.key,
    this.disabled = false,
    this.value = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    this.style,
    this.size = CheckboxSize.medium,
    this.variant = CheckboxVariant.solid,
  });

  final bool disabled;
  final bool value;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final Style? style;

  final CheckboxSize size;
  final CheckboxVariant variant;

  @override
  State<RxCheckbox> createState() => _RxCheckboxState();
}

class _RxCheckboxState extends State<RxCheckbox> {
  late final MixWidgetStateController _controller;
  late Style _style;

  void _handleOnPress() => widget.onChanged?.call(!widget.value);

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController();
    _style = _buildCheckboxStyle(widget.style, [widget.size, widget.variant]);
  }

  @override
  void didUpdateWidget(RxCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _controller.selected = widget.value;
    }

    if (oldWidget.disabled != widget.disabled) {
      _controller.disabled = widget.disabled;
    }

    if (oldWidget.style != widget.style ||
        oldWidget.size != widget.size ||
        oldWidget.variant != widget.variant) {
      _style = _buildCheckboxStyle(widget.style, [widget.size, widget.variant]);
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
        controller: _controller,
        style: _style,
        builder: (context) {
          final spec = CheckboxSpec.of(context);

          final ContainerWidget = spec.container;
          final IconWidget = spec.indicator;

          return ContainerWidget(
            child: IconWidget(
              widget.value
                  ? widget.iconChecked
                  : widget.iconUnchecked ?? widget.iconChecked,
            ),
          );
        },
      ),
    );
  }
}
