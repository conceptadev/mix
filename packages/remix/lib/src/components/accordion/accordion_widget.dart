part of 'accordion.dart';

typedef XAccordionHeaderBuilder = WidgetSpecBuilder<AccordionHeaderSpec>;
typedef XAccordionContentBuilder = WidgetSpecBuilder<TextSpec>;

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.header,
    required this.content,
    this.variants = const [],
    this.initiallyExpanded = false,
    this.style,
  });

  final XAccordionHeaderBuilder header;
  final XAccordionContentBuilder content;
  final AccordionStyle? style;
  final bool initiallyExpanded;
  final List<Variant> variants;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> with TickerProviderStateMixin {
  late MixWidgetStateController _controller;
  late MixWidgetStateController _contentController;

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController()
      ..selected = widget.initiallyExpanded;
    _contentController = MixWidgetStateController()
      ..selected = widget.initiallyExpanded;
  }

  void _handleTap() {
    _controller.selected = !_controller.selected;
    _contentController.selected = !_contentController.selected;
  }

  @override
  void dispose() {
    _controller.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.accordion;
    final configuration = SpecConfiguration(context, AccordionSpecUtility.self);

    final variantStyle =
        style.makeStyle(configuration).applyVariants(widget.variants);

    return RepaintBoundary(
      child: SpecBuilder(
        controller: _contentController,
        style: variantStyle,
        builder: (context) {
          final spec = AccordionSpec.of(context);

          final content = spec.contentContainer(
            child: widget.content(spec.textContent),
          );

          return spec.container(
            child: spec.flex(
              direction: Axis.vertical,
              children: [
                Pressable(
                  onPress: _handleTap,
                  controller: _controller,
                  child: SpecBuilder(
                    style: variantStyle,
                    builder: (context) {
                      final spec = AccordionSpec.of(context);

                      return widget.header(spec.header);
                    },
                  ),
                ),
                content,
              ],
            ),
          );
        },
      ),
    );
  }
}
