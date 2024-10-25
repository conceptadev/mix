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
    this.label,
  });

  /// Whether the checkbox is disabled.
  final bool disabled;

  /// Whether the checkbox is checked.
  final bool value;

  /// The icon to display when the checkbox is checked.
  final IconData iconChecked;

  /// The icon to display when the checkbox is unchecked.
  final IconData? iconUnchecked;

  /// The callback function that is called when the checkbox is tapped.
  final ValueChanged<bool>? onChanged;

  /// The style of the checkbox.
  final CheckboxStyle? style;

  /// The variants of the checkbox.
  final List<Variant> variants;

  /// An optional label for the checkbox.
  final String? label;

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

          final ContainerWidget = spec.indicatorContainer;
          final ContainerLayout = spec.layout;
          final IconWidget = spec.indicatorIcon;

          return ContainerLayout(
            direction: Axis.horizontal,
            children: [
              ContainerWidget(
                child: IconWidget(
                  widget.value
                      ? widget.iconChecked
                      : widget.iconUnchecked ?? widget.iconChecked,
                ),
              ),
              if (widget.label != null) spec.label(widget.label!),
            ],
          );
        },
      ),
    );
  }
}
