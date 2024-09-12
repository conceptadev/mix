part of 'accordion.dart';

typedef XAccordionHeaderBuilder = WidgetSpecBuilder<AccordionHeaderSpec>;
typedef XAccordionContentBuilder = WidgetSpecBuilder<TextSpec>;

const Variant openedVariant = Variant('accordion.opened');

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
  late bool opened = widget.initiallyExpanded;
  late final _controller = MixWidgetStateController();

  void _handleTap() {
    setState(() {
      _controller.selected = !opened;
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.accordion;
    final configuration = SpecConfiguration(context, AccordionSpecUtility.self);

    final variantStyle =
        style.makeStyle(configuration).applyVariants(widget.variants);

    return RepaintBoundary(
      child: SpecBuilder(
        controller: _controller,
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
