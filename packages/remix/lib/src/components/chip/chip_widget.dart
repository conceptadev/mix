part of 'chip.dart';

class Chip extends StatefulWidget {
  const Chip({
    super.key,
    this.value = false,
    required this.label,
    this.disabled = false,
    this.iconLeft,
    this.iconRight,
    this.variants = const [],
    required this.onPressed,
    this.style,
  });

  final bool value;
  final String label;
  final IconData? iconLeft;
  final IconData? iconRight;
  final VoidCallback? onPressed;
  final bool disabled;
  final List<Variant> variants;
  final ChipStyle? style;

  @override
  State<Chip> createState() => _ChipState();
}

class _ChipState extends State<Chip> {
  late final MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController();
    _controller.selected = widget.value;
    _controller.disabled = widget.disabled;
  }

  @override
  void didUpdateWidget(Chip oldWidget) {
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
    final style = widget.style ?? context.remix.components.chip;
    final configuration = SpecConfiguration(context, ChipSpecUtility.self);

    return Pressable(
      enabled: !widget.disabled,
      onPress: widget.disabled ? null : widget.onPressed,
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(widget.variants),
        builder: (context) {
          final spec = ChipSpec.of(context);

          return spec.container(
            child: spec.flex(
              direction: Axis.horizontal,
              children: [
                if (widget.iconLeft != null) spec.icon(widget.iconLeft),
                spec.label(widget.label),
                if (widget.iconRight != null) spec.icon(widget.iconRight),
              ],
            ),
          );
        },
      ),
    );
  }
}
