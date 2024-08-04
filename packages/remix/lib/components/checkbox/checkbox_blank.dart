part of 'checkbox.dart';

class RxBlankCheckbox extends StatefulWidget {
  const RxBlankCheckbox({
    super.key,
    this.disabled = false,
    this.value = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    required this.style,
  });

  final bool disabled;
  final bool value;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;
  final Style style;

  @override
  State<RxBlankCheckbox> createState() => _RxBlankCheckboxState();
}

class _RxBlankCheckboxState extends State<RxBlankCheckbox> {
  late final MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController();
    _controller.selected = widget.value;
    _controller.disabled = widget.disabled;
  }

  @override
  void didUpdateWidget(RxBlankCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (mounted) {
      if (oldWidget.value != widget.value) {
        _controller.selected = widget.value;
      }

      if (oldWidget.disabled != widget.disabled) {
        _controller.disabled = widget.disabled;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleOnPress() => widget.onChanged?.call(!widget.value);

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: widget.disabled ? null : _handleOnPress,
      enabled: !widget.disabled,
      controller: _controller,
      child: SpecBuilder(
        style: widget.style,
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
