part of 'checkbox.dart';

class Checkbox extends StatefulWidget {
  const Checkbox({
    super.key,
    this.disabled = false,
    this.value = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    this.style,
    this.variants = const [],
  });

  final bool disabled;
  final bool value;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;
  final CheckboxStyle? style;
  final List<Variant> variants;

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  late final MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController();
    _controller.selected = widget.value;
    _controller.disabled = widget.disabled;
  }

  void _handleOnPress() => widget.onChanged?.call(!widget.value);

  @override
  void didUpdateWidget(Checkbox oldWidget) {
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

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.checkbox;

    final configuration = SpecConfiguration(context, CheckboxSpecUtility.self);

    return Pressable(
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : _handleOnPress,
      controller: _controller,
      child: SpecBuilder(
        style: style
            .makeStyle(configuration)
            .applyVariants(widget.variants)
            .animate(),
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
